# Q1. READ DATA INTO SCRIPT

admdata <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Mid-Term Examinations/admdata.csv")

#___________________________________________________

# Q2. Find mean and standard deviation of scholarship amount

head(admdata[admdata$CONFIRMED, ])

mean_award <- mean(admdata$AWARD[admdata$CONFIRMED])
mean_award

# ANSWER:
# MEAN IS 17511.11

sd_award <- sd(admdata$AWARD[admdata$CONFIRMED])
sd_award

# ANSWER:
# STANDARD DEVIATION IS 3313.123

#____________________________________________________

# Q3. Percentage of applicants interested in Humanities

humans_percentage <-  sum(admdata$INTEREST == "HUMANITIES") / nrow(admdata) * 100
humans_percentage

# ANSWER:
# PERCENTAGE INTERESTED IN HUMANITIES IS 32.83931%

#___________________________________________________

# Q4. Percentage of confirmed applicants that are Singaporean

sg_percentage <- sum(admdata$CIT == "Singaporean" & admdata$CONFIRMED) / nrow(admdata) * 100
sg_percentage

# ANSWER:
# PERCENTAGE OF SINGAPOREANS IS 15.99064%

#___________________________________________________

# Q5. What are the possible scholarship amounts

sort(unique(admdata$AWARD))

# ANSWER:
# THE POSSIBLE AMOUNTS ARE 10000, 14000, 18000, 22000, 23000

#___________________________________________________

# Q6. Create a barplot showing the relative frequencies of the ages
table(admdata$AGE)

barplot(table(admdata$AGE),
        xlab = "Frequencies of Ages",
        ylab = "Age Range",
        main = "Relative Frequency of Ages of Applicants")

#___________________________________________________

# Q7. Find the mean CAP for each distinct scholarship amount

aggregate(CAP ~ AWARD, data = admdata, FUN = mean)

# ANSWER:
# Average CAP for:
# 10000 is 3.502745
# 14000 is 3.715966
# 18000 is 3.981294
# 22000 is 4.342055
# 23000 is 4.782000

#___________________________________________________

# Q8. Draw scatter plot of CAP as a function of INCOME

plot(admdata$CAP ~ admdata$INCOME,
     data = admdata,
     xlab = "Income Ranges",
     ylab = "CAP Scores",
     main = "Plot of CAP as function of INCOME")

#___________________________________________________

# Q9. Plot normal qq plot of SAT

qqnorm(admdata$SAT)
qqline(admdata$SAT, col = "steelblue")

# ANSWER:
# The points are relatively straight, but about half of the points do not fall in a straight line
# This signifies heavy tails or data that has more extreme values 
# The data has likely more extreme values than would be expected if they came from a normal distribution

#___________________________________________________

# Q10. Draw boxplot of SAT scores by A Level Grades

boxplot(admdata$SAT ~ admdata$ALEVEL,
        xlab = "A LEVEL GRADES",
        ylab = "SAT GRADES",
        main = "SAT Scores by A Level Grades")
