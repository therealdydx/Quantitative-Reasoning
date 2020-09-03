x <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Lesson 6 - India Air Quality/India_AirQuality.csv")

dim(x)
head(x)
tail(x)
str(x)

# QUESTION 1

# Consider Delhi. Calculate the following: 
# the minimum, maximum, mean, median, and standard deviation of the Delhi PM2.5 measurements. 
# This involves using functions: min, max, mean, median, and sd.

min(x$Delhi)
max(x$Delhi)
mean(x$Delhi)
median(x$Delhi)
sd(x$Delhi)
IQR(x$Delhi)

# Find the quantile of the city
quantile(x$Delhi, probs = c(0.05, 0.95))

# Find the sum of the city
sum(is.na(x$Delhi))

#----------------------------------------------------------------------------
# QUESTION 2

# Now consider one of the other cities. 
# Are there any missing PM2.5 measurements for this city? If so, how many?

any(is.na(x$Kolkata))

sum(is.na(x$Kolkata))

#----------------------------------------------------------------------------
# QUESTION 3

# Use boxplot() to explore with a graphic the PM2.5 measurements of Delhi. 
# You might have to refer to the help page for boxplot by typing ?boxplot.

boxplot(x$Delhi, main = "Delhi PM2.5 Measurements", 
        xlab = "Delhi", ylab = "PM2.5")

#----------------------------------------------------------------------------
# QUESTION 4

# Use hist() to explore with a graphic the PM2.5 measurements of Delhi. 
# You might have to refer to the help page for boxplot by typing ?hist.

hist(x$Delhi, main = "Delhi PM2.5 Measurements",
     xlab = "Delhi", ylab = "PM2.5")

#---------------------------------------------------------------------------
# QUESTION 5

# calculate the mean of the PM2.5/Hour for all of the cities

Delhi_hour <- aggregate(x$Delhi ~ x$hour, FUN = mean)
Chennai_hour <- aggregate(x$Chennai ~ x$hour, FUN = mean)

# Explore the time series of measurements for your city.

range(Delhi_hour$Delhi, na.rm = TRUE)

# These are for the other cities

# range(Hyderabad_hour$Hyderabad, na.rm = TRUE)
# range(Kolkata_hour$Kolkata, na.rm = TRUE)

#----------------------------------------------------------------------------
# QUESTION 6

# Use the boxplot to gauge the distribution for each hour.
# What is the pattern for the city. 
# What are the most important data presented in this plot?
boxplot(x$Delhi ~ x$hour, main = "Distribution for each hour")
grid()