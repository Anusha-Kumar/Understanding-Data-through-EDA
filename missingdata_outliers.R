# Part 4 - Missing data imputation and Outlier detection

## Methods of missing data imputation

### Mean imputation of price column
df3 = df1
df3$price[is.na(df3$price)] <- mean(df3$price, na.rm = TRUE)

### Predictive Mean Matching
library(mice)
df2 = mice(df1[,c(4:8)], method = "pmm", m=5)
df2 = complete(df2,2)
colSums(is.na(df2))

### Imputing categorical variables
### Dropping observations with missing values
na.omit(df1)

### Imputing with mode of categorical variable
mode_prdt_category = names(sort(table(product_categories), decreasing = TRUE)[1])
df3$amazon_category_and_sub_category[is.na(as.character(df3$amazon_category_and_sub_category))] <- mode_prdt_category


## Outlier Detection in a single variable
boxplot.stats(df1$price)$out # Set of outliers from a boxplot
