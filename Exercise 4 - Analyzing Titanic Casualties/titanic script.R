titanic <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Lesson 3 - Plottings/Titanic Project/titanic.csv")

# PLOT HISTOGRAM REPRESENTING THE AGE DISTRIBUTION OF TITANIC PASSENGERS
hist(titanic$age)

# PLOT HISTOGRAM OF THOSE THAT DID NOT SURVIVE
hist(titanic$age[titanic$survived == "FALSE"], main = "Survived Passengers")

# FIND THE RANGE, FILTER OUT NA VALUES
range(titanic$age, na.rm = TRUE)

# PLOT HISTOGRAM OF TITANIC PASSENGERS, WITH EDITED AXES AND FILTERED AGES 
hist(titanic$age, 
     breaks = c(seq(0, 80, 10)), 
     labels = TRUE, 
     xlab = "age")

# CREATING BOX PLOTS
# COMPARE THE SURVIVORS WITH THE NON SURVIVORS, AND HOW MUCH THEIR TICKET PRICE COST
titanic$total_price <- titanic$pnd + titanic$shl/20 + titanic$pnc/240

boxplot(titanic$total_price - titanic$survived, 
        ylab = "Ticket price", 
        xlab = "Survival Status")
#IT CAN BE NOTICED THAT THE BOXPLOT IS IMPOSSIBLE TO READ, AND DATA MUST BE TRANSFORMED

# TRANSFORMING DATA IN BOXPLOTS, USING SQUARE ROOTS TO GET BETTER BOXPLOT
titanic$total_price_sqrt <- sqrt(titanic$total_price)

boxplot(titanic$total_price_sqrt ~ titanic$survived, 
        ylab = "Sqrt(Ticket price)", 
        xlab = "Survival Status")
# THE TILDE (~) OPERATOR IS USED TO DEFINE "DEPENDS", SO IT CAN BE SAID LIKE:
# THE SQUARE ROOT OF THE TOTAL PRICE DEPENDS ON THE CATEGORY OF SURVIVED

# DISTRIBUTION OF AGES OF THOSE THAT SURVIVED, COMPARING MEN AND WOMEN
titanic_survivors <- titanic[titanic$survived == 'TRUE', ]

boxplot(titanic_survivors$age ~ titanic_survivors$gender, 
        ylab = "Age of passenger", 
        xlab = "Survival Status")

# SURVIVORS BY CLASS OF TICKET

boxplot(titanic_survivors$total_price_sqrt ~ titanic_survivors$class, 
        ylab = "Sqrt(Ticket price)", 
        xlab = "Survival Status")

# CREATE A NEW COLUMN TO CALCULATE ACTUAL PRICE PER PERSON

titanic$price_per <- titanic$total_price / titanic$pax_on_tckt
titanic$price_per