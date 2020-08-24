primary_education <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/primary_school_education/primary_education.csv")


for (i in 1:length(primary_education$completion_f_pct)) 
{
  if (primary_education$completion_f_pct[i] > 100)
  {
    primary_education$completion_f_pct[i] <- 100
  }
}

total_percentage <- mean(primary_education$completion_f_pct[primary_education$income == 'low'])

# percentage of girls that complete primary school in low income

total_percentage