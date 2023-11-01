flightsData$AirlineName <-
  factor(
    flightsData[["AirlineName"]]
  )
install.packages("airportr")
airports <- airportr::airports
dplyr::glimpse(airports)

airportr::airports -> airports
airports$Country == "Taiwan"
head(airports$Country == "Taiwan")
pick_taiwan <- airports$Country == "Taiwan"
airports$IATA[pick_taiwan]
dplyr::filter(
  airports,
  Country == "Taiwan"
) -> airports_taiwan

head(airports_taiwan)

c(2, 4, 7)[c(T, F, T)]

airports_taiwan$IATA
unique(airports_taiwan$IATA)

flightsData |>
  dplyr::filter(
    DepartureAirportID %in% unique(airports_taiwan[["IATA"]])) -> 
  departure_flightsData
flightsData |>
  dplyr::filter(
    ArrivalAirportID %in% unique(airports_taiwan[["IATA"]])) -> 
  arrival_flightsData

taiwan_IATA<-unique(airports_taiwan$IATA)
pick_departure<-flightsData$DepartureAirportID%in%taiwan_IATA

head(pick_departure)

flightsData[pick_departure, ]|>View()

which(pick_departure) |> head(10)
whichIsDeparture<-which(pick_departure)
flightsData[whichIsDeparture, ]



options(encoding = "UTF-8")
Sys.setlocale("LC_CTYPE", "zh_TW.UTF-8")

flightsData <- readRDS("flightsData_week8.rds")

lubridate::ymd_hm("2023-10-13 15:00",
                  tz="Asia/Shanghai")

paste(flightsDataScheduleStartDate, 
      flightsData$DepartureTime)->departureTime
dplyr::glimpse(flightsData)



whichNeedPlus1 <- grep(pattern = "+1", flightsData$DepartureTime, fixed = TRUE)
whichNeedPlus1


flightsDataScheduleStartDate<-lubridate::ymd(flightsDataScheduleStartDate)

departureDate <- flightsData$ScheduleStartDate

departureTimeString <- flightsData$DepartureTime
departureTimeString <- sub("+1", "", departureTimeString, fixed = T)

departureTime <- paste(departureDate, departureTimeString)

head(departureTime)

flightsData$DepartureTime <- departureTime
names(flightsData)
