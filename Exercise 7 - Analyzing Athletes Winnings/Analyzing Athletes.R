hept <- read.csv("C:/Users/User/OneDrive/Documents/Yale-NUS/Quantitative Reasoning/Quantitative Reasoning Repository/Lesson 7 - Analyzing Athletes/hept.csv")

hept$dvvb_hurdles <- -(hept$hurdles - mean(hept$hurdles, na.rm = TRUE)) / sd(hept$hurdles, na.rm = TRUE)
  
hept$dvvb_hj <- (hept$hj - mean(hept$hj, na.rm = TRUE)) / sd(hept$hj, na.rm = TRUE)
  
hept$dvvb_sp <- (hept$sp - mean(hept$sp, na.rm = TRUE)) / sd(hept$sp, na.rm = TRUE)
  
hept$dvvb_run200 <- -(hept$run200 - mean(hept$run200, na.rm = TRUE)) / sd(hept$run200, na.rm = TRUE)

hept$dvvb_lj <- (hept$lj - mean(hept$lj, na.rm = TRUE)) / sd(hept$lj, na.rm = TRUE)
  
hept$dvvb_jt <- (hept$jt - mean(hept$jt, na.rm = TRUE)) / sd(hept$jt, na.rm = TRUE)
  
hept$dvvb_run800 <- -(hept$run800 - mean(hept$run800, na.rm = TRUE)) / sd(hept$run800, na.rm = TRUE)

# COMPARE OFFICIAL POINTS WITH THE DVVB SCORES, MAKE SCATTER PLOTS
# ADD A LOWESS LINE TO THE PLOT WHEN PLOT IS DONE

plot(pts_hurdles ~ dvvb_hurdles,
     data = hept,
     main = "Hurdles",
     xlab = "DVVB Scores",
     ylab = "Official Scores")

lines(lowess(hept$pts_hurdles ~ hept$dvvb_hurdles))

# COMPARE THE TOTAL SCORES TO DETERMINE ATHLETES RANKING

hept$dvvb_total = hept$dvvb_hj + hept$dvvb_hurdles + hept$dvvb_jt
                      + hept$dvvb_lj + hept$dvvb_run200 + hept$dvvb_run800
                      + hept$dvvb_sp

plot(pts_total[!is.na(run800)] ~ dvvb_total[!is.na(run800)],
     data = hept,
     main = "Scatter Plot",
     xlab = "DVVB Scores",
     ylab = "Official Scores",
     ylim = range(pts_total[!is.na(run800)]))

text(hept$dvvb_total, hept$pts_total, hept$lastname, pos = 1, cex = 0.8)

lines(lowess(hept$pts_total[!is.na(hept$dvvb_total)] ~ na.omit(hept$dvvb_total)))