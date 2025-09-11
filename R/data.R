#' Example Fish Telemetry Dataset
#'
#' Example dataset to test and illustrate the TOA-based method for estimating
#' fish activity. It contains detection records from tagged marine species,
#' sensor data from acoustic receivers, metadata on transmitters and tagged
#' individuals, and receiver deployment metadata.
#'
#' @format A list with four data tables:
#'
#' \describe{
#'
#'   \item{detection_data}{
#'   Data table with 31,354 acoustic detections.
#'      \describe{
#'        \item{date_time}{POSIXct. Timestamp of the detection (UTC).}
#'        \item{deployment_id}{Integer. ID of the receiver deployment period.}
#'        \item{station}{Character. Code of the receiver deployment station.}
#'        \item{receiver_id}{Integer. ID of the receiver.}
#'        \item{tag_id}{Character. ID of the acoustic transmitter.}
#'        \item{fish_id}{Character. Code of the fish carrying the transmitter.}
#'        \item{snr}{Integer. Signal-to-noise ratio measured by the receiver.}
#'      }
#'   }
#'
#'   \item{sensor_data}{
#'   Data table with 16,377 environmental measurements recorded by the
#'   receivers every 10 minutes.
#'      \describe{
#'        \item{date_time}{POSIXct. Timestamp of the record (UTC).}
#'        \item{deployment_id}{Integer. ID of the receiver deployment period.}
#'        \item{station}{Character. Code of the receiver deployment station.}
#'        \item{receiver_model}{Character. Receiver model.}
#'        \item{receiver_id}{Integer. ID of the receiver.}
#'        \item{temperature}{Numeric. Water temperature (°C).}
#'        \item{noise_avg}{Integer. Average background noise level.}
#'        \item{noise_peak}{Integer. Peak background noise level.}
#'      }
#'   }
#'
#'   \item{tag_metadata}{
#'   Data table with the metadata for the five tagged individuals and the
#'   control tag.
#'      \describe{
#'        \item{common_name}{Character. Common name of the species.}
#'        \item{species}{Character. Scientific name of the species}
#'        \item{fish_id}{Character. Code of the fish carrying the transmitter.}
#'        \item{length_cm}{Integer. Length measurement of the individual in centimeters.}
#'        \item{length_type}{Character. Type of length measurement.}
#'        \item{tag_manufacturer}{Character. Name of the transmitter manufacturer.}
#'        \item{tag_model}{Character. Acoustic transmitter model.}
#'        \item{tag_id}{Character. ID of the acoustic transmitter.}
#'        \item{power_output_db}{Integer. Transmitter power output (dB).}
#'        \item{granularity}{Numeric. Emission granularity (s).}
#'        \item{min_delay}{Integer. Minimum delay between transmissions (seconds).}
#'        \item{max_delay}{Integer. Maximum delay between transmissions (seconds).}
#'      }
#'   }
#'
#'   \item{deployment_metadata}{
#'   A data table with metadata for each receiver deployment.
#'      \describe{
#'        \item{deployment_id}{Integer. ID of the receiver deployment period.}
#'        \item{station}{Character. Code of the receiver deployment station.}
#'        \item{region}{Character. Region name.}
#'        \item{longitude}{Numeric. Deployment longitude (WGS84).}
#'        \item{latitude}{Numeric. Deployment latitude (WGS84).}
#'        \item{receiver_model}{Character. Receiver model.}
#'        \item{receiver_id}{Integer. ID of the receiver.}
#'        \item{mooring_type}{Character. Type of mooring used for the deployment.}
#'        \item{depth}{Numeric. Deployment depth (m).}
#'        \item{deployment_time_utc}{POSIXct. Start time of the deployment (UTC).}
#'        \item{recovery_time_utc}{POSIXct. End time of the deployment (UTC).}
#'        \item{salinity_psu}{Integer. Average salinity at the deployment site (PSU).}
#'      }
#'   }
#'
#' }
#'
#' @details
#' Used to demonstrate the TOA-based method for estimating fish activity.
#'
#' @usage data(fish_data)
#'
#' @examples
#' data(fish_data)
#' head(fish_data$detection_data)
#' head(fish_data$sensor_data)
#' head(fish_data$tag_metadata)
#' head(fish_data$deployment_metadata)
"fish_data"
