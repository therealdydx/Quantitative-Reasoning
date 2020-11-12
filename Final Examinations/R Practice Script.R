# HEADER VALUES

# INT -> MONEY SPENT ON INTERNET
# TV -> MONEY SPENT ON TV
# RAD -> MONEY SPENT ON RADIO
# NEWS -> MONEY SPENT ON NEWSPAPERS
# AREA -> WHETHER IN NORTH OR SOUTH
# SALES -> ANNUAL SALES OF ABC BISCUITS IN THE MARKET
# MEDAGE -> MEDIAN AGE FOR THE MARKET
# MHI -> MEDIAN HOUSEHOLD INCOME FOR THE MARKET

# Q1. READ DATA INTO SCRIPT

advert <- read.csv("C:/Users/Admin/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Final Examinations/advert.csv")

#___________________________________________________

# Q2. COMPUTE SUMMARY STATISTICS FOR EACH OF THE QUANTITATIVE VARIABLES IN THE DATA FRAME

x<- advert$INT
summary(x)
sd(x)
IQR(x)


x<- advert$TV
summary(x)
sd(x)
IQR(x)

x<- advert$RAD
summary(x)
sd(x)
IQR(x)

x<- advert$NEWS
summary(x)
sd(x)
IQR(x)

x<- advert$SALES
summary(x)
sd(x)
IQR(x)

x<- advert$MEDAGE
summary(x)
sd(x)
IQR(x)

x<- advert$MHI
summary(x)
sd(x)
IQR(x)

#____________________________________________________

# Q3. CREATE HISTOGRAMS FOR EACH OF THE QUANTITATIVE VARIABLES IN THE DATA FRAME

par(mfrow=c(2,4))
hist(advert$INT)
hist(advert$TV)
hist(advert$RAD)
hist(advert$NEWS)
hist(advert$SALES)
hist(advert$MEDAGE)
hist(advert$MHI)
par(mfrow=c(1,1))

#___________________________________________________

# Q4. PLOT THE RELATIONSHIP BETWEEN BISCUIT SALES AND AGE

plot(SALES ~ MEDAGE,
     data = advert,
     main = "BISCUIT SALES AGAINST AGE")

lines(lowess(advert$SALES ~ advert$MEDAGE))

#___________________________________________________

# Q5. IS A LINEAR MODEL APPROPRIATE FOR THIS DATA?

# IF YES, FIT THE LINEAR MODEL
model <- lm(SALES ~ MEDAGE, data = advert)
model

abline(model, col = "red", lwd = 2)

# EVALUATE IT BY LOOKING AT HISTOGRAM OF THE RESIDUALS AND A PLOT OF RESIDUALS VS FITTED VALUES

hist(residuals(model))

plot(model, 
     which = 1,
     main = "BISCUIT SALES AGAINST AGE",
     caption = "Residuals of Biscuit Sales Against Age")

# IF NO, EXPLAIN WHICH CONDITIONS ARE VIOLATED, AND DISCUSS IF ANYTHING CAN BE DONE TO FIX THIS

cor(advert$SALES, advert$MEDAGE)

# 1. Correlations are very low
# 2. Residuals show a pattern, if not a thickening plot, as highlighted by the lowess line
# 3. Presence of outliers in the main scatter plot
# 4. Lowess line does not display linearity in the main scatter plot
# 5. A transformation via log(SALES) could be attempted to give greater linearity

advert$logSALES <- log10(advert$SALES)

plot(logSALES ~ MEDAGE,
     data = advert,
     main = "LOG BISCUIT SALES AGAINST AGE")

lines(lowess(advert$logSALES ~ advert$MEDAGE))

logmodel <- lm(logSALES ~ MEDAGE, data = advert)
logmodel

abline(logmodel, col = "red", lwd = 2)

#___________________________________________________

# Q6. REPEAT THIS FOR ONLY MARKETS IN THE SOUTH

south <- advert[advert$AREA == "S", ]
head(south)

