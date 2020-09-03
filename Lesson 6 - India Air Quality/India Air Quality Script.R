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

#----------------------------------------------------------------------------
# QUESTION 5

# Are any of Delhi’s PM2.5 measurements below 0? 
# In theory, the measurement should not contain any negative value.

min(x$Delhi) #minimum is not below 0