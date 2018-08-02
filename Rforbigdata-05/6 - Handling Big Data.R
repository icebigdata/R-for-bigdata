# Handling Big Data

# Set working directory
#setwd("C:/Users/User/Documents/Bigdata")
setwd("N:/청년취업아카데미/2018/[03]Data Science with R/r-data-science/7-r-data-science-m7-exercise-files")
# Load the ff package
install.packages("ff")
library(ff)

# Read a CSV file as ff data frame
irisff <- read.table.ffdf(
    file = "Iris.csv",
    FUN = "read.csv",
    colClasses=c("numeric", "numeric", "numeric", "numeric", "factor"))

# Inspect the class 데이터 유형 
class(irisff)

# Inspect the column names 열 이름 
names(irisff)

# Inspect the first few rows 처음 일부 행 데이터 확인 
irisff[1:5,]

# Load the biglm package
install.packages("biglm")
library(biglm)

# Create a linear regression model
model <- biglm(
    formula = Petal.Width ~ Petal.Length,
    data = irisff)

# Summarize the model
summary(model)
summary(model)$mat
# Create a scatterplot
plot(
    x = irisff$Petal.Length[], 
    y = irisff$Petal.Width[],
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)")

# Get y-intercept from model
b <- summary(model)$mat[1,1]

# Get slope from model
m <- summary(model)$mat[2,1]

class(irisff$Petal.Length[])
# Draw a regression line on plot
lines(
    x = irisff$Petal.Length[],
    y = m * irisff$Petal.Length[] + b, 
    col = "blue",
    lwd = 3)


# Predict new values with the model
x.pred <- predict(
    object = model,
    newdata = data.frame(
        Petal.Length = c(2, 5, 7),
        Petal.Width = c(0, 0, 0))) # biglm에서는 이 부분 필요 
x.pred