plot(SALES ~ MEDAGE,
     data = south, 
     main = "Biscuit Sales Against Age")

model <- lm(SALES ~ MEDAGE, data = south)
abline(model, col = "red")

plot(model, 
     which = 1,
     main = "Residuals of Biscuit Sales Against Age")

#___________________________________________________

# Q7. IS THERE A SIGNIFICANT DIFFERENCE IN INCOME BETWEEN NORTH AND SOUTH

north <- advert[advert$AREA == "N", ]

par(mfrow = c(1,2))
hist(south$MHI, ylim = c(0, 30))
hist(north$MHI, ylim = c(0, 30))

# On average, the North end has a higher income.

#___________________________________________________

# Q8. WHAT PROPORTION OF MARKETS SPEND MORE ON INTERNET ADS THAN ON OTHER ADS?

internet <- advert[advert$INT > advert$TV & advert$INT > advert$RAD & advert$INT > advert$NEWS, ]
proportion_int <- nrow(internet) / nrow(advert)
proportion_int

# The proportion of markets is 62%

#___________________________________________________

# Q9. WHAT PROPORTION OF MARKETS SPEND LESS ON TELEVISION ADS THAN ON OTHER ADS?

television <- advert[advert$TV < advert$INT & advert$TV < advert$RAD & advert$TV < advert$NEWS,]
proportion_tv <- nrow(television) / nrow(advert)
proportion_tv

#___________________________________________________

# Q10. WHAT IS THE CORRELATION BETWEEN SPENDING ON RADIO ADS AND SPENDING ON NEWSPAPER ADS?

# IS THIS CORRELATION SIGNIFICANTLY DIFFERENT FROM 0? HOW DO YOU KNOW?

cor(advert$RAD, advert$NEWS)
correlation <- cor(advert$RAD, advert$NEWS)

trials <- 1000
responses <- numeric(trials)
advert_test <- advert

for (i in 1:trials) {
        
        advert_test$RAD <- sample(advert$RAD) 
        responses[i] <- cor(advert_test$RAD, advert_test$NEWS)
}

hist(responses)

abline(v = quantile(responses, c(0.025, 0.975)),
       col = "orange",
       lwd = 2)

abline(v = correlation, col = "blue", lwd = 2)

legend("topleft",
       legend = c("Range of 95% of correlations", "Actual Correlation"),
       col = c("orange", "blue"),
       lwd = 2)

# No the slope is not significantly different from 0.

#___________________________________________________

# Q11. FIT A LINEAR MODEL OF INCOME AS A FUNCTION OF AGE

model <- lm(MHI ~ MEDAGE, data = advert)

# ARE THE CONDITIONS OF LINEAR REGRESSION SATISFIED? HOW DO YOU KNOW?

par(mfrow = c(1,1))
plot(MHI ~ MEDAGE,
     data = advert,
     main = "MHI against MEDAGE")

abline(model, col = "red")

# There are several outliers, thus conditions of linear regression are not satisfied.

# IS THE SLOPE OF YOUR MODEL SIGNIFICANTLY DIFFERENT FROM 0? HOW DO YOU KNOW?

model
slope <- model$coefficients[2]
slope

trials <- 1000
responses <- numeric(trials)
advert_test <- advert

for (i in 1:trials) {
        
        advert_test$MHI <- sample(advert$MHI)
        
        newmodel <- lm(MHI ~ MEDAGE, data = advert_test)
        responses[i] <- newmodel$coefficients[2]
}

hist(responses,
     xlim = c(min(responses)-0.5, max(responses)+0.5))

abline(v = quantile(responses, c(0.025, 0.975)),
       col = "orange",
       lwd = 2)

abline(v = slope, col = "blue", lwd = 5)

legend("topleft",
       legend = c("Range of 95% of slopes", "Actual Slope"),
       col = c("orange", "blue"),
       lwd = 2)

# Yes it is significantly different.





