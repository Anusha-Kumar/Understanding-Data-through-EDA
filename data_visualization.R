# Part 3 - Basic Data Visualization

## Visualizing quantitative variables

### A histogram and density plot for average review rating
hist(df1$average_review_rating, breaks = seq(2,5,0.1))
plot(density(df1$average_review_rating, na.rm = TRUE))

### A box plot for price
boxplot(df1$price)

### Scatter plot of price and average review rating
plot(df1$price,df1$average_review_rating)
scatter.smooth(df1$price,df1$average_review_rating)

### Scatterplot of all quantitative variables
plot(df1[,c(4:8)])


## Visualizing categorical variables

### A bar graph for any subset of product categories
product_categories = unlist(lapply(df1$amazon_category_and_sub_category, FUN = function(x) strsplit(as.character(x),' >')[[1]][1]))
product_categories = na.omit(product_categories)
barplot(table(product_categories)[1:5])

### A pie chart for any subset of manufacturers
manufacturers = na.omit(df1$manufacturer)
manufacturers = sort(manufacturers, decreasing = TRUE)
pie(table(manufacturers)[2:8])
