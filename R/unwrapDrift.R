#' Unwrap Time Drift in Acoustic Telemetry Data
#'
#' This function reconstructs continuous drift values from a vector of
#' fractional seconds, removing discontinuities caused by the 0–1 wrapping
#' of fractional second data and by emission granularities smaller than 1
#' second.
#'
#' The unwrapping process starts by estimating a general linear drift rate
#' (slope) from the detection timestamps. This slope is used to predict the
#' expected position of each detection along a continuous trend. Each observed
#' fractional second value is then adjusted—by shifting it by a multiple of
#' the transmitter's emission granularity—so that it aligns with the predicted
#' continuous trend.
#'
#' @param fs A numeric vector of fractional seconds (0-1 range).
#' @param time.stamps A `POSIXct` vector of detection time stamps.
#' @param granularity A numeric value specifying the emission granularity of the
#'   transmitter. Defaults to `1` for Thelma Biotel transmitters. Use `0.5` for
#'   Lotek transmitters.
#'
#' @return A numeric vector representing the unwrapped, continuous time drift
#'   values (in seconds), starting at 0.
#'
#' @examples
#' # Load detection data and subset one individual and deployment
#' data(fish_data)
#' detect <- fish_data$detection_data
#' detect <- detect[fish_id == "CORHIP-892" & deployment_id == 42]
#'
#' # Extract fractional seconds (0-1 constrained)
#' detect$fs <- fractSec(time.stamps = detect$date_time)
#' plot(fs ~ date_time, data = detect)
#'
#' # Unwrap constrained drift (granularity = 1)
#' detect$drift <- unwrapDrift(fs = detect$fs, time.stamps = detect$date_time,
#'                             granularity = 1)
#' plot(drift ~ date_time, data = detect)
#'
#' @export
#'
unwrapDrift <- function(fs, time.stamps, granularity = 1) {

  # Initialise vector for unwrapped drift values
  n <- length(fs)
  drift <- numeric(n)
  drift[1] <- fs[1]

  # ----- ESTIMATE GENERAL DRIFT RATE (SLOPE) -----

  # Compute differences in fractional seconds and time between detection pairs.
  # We include both lag-1 and lag-2 differences to increase sample size and
  # capture jumps that occur with alternating detections (useful when
  # granularity = 0.5)
  diff_fs <- c(diff(fs), diff(fs, lag = 2))
  diff_t <- c(diff(time.stamps), diff(time.stamps, lag = 2))
  units(diff_t) <- "secs"
  diff_t <- as.numeric(diff_t)

  # Calculate drift rate for each detection pair
  rate <- diff_fs / diff_t

  # Identify valid detection pairs for slope estimation:
  #   - Remove pairs with time differences <1 s to avoid multipath duplicates
  #   - Remove pairs >1 hour apart (too far to assume linear drift)
  #   - Remove large jumps (fs differences >50% of granularity)
  #   - Remove fs differences equal to 0 (differences below the time resolution
  #     of receivers)
  indx <- which(diff_t > 1  & diff_t < 3600 &
                  abs(diff_fs) < 0.5*granularity & diff_fs != 0)

  # Estimate the most common slope using kernel density on valid drift rates
  dens <- density(rate[indx], n = 50000)
  slope <- dens$x[which.max(dens$y)]

  # ----- ADJUST DRIFT VALUES TO A CONTINUOUS SCALE -----

  for (i in 2:n) {

    # Predict the expected drift based on the previous value and estimated slope
    expected_drift <- drift[i - 1] + diff_t[i - 1] * slope

    # Compute a correction factor indicating how many granularity steps we need
    # to shift to match the expected trend
    c <- round((expected_drift - fs[i]) / granularity, digits = 0)

    # Apply correction to unwrap current drift value
    drift[i] <- fs[i] + c * granularity
  }

  # Offset the drift so that the first value is zero
  drift <- drift - drift[1]
  return(drift)
}
