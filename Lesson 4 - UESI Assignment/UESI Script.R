uesi <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Lesson 4 - UESI Assignment/UESI2019_with_indicators.csv")

#EXPLORE THE DATASET
dim(uesi)
head(uesi)
str(uesi)
table(uesi$continent)
unique(uesi$country)

# FIND THE MEDIAN INCOME OF CITIES IN THE UESI
median(uesi$income_mean)
# THIS RETURNS NA BECAUSE THERE ARE MISSING VALUES

# NOW FILTER OUT THE NA VALUES
median(uesi$income_mean, na.rm = TRUE)

# EXPLORE HOW REPRESENTATIVE THE MEDIAN IS
table(is.na(uesi$income_mean))

# QUESTION 1: FIND THE TOTAL POPULATION OF CITIES NOT IN ASIA
total_population <- sum(uesi$population_total[uesi$continent != 'Asia'])
print(total_population)

#______________________________________________________________

# QUESTION 2: FIND THE NUMBER OF CITIES WITH MORE THAN 100 NEIGHBOURHOODS

number_cities <- sum(uesi$nbhd_num > 100)
print(number_cities)

#______________________________________________________________

# QUESTION 3: WHICH CITIES HAVE SCORES ABOVE 85 ON BOTH PUBTRANS.UESI AND TREECAP.UESI

number_cities_v2 <- uesi$city[which(uesi$PUBTRANS.UESI > 85 & uesi$TREECAP.UESI > 85)]
print(number_cities_v2)

#______________________________________________________________

# QUESTION 4: FIND NUMBER OF NA VALUES FOR ANY INDICATOR

number_values <- sum(is.na(uesi$income_mean))
number_values

#______________________________________________________________

# QUESTION 5: EXPLORING THE DATA FURTHER

# (A) WHAT IS THE MEAN/MEDIAN INCOME OF CITIES THAT SCORE A 100 ON TREE COVER PER CAPITA

mean(uesi$income_mean[uesi$TREECAP.UESI == 100], na.rm = TRUE)

median(uesi$income_mean[uesi$TREECAP.UESI == 100], na.rm = TRUE)

# (B) WHAT IS THE IQR OF ALL CITIES' INCOME?

IQR(uesi$income_mean, na.rm = TRUE)

# (C) WHAT IS THE STANDARD DEVIATION OF ALL CITIES' INCOME?

sd(uesi$income_mean, na.rm = TRUE)