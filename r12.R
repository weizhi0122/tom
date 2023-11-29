numbers<-c(12,20,37,43,51)
print(numbers[[1]])
print(numbers[[2]])
print(numbers[[3]])
print(numbers[[4]])
print(numbers[[5]])

for(.x in c(1,2,3,4,5))
{
print(numbers[[.x]])
}

dataSet <- list(
  list(
    gender="male", height=178, age=32,
    children=list(
      list(gender="male", age=5),
      list(gender="male", age=0))
  ),
  list(
    gender="female", height=166, age=30,
    children=list(
      list(gender="female", age=3))
  ),
  list(
    gender="male", height=170, age=42,
    children=list(
      list(gender="male", age=10),
      list(gender="female", age=8))
  ),
  list(
    gender="male", height=188, age=22,
    children=list()
  ),  
  list(
    gender="male", height=172, age=52,
    children=list(
      list(gender="female", age=25),
      list(gender="female", age=23))
  ),
  list(
    gender="female", height=160, age=42,
    children=list(
      list(gender="female", age=11))
  )
)

howManyTimes=length(dataSet)
for(.x in 1:howManyTimes)
{
  print(length(dataSet[[.x]]$children))
}

for(y in seq_along(dataSet))
{
  print(length(dataSet[[.x]]$children))
}

emptyDataSet = list()
1:length(emptyDataSet)
seq_along(emptyDataSet)
for(.x in seq_along(emptyDataSet))
{
  print(emptyDataSet[[.x]])
}

results<-vector("integer",6)
for(.x in 1:6)
{
  numberOfChildren<-length(dataSet[[.x]]$children)
  print(numberOfChildren)
  results[[.x]]<-numberOfChildren
}

results2<-vector("list",length(dataSet))
for(.x in seq_along(dataSet))
{
  results2[[.x]]<-dataSet[[.x]]$children
}

flights<-readRDS("flights_week10.rds")
flightsData<-flights$data[[1]]$data_frame

flightsData|>
  split(
    flightsData$AirlineID
  )->split_data

numberOfFlight<-vector("integer",length(split_data))
for(.x in seq_along(split_data)){
  numberOfChildren[[.x]]<-
    nrow(split_data[[.x]])
}

names(split_data)
names(numberOfFlight)<-names(split_data)

nrow(split_data[[2]])
View(split_data[[2]])
