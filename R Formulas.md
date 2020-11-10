# R FORMULAS

R Formulas for Quantitative Reasoning



### Types of Graphs

##### SHRINK PLOTS

- par(mfrow = c(1,1))
- par(mar = c(5, 2, 1.1, 0.1))

##### BARPLOTS

- barplot(dataset,

  ​				legend = TRUE,

  ​				args.legend = list(x = "topleft"),

  ​				col = "lightblue",

  ​				pch = "17" # Plotting Character,

  ​				lwd = 3,

  ​				args.legend = list(bty = "n" # Suppress Legend Box,

  ​				x = "topleft",

  ​				ncol = 3)
  ​				)


--------- HISTOGRAMS ---------

- hist(dataset,
	xlim = c(),
	freq = FALSE,
	breaks = c(seq(-0.5, 0.5, 0.01))
	)

--------- STRAIGHT LINES ---------

- abline(v = quantile(dataset, c(0.025, 0.975)),
	col = "orange",
	lwd = 2)

In the case of abline,
- abline(a = for the intercept of the line,
	b = slope of the line,
	h = y-value for the horizontal line,
	v = x-value for the vertical line)


--------- LEGENDS ---------

- legend("topleft / top / etc",
	legend = c("Factor 1", 
		"Factor 2"),
	lty = 1, # Line Type
	lwd = 2, # Line Width
	col = c("orange", "blue"),
	pch = 12 # Plotting Symbols)


--------- SCATTER PLOTS ---------

- plot(col1 ~ col2,
	data = dataset,
	main = "title",
	xlab = "axis",
	ylab = "axis")

- grid()


--------------- LINEAR MODELS ---------------


--------- CORRELATIONS ---------

- cor(dataset$col1, dataset$col2,
	use = "complete.obs")

In this case, complete obs is used to filter NA values out


- model$coefficients

In this case, coefficients give the intercept and slope


- coef(model)

Where the model inside is the linear model


- summary(model)$r.squared

Where this finds the R Squared or the Variance accounted by the model


- predict(model, newdata = data.frame(col1 = val1))

Where model is linear model, new data is a dataframe


--------------- PERMUTATIONS ---------------

- sample(x # elements, 
	size = x_value, 
	replace = TRUE/FALSE, 
	prob = NULL)


--------------- BASIC FUNCTIONS ---------------

- any( )

- which( )

- table(val1, val2)


--------------- CORRELATIONS ---------------

1. Quantitative Variables Condition

2. Straight Enough Condition

3. No Outliers Condition

4. Does the Plot Thicken Condition