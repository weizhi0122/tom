flights = readRDS("data/flights.rds")
str(flights)
flights$data[[1]]
flightsData <- flights$data[[1]]$data_frame

dplyr::glimpse(flightsData)
flightsData$AirlineID

#summarise AirlineID

levels(flightsData$AirlineID) |> length()

table(flightsData$AirlineID) |> sort(decreasing = TRUE) |> head(10)

flightsData$AirlineID|>table()->tb_airlineID

class(tb_airlineID)
typeof(tb_airlineID)

tb_airlineID|>sort(decreasing=TRUE)


c(29,23,1,17) |> sum()
