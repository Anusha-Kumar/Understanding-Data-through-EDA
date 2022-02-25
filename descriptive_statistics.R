# Part 2 - Descriptive Statistics

## With a user-defined function to print statistics of columns
desc_stats<- function(req_col, colname){
  #Args: req_col - column vector, colname - name of the column
  #Output: A dataframe with descriptive statistics of the column
  data.frame(
  feature = colname,
  mean = mean(req_col, na.rm = TRUE), #Mean
  median = median(req_col, na.rm = TRUE), #Median
  stddev = sd(req_col, na.rm = TRUE), #Standard deviation
  min = min(req_col, na.rm = TRUE), #Minimum value
  max = max(req_col, na.rm = TRUE), #Maximum value
  nas_count = sum(is.na(req_col)) #Number of NAs
  )
}

### Print output of descriptive statistics on quantitative columns as a single dataframe
rbind(desc_stats(df1$price, "Price"),
      desc_stats(df1$number_available_in_stock, "Number available in stock"),
      desc_stats(df1$number_of_reviews, "Number of reviews"),
      desc_stats(df1$number_of_answered_questions, "Number of answered questions"),
      desc_stats(df1$average_review_rating, "Average review rating"))


## With in-built function
summary(df1)
colSums(is.na(df1)) #Counting number of NAs


## Correlation between numeric features
cor(df1[,c(4:8)], use = "complete.obs")

