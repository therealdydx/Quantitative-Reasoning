lc <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Lesson 5 - Lung Cancer/lung_cancer.csv")

#EXPLORE THE DATASET
dim(lc)
head(lc)
tail(lc)
str(lc)
unique(lc)

#FIND THE INCIDENCE RATE IN UK
uk <- lc[lc$Country == "UK", ]
uk

uk_total_cases <- sum(uk$Cases)
uk_total_population <- sum(uk$Population)
uk_incidence_rate <- (uk_total_cases / uk_total_population) * 100000
uk_incidence_rate

#FIND OVERALL INCIDENCE RATE BY COUNTRY
aggregate(Cases ~ Country, data = lc, sum)
total <- aggregate(cbind(Cases, Population) ~ Country, data = lc, sum)

total$Incidence <- (total$Cases / total$Population) * 100000
total

#PLOT THE INCIDENCE RATES
barplot(total$Incidence)
barplot(total$Incidence, 
        names.arg = total$Country,
        main = "Overall Lung Cancer Incidence",
        ylab = "Incidence rate per 100,000",
        las = 2)

grid()

#CALCULATE THE INCIDENCE RATE BY AGE GROUP FOR AT LEAST 2 OF THE COUNTRIES

sg <- lc[lc$Country == "Singapore", ]
sg$Incidence <- (sg$Cases / sg$Population) * 100000
sg

barplot(sg$Incidence, 
        names.arg = sg$AgeClass,
        main = "Singapore Lung Cancer Incidence by Age Group",
        ylab = "Incidence Rate Per 100,000",
        las = 2)

ethiopia <- lc[lc$Country == "Ethiopia", ]
ethiopia$Incidence <- (ethiopia$Cases / ethiopia$Population) * 100000
ethiopia

barplot(ethiopia$Incidence, 
        names.arg = ethiopia$AgeClass,
        main = "Ethiopia Lung Cancer Incidence by Age Group",
        ylab = "Incidence Rate Per 100,000",
        las = 2)

#CALCULATE PROPORTION OF POPULATION

lc[, "Proportion"] <- NA #CREATE A NEW COLUMN

country_names = unique(lc$Country)
country_names 

str(country_names)

for (name in country_names) {
  name <- toString(name)
  country <- name
  country_population <- sum(lc$Population[lc$Country == country])
  country_population
  
  lc$Proportion[lc$Country == country] <- lc$Population[lc$Country == country] / country_population
}
lc

for (name in country_names) {
  name <- toString(name)
  barplot(lc$Proportion[lc$Country == name],
          names.arg = lc$AgeClass[lc$Country == name],
          main = "Age Proportion in Country",
          ylab = "Proportion Per Age Group",
          las = 2)
}  

# TO FIND THE INCIDENCE RATE IN EACH AGE GROUP IN EACH COUNTRY
lc$Incidence <- lc$Cases / lc$Population * 100000
lc

# IF COUNTRY IN CORRESPONDING ROWS HAD POPULATION OF THE UK IN THIS AGE GROUP
uk_population <- lc$Population[lc$Country == "UK"]
lc$Population_UK <- uk_population

lc$Cases_if_UK <- (lc$Population_UK / lc$Population) *lc$Cases

adjusted <- aggregate(Cases_if_UK ~ Country, data = lc, sum)
adjusted$Incidence <- adjusted$Cases_if_UK / sum(uk_population) * 100000