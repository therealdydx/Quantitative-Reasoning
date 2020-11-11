# R FORMULAS

R Formulas for Quantitative Reasoning

### Contents

1. [Types of Graphs](https://github.com/therealdydx/Quantitative-Reasoning#types-of-graphs) 
2. [Linear Regression](https://github.com/therealdydx/Quantitative-Reasoning#linear-regression) 
3. [Permutations](https://github.com/therealdydx/Quantitative-Reasoning#permutations) 
4. [Basic Functions](https://github.com/therealdydx/Quantitative-Reasoning#basic-functions) 
5. [Normal Distributions](https://github.com/therealdydx/Quantitative-Reasoning#normal-distributions) 
6. [Correlations](https://github.com/therealdydx/Quantitative-Reasoning#correlations) 

# Types of Graphs

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
	names.arg = dataset$column)
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


# BASIC FUNCTIONS
```
- any( )

- which( )

- table(val1, val2)

- aggregate(column1 ~ column2, data = x, FUN = formula)

# In the case of aggregate, an aggregate function gets the populations by continent

- max() and min()

- mean(), sd(), median(), sum()

- head(), tail(), str(), dim(), unique()

- nrow(), ncol(), colnames(), rownames()

- quantile(dataset, c(0.025, 0.975))
```

# NORMAL DISTRIBUTIONS

#### PLOTTING
``` 
qqnorm(h_min)
qqline(h_min, col=2, lwd=2)

```
  
# CORRELATIONS

1. Quantitative Variables Condition

2. Straight Enough Condition

3. No Outliers Condition

4. Does the Plot Thicken Condition
