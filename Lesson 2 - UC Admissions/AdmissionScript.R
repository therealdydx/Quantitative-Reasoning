x <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/UC_admissions/AdmissionsData.csv")

dim(x)
head(x)
str(x)

# THIS IS FOR QUESTION 1

# calculate the total number of males that have been accepted
acceptance_male_number <- sum(x$Sex == "M" & x$Admitted == "Yes", na.rm = TRUE)
acceptance_male_number

# make sure that non binary genders have been filtered
acceptance_total <- sum(x$Sex == "F" | x$Sex == "M", na.rm = TRUE)
acceptance_total

# now find the overall percentage rate of males
percentage_male <- acceptance_male_number / acceptance_total * 100
percentage_male

# calculate the total number of females that have been accepted
acceptance_female_number <- sum(x$Sex == "F" & x$Admitted == "Yes", na.rm = TRUE)
acceptance_female_number

# now find the overall percentage rate of females
percentage_female <- acceptance_female_number / acceptance_total * 100
percentage_female

#__________________________________________________

# THIS IS FOR QUESTION 2

# there is a significant difference, which may point to the occurence
# of gender based discrimination in the university.

# however, this is also dependent on the fact that there may be
# more guys applicacnts than females to begin with, skewing results
# the proof for this is below (~800 more male applicants, or ~35% more)

total_male_applicants <- sum(x$Sex == "M")
total_male_applicants

total_female_applicants <- sum(x$Sex == "F")
total_female_applicants



#__________________________________________________

# THIS IS FOR QUESTION 3

x_table <- table(x$Department, x$Sex)
x_table 

y <- x[x$Admitted == "No", ]
head(y)

y_table <- table(y$Department, y$Sex)
y_table

df <- data.frame(matrix(ncol = 2, nrow = 6))
row_names <- c("Biology", "English", "History", "Mathematics", "Philosophy", "Psychology")
rownames(df) <- row_names
col_names <- c("F", "M")
colnames(df) <- col_names
df

# to find the issue for females
for (i in 1:6) {
  female_acceptance_rates <- y_table[i, "F"] / x_table[i, "F"] * 100
  df$F[i] <- female_acceptance_rates
}

# to find the issue for males
for (i in 1:6) {
  male_acceptance_rates <- y_table[i, "M"] / x_table[i, "M"] * 100
  df$M[i] <- male_acceptance_rates
}

df

# you can try looking at the visualization
barplot(table(x[x$Admitted == "Yes", ]$Sex, x[x$Admitted == "Yes", ]$Department)/table(x$Sex, x$Department), beside = TRUE, legend = TRUE)
barplot(table(x$Sex, x$Department), legend = TRUE, main = "Applications by sex and department")


# based on the results of the dataframe, it is clear that mathematics
# is the faculty with a very strong gender imbalance

# THERE IS A SIMPLER WAY OF DOING IT

# filter out the table into admitted students, then divide
# divide admitted students filtered by gender and dpt / whole table filtered by gender and dpt
# then you get percentage admitted students by each gender and dpt

#__________________________________________________

# THIS IS FOR QUESTION 4

table(x$Department, x$Sex)

# from the table, you can see the total number of students that applied.

#__________________________________________________

# THIS IS FOR QUESTION 5

# the evidence for sex-based discrimination should come from different faculties
# there is little evidence for sex-based discrimination in other faculties
# because you cannot compare females as a total,
# but females that are accepted as a percentage of females that apply in the first place
# the percentages of females that are accepted from female applicants
# is similar in every single faculty except mathematics
