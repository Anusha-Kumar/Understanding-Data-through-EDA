## Exploratory Data Analysis

# Part 1 - Data Import and Cleaning

### Import the data from CSV file to a dataframe named df1
df1 = read.csv('Amazon_Products.csv', header = TRUE)
df1 = df1[,c(1:14)]

### View the imported data
View(df1)

### Retrieve the dimensions of dataframe
dim(df1)

### Print first 5 rows of dataframe
head(df1)

### Print the column names of the dataframe
colnames(df1)

### Print the structure of the dataframe: name and datatype (class) of each column
str(df1)

### Print the class of each column
sapply(df1, class)


# Data Cleaning

### Converting the price column from String to Numeric
df1$price = substring(df1$price, 3) #Removing the currency
df1$price = as.double(df1$price)
### Similarly converting other numeric columns
df1$number_of_reviews = as.numeric(df1$number_of_reviews)
df1$number_of_answered_questions = as.numeric(df1$number_of_answered_questions)
df1$average_review_rating = as.double(substring(df1$average_review_rating,1,3))
df1$number_available_in_stock = unlist(lapply(df1$number_available_in_stock, FUN = function(x) strtoi(strsplit(x,'Â')[[1]][1])))


### Converting categorical columns as a factor variable
### Printing unique manufacturers and their frequency in the data
table(df1$manufacturer)
unique(df1$manufacturer)
df1$manufacturer = as.factor(df1$manufacturer)
### Printing unique combinations of category and sub-category of products in the data
unique(df1$amazon_category_and_sub_category)
df1$amazon_category_and_sub_category = as.factor(df1$amazon_category_and_sub_category)

### Print the class of each column
sapply(df1, class)
