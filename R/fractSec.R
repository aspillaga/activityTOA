#' Extract Fractional Seconds from Time Stamps
#'
#' This function extracts the fractional second component from timestamps in
#' `POSIXct` format.
#'
#' @param time.stamps A vector of detection time stamps in `POSIXct` format.
#'
#' @return A numeric vector of fractional seconds (0 to 1 range).
#'
#' @examples
#' time_stamps <- as.POSIXct(c("2025-02-26 12:00:00.123",
#'                             "2025-02-26 12:00:01.456"))
#' fs <- fractSec(time_stamps)
#' print(fs)
#'
#' @export
#'
#'
fractSec <- function(time.stamps) {
  requireNamespace("lubridate", quietly = TRUE)
  val <- as.numeric(time.stamps - lubridate::floor_date(time.stamps, "seconds"))
  return(val)
}
