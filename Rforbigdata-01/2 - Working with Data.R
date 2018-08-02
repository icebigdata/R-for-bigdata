# Working with Data

#get the working directory info
getwd()
# Set the working directory
#setwd("E:/청년취업아카데미/2018/[03]Data Science with R/r-data-science/3-r-data-science-m3-exercise-files")
setwd("C:/Users/User/Documents/Rbigdata")
# Read a tab-delimited data file
cars <- read.table(
    file = "Cars.txt",
    header = TRUE,
    sep = "\t",
    quote = "\"")

# Peek at the data
head(cars)

# Load the dplyr library
install.packages("dplyr")
library(dplyr)

# Select a subset of columns (일부 열 가져오기)
temp <- select(
    .data = cars, 
    Transmission,
    Cylinders,
    Fuel.Economy)

# Inspect the results
head(temp)

# Filter a subset of rows (일부 잘라낸 데이터 중 미션이 자동인경우만 필터링) )
temp <- filter(
    .data = temp, 
    Transmission == "Automatic")

# Inspect the results
head(temp)
temp
# Compute a new column 기존열을 두고 새로운 열 추가
temp <- mutate(
    .data = temp, 
    Consumption = Fuel.Economy * 0.425)

# Inspect the results
head(temp)

# Group by a column
temp <- group_by(
    .data = temp,  
    Cylinders)
    
# Inspect the results
head(temp)
temp
# Aggregate based on groups
temp <- summarize(
    .data = temp, 
    Avg.Consumption = mean(Consumption))
    
# Inspect the results
head(temp)

# Arrange the rows in descending order
temp <- arrange(
    .data = temp, 
    desc(Avg.Consumption))
    
# Inspect the results
head(temp)

# Convert to data frame
efficiency <- as.data.frame(temp)

# Inspect the results
print(efficiency)

# Chain methods together
efficiency <- cars %>%
    select(Fuel.Economy, Cylinders, Transmission) %>%
    filter(Transmission == "Automatic") %>%
    mutate(Consumption = Fuel.Economy * 0.425) %>%
    group_by(Cylinders) %>%
    summarize(Avg.Consumption = mean(Consumption)) %>%
    arrange(desc(Avg.Consumption)) %>%
    as.data.frame()

# Inspect the results
print(efficiency)

# Save the results to a CSV file
write.csv(
    x = efficiency,
    file = "Fuel Efficiency2.csv",
    row.names = FALSE)
