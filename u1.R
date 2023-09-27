# basic data type----
c("John", "Mary")
c(2, 3.1412)
c(TRUE, TRUE, F)
list("John",178,T)
typeof(c("John",178,T))

# Binding----
personName = c("John", "Mary")
personName <- c("John", "Mary")
interestingNumber = c(2, 3.1412)
covidPositive = c(TRUE, TRUE, F)

# Name call to access value
personName
interestingNumber
covidPositive

# Retrieve ONE element value----
# by position / index
personName[[1]]
personName[[2]]



listExample = list("John",178,T)

listExample
listExample[[3]]

# Named your elemant values----
## name: John, age: 38, height: 178, is Married: F
recordExample2 = list(
  "name"="John", 
  "age"=38, 
  "height"=178, 
  "is Married"=F
  )

recordExample2[[1]]
recordExample2$height

# Retrieve multiple element values----
# by position/Index
listExample
listExample[c(1,3)]

atomicExample <- c(1,4,78,455,-23)
