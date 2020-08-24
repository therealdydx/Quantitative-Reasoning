country_info <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/population_by_continent/country_info.csv")

dim(country_info)

names(country_info)
head(country_info)
unique(country_info$continent)

europe_info <- country_info[country_info$continent == "Europe", ]

head(europe_info)

asia_info <- country_info[country_info$continent == "Asia", ]

head(asia_info)

aggregate()

pop_by_cont <- aggregate(pop ~ continent, data = country_info, sum)
head(pop_by_cont)
barplot(pop_by_cont$pop, names.arg = pop_by_cont$continent)

sum(country_info$pop)

country_info$total_popn_w_access_to_electricity <- country_info$pop * country_info$electr_pct

total_popn <- sum(country_info$pop)

total_percentage <- sum(country_info$total_popn_w_access_to_electricity) / total_popn

total_percentage

