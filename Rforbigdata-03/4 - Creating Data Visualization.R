# Creating Data Visualization

# Set the working directory
#setwd("D:/Pluralsight")
#setwd("E:/청년취업아카데미/2018/[03]Data Science with R/r-data-science/5-r-data-science-m5-exercise-files")
setwd("C:/Users/User/Documents/Rbigdata")
# Read the CSV file
cars <- read.csv("Cars.csv")

# Load the ggplot2 library
install.packages("plyr")
library(plyr)
library(ggplot2)

# Create a frequency bar chart
ggplot(
    data = cars, 
    aes(x = Transmission)) + 
    geom_bar(fill="red", col="black") +
    ggtitle("Count of Cars by Transmission Type") +
    xlab("Transmission Type") +
    ylab("Count of Cars 자동차 수")

# Create a histogram
ggplot(
    data = cars, 
    aes(x = Fuel.Economy)) +
    geom_histogram(
        bins = 6, fill="red") +
    ggtitle("Distribution of Fuel Economy") +
    xlab("Fuel Economy (mpg)") +
    ylab("Count of Cars")

# Create a density plot
ggplot(
    data = cars, 
    aes(x = Fuel.Economy)) +
    geom_density() +
    ggtitle("Distribution of Fuel Economy") +
    xlab("Fuel Economy (mpg)") +
    ylab("Density")
# Create a linear regression model
model <- lm(
  formula = Fuel.Economy ~ Cylinders ,
  data = cars)

# Summarize the model
summary(model)

# Create a scatterplot(산점도)
ggplot(
    data = cars, 
    aes(
        x = Cylinders,
        y = Fuel.Economy)) +
    geom_point() +
    scale_size_identity()+
    geom_abline(slope=model$coefficients[2], intercept=model$coefficients[1], colour="green", size=2)+
    ggtitle("Fuel Economy by Cylinders") +
    xlab("Number of Cylinders") +
    ylab("Fuel Economy (mpg)")

