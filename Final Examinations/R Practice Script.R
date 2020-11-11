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

advert <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Final Examinations/advert.csv")

#___________________________________________________

# Q2. COMPUTE SUMMARY STATISTICS FOR EACH OF THE QUANTITATIVE VARIABLES IN THE DATA FRAME

summary(advert)

#____________________________________________________

# Q3. CREATE HISTOGRAMS FOR EACH OF THE QUANTITATIVE VARIABLES IN THE DATA FRAME

hist(advert$INT)

hist(advert$TV)

hist(advert$RAD)

hist(advert$NEWS)

hist(advert$SALES)

hist(advert$MEDAGE)

hist(advert$MHI)

#___________________________________________________

# Q4. PLOT THE RELATIONSHIP BETWEEN BISCUIT SALES AND AGE

plot(SALES ~ MEDAGE,
     data = advert,
     main = "BISCUIT SALES AGAINST AGE")

#___________________________________________________

# Q5. IS A LINEAR MODEL APPROPRIATE FOR THIS DATA?

# IF YES, FIT THE LINEAR MODEL
model <- lm(SALES ~ MEDAGE, data = advert)

abline(model, col = "red", lwd = 2)

# EVALUATE IT BY LOOKING AT HISTOGRAM OF THE RESIDUALS AND A PLOT OF RESIDUALS VS FITTED VALUES

plot(model, 
     which = 1,
     main = "BISCUIT SALES AGAINST AGE",
     caption = "Residuals of Biscuit Sales Against Age")

# IF NO, EXPLAIN WHICH CONDITIONS ARE VIOLATED, AND DISCUSS IF ANYTHING CAN BE DONE TO FIX THIS



#___________________________________________________

# Q6. REPEAT THIS FOR ONLY MARKETS IN THE SOUTH

#___________________________________________________

# Q7. IS THERE A SIGNIFICANT DIFFERENCE IN INCOME BETWEEN NORTH AND SOUTH


#___________________________________________________

# Q8. WHAT PROPORTION OF MARKETS SPEND MORE ON INTERNET ADS THAN ON OTHER ADS?


#___________________________________________________

# Q9. WHAT PROPORTION OF MARKETS SPEND LESS ON TELEVISION ADS THAN ON OTHER ADS?

#___________________________________________________

# Q10. WHAT IS THE CORRELATION BETWEEN SPENDING ON RADIO ADS AND SPENDING ON NEWSPAPER ADS?

# IS THIS CORRELATION SIGNIFICANTLY DIFFERENT FROM 0? HOW DO YOU KNOW?


#___________________________________________________

# FIT A LINEAR MODEL AS A FUNCTION OF AGE

# ARE THE CONDITIONS OF LINEAR REGRESSION SATISFIED? HOW DO YOU KNOW?

# IS THE SLOPE OF YOUR MODEL SIGNIFICANTLY DIFFERENT FROM 0? HOW DO YOU KNOW?


