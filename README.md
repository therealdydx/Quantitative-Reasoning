# R FORMULAS

R Formulas for Quantitative Reasoning

### CONTENTS

1. [Types of Graphs](https://github.com/therealdydx/Quantitative-Reasoning#types-of-graphs) 
2. [Linear Regression](https://github.com/therealdydx/Quantitative-Reasoning#linear-regression) 
3. [Permutations](https://github.com/therealdydx/Quantitative-Reasoning#permutations) 
4. [Basic Functions](https://github.com/therealdydx/Quantitative-Reasoning#basic-functions) 
5. [Normal Distributions](https://github.com/therealdydx/Quantitative-Reasoning#normal-distributions) 
6. [Correlations](https://github.com/therealdydx/Quantitative-Reasoning#correlations) 

# TYPES OF GRAPHS

Parameters shown below are not exhaustive.

#### SHRINK PLOTS
```
- par(mfrow = c(1,1))
- par(mar = c(5, 2, 1.1, 0.1))
```
#### BARPLOTS
```
barplot(dataset, 
	legend = TRUE, 
	col = "lightblue",  
	lwd = 3, 
	pch = "17" # Plotting Character,  
	args.legend = list(bty = "n" # Suppress Legend Box,  
				x = "topleft",  
				ncol = 3,
	names.arg = dataset$column,
	las = 2 # Vertical labels or Horizontal)
	)
```
#### HISTOGRAMS
```
hist(dataset, 
	xlim = c(10, 20),  
	freq = FALSE,  
	breaks = c(seq(-0.5, 0.5, 0.01),
	labels = TRUE)  
	)
```
#### CURVE LINES
```
curve(dnorm(x, mean = XY, sd = YX),
	add = TRUE,  
	col = "red")
```
#### STRAIGHT LINES
```
abline(v = quantile(dataset, c(0.025, 0.975)),  
	col = "orange", lwd = 2)
```
In the case of abline,
```
abline(a = for the intercept of the line,  
				b = slope of the line,  
				h = y-value for the horizontal line,  
				v = x-value for the vertical line)
```

#### LEGENDS
```
legend("topleft / top / etc",  
	legend = c("Factor 1", "Factor 2"),  
	lty = 1, # Line Type  
	lwd = 2, # Line Width  
	col = c("orange", "blue"),  
	pch = 12 # Plotting Symbols)
```
#### SCATTER PLOTS
```
plot(col1 ~ col2, 
	data = dataset,  
	main = "title", 
	xlab = "axis", 
	ylab = "axis")

grid()
```

For line plots, changing type parameter will work i.e.
```
plot(Delhi_hour$Delhi, 
     type="l", 
     main="PM2.5 in Delhi", 
     xlab="Hour", 
     ylab="PM2.5")
```
To plot extra points, you can use i.e.
```
points()
```
or for lines i.e.
```
lines(Chennai_hour$Chennai, col="red")
```
To add text to the points, use i.e.
```
text(hept$dvvb_total, hept$pts_total, 
	hept$lastname, 
	pos = 1, 
	cex=0.8)
```
or
```
text(Y ~ X, 
	labels=Country, 
	data=Nobel, 
	cex=0.8,
	font=2)
```
#### BOXPLOTS
```
boxplot(column1 ~ column2,   
		data = x,  
		ylab = "axis", 
		xlab = "axis", 
		main = "title")
		
boxplot(column1 ~ column2 + column3,
	data = x,
	main = "title")
```


# LINEAR REGRESSION

#### CREATING A MODEL
```
model <- lm(col1 ~ col2, data = dataset)
```
#### FINDING MODEL COEFFICIENTS
```
- model$coefficients
- coef(model)
```
#### FINDING CORRELATION
```
cor(dataset$col1, dataset$col2,  
		use = "complete.obs")
```
In this case, complete obs is used to filter NA values out

To manually calculate correlation coefficients
ManualCorCoef <- sum(Z-Score of X * Z-Score of Y) / (nrow(dataset) - 1)

#### CALCULATING Z SCORES
```
meanX <- mean(val)
sdX <- sd(val)
Z-Score <- (val - meanX)/sdX
```

#### FINDING R-SQUARED

Where the model inside is the linear model
```
- summary(model)$r.squared
- cor(dataset$column1, dataset$column2)^2
```
#### PREDICTING NEW ADDITIONAL VALUES

Where this finds the R Squared or the Variance accounted by the model
```
predict(model, newdata = data.frame(col1 = val1))
```
Where model is linear model, new data is a dataframe

#### LOWESS LINES FOR SCATTER PLOTS

Or using lowess lines, i.e.
```
lines(lowess(hept$pts_hurdles ~ hept$dvvb_hurdles))
```

# RESIDUALS AND RESIDUAL PLOTS
```
res <- residuals(model)
```
#### FINDING MAXIMUM VALUE
```
data$column[which.max(res)]
```
#### PLOT RESIDUALS
```
plot(model,  
	which = 1,  
	main = "e.g. Perceptions of Vaccine Effectiveness vs Safety",  
	caption = "Residuals of log10 (% disagree that vaccines are effective)",  
	sub.caption = "log10 (% disagree that vaccines are safe)"
	) 
 ```


# PERMUTATIONS
```
sample(C("X", "Y"),  
	size = x_value,  
	replace = TRUE/FALSE,  
	prob = c(0.25, 0.75))
```
#### SETTING SEED
i.e
```
set.seed(3)
sim_fair_coin <- sample(outcomes, size = 100, replace = TRUE)
table(sim_fair_coin)/length(sim_fair_coin)
```

# BASIC FUNCTIONS
```
- any( )

- is.na()

- which( )
```
In the case of which, it is important to note that e.g.
uesi$city[which(uesi$PUBTRANS.UESI > 85 & uesi$TREECAP.UESI > 85)]
When 2 conditions are used in subsetting, which() is used
```
- table(val1, val2)

- aggregate(column1 ~ column2, data = x, FUN = formula)
```
In the case of aggregate, an aggregate function gets the populations by continent
```
- max(), min(), range()

- IQR(), mean(), sd(), median(), sum(x, na.rm = TRUE)

- head(), tail(), str(), dim(), unique(), summary()

- nrow(), ncol(), colnames(), rownames()

- quantile(dataset, c(0.025, 0.975))

- rbind(), cbind()
```

# NORMAL DISTRIBUTIONS

#### PLOTTING
``` 
qqnorm(h_min)
qqline(h_min, col=2, lwd=2)
```
To plot normal distribution curve on a histogram as mentioned earlier
```
curve(dnorm(x, mean = XY, sd = YX),
	add = TRUE, # Adding to the plot
	from = value2,
	to = value1,
	col = "red",
	lty = 2     # 2 is for dotted lines)
```
#### FINDING STATISTICS

To find proportion of a certain event falling below a certain probability, use pnorm
```
pnorm(x, mean, sd)
i.e. pnorm(0.45, mean = 2, sd = 0.1)
```
 
 #### GENERATE NORMAL VARIABLES
 ```
 w <- rnorm(100, mean = X, sd = Y)
 ```
 where 100 refers to the size of obs.
  
 
# CORRELATIONS

1. Quantitative Variables Condition

2. Straight Enough Condition

3. No Outliers Condition

4. Does the Plot Thicken Condition


#### POSSIBLE REASONS FOR CORRELATION

- Lurking Variables
- Reverse Causality
- Mutual Causality
- Pure Randomness
