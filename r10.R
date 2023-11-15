flights<-readRDS("~/GitHub/flights_week10.rds")

flightsData <- flights$data[[1]]$data_frame

dplyr::glimpse(flightsData)

flightsData$DepartureTimeZone |>
  table() |>
  sort(decreasing = T) ->tb_DepartureTimeZone

flights$dataSummary$DepartureTimeZone<-tb_DepartureTimeZone

saveRDS(flights, file="data/flights_week10_after.rds")

# Get unique time zones
unique_time_zones <- unique(flightsData$DepartureTimeZone)

# Count the number of unique time zones
num_time_zones <- length(unique_time_zones)

# Display the number of time zones
cat("Number of time zones:", num_time_zones, "\n")

# Count observations per time zone
observations_per_time_zone <- table(flightsData$DepartureTimeZone)

# Display observations per time zone
cat("Observations per time zone:\n")
print(observations_per_time_zone)

# 3. parse time with time zone
## split flightsData according to its timezone
flightsData |> split(flightsData$DepartureTimeZone) -> split_flightsData

x=1
split_flightsData[[x]]|>dplyr::glimpse()
split_flightsData[[x]]|>View()

split_flightsData[[x]]$DepartureTime<-
lubridate::ymd_hm(
  split_flightsData[[x]]$DepartureTime, 
  tz = split_flightsData[[x]]$DpartureTimeZone[[1]]
)

split_flightsData[[x]]|>dplyr::glimpse()

flightsData <- flights$data[[1]]$data_frame

flightsData |> split(flightsData$DepartureTimeZone) -> split_flightsData

.x=1


split_flightsData[[.x]] |>
  dplyr::mutate(
    DepartureTime = 
      lubridate::ymd_hm(DepartureTime, tz = DepartureTimeZone[[1]])
  )

flightsData|>
  dplyr::group_by(DepartureTimeZone)|>
  dplyr::mutate(
    DepartureTime = 
      lubridate::ymd_hm(DepartureTime, tz = DepartureTimeZone[[1]])
  )|>
  dplyr::ungroup()->
  flightsData

flightsData <- flights$data[[1]]$data_frame
flightsData|>
  dplyr::group_by(DepartureTimeZone)|>
  dplyr::mutate(
    DepartureTime = 
      lubridate::ymd_hm(DepartureTime, tz = DepartureTimeZone[[1]])
  )|>
  dplyr::ungroup()->
  flightsData

flights$data[[1]]$data_frame<-flightsData

saveRDS(flights, file="data/flights_week11.rds")


    