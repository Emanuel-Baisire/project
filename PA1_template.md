@@ -68,8 +68,7 @@ Below is a histogram of the daily total number of steps taken, plotted with a bi
  
  ```r
  calc_steps_per_day <- function(tbl) {
 -    steps_per_day <- aggregate(tbl$steps, by = list(Date = tbl$date), FUN = sum, 
 -        na.rm = T)
 +    steps_per_day <- aggregate(steps ~ date, tbl, sum)
      colnames(steps_per_day) <- c("date", "steps")
      steps_per_day
  }
 @@ -96,10 +95,9 @@ plot_steps_per_day(steps_per_day, mean_steps, median_steps)
  
  
  **For the total number of steps taken per day:**  
 -- **Mean: 9354.23**
 -- **Median: 10395**
 +- **Mean: 10766.19**
 +- **Median: 10765**
  
 -We can also observe a significant concentration closer to zero which seems like outliers.
  
  ## What is the average daily activity pattern?
  
 @@ -142,7 +140,8 @@ The **835<sup>th</sup> interval** has the maximum activity on the average.
  
  ## Imputing missing values
  
 -To populate missing values, we choose to replace them with the mean value at the same interval across days.
 +To populate missing values, we choose to replace them with the mean value at the same interval across days. The choice is based on the assumption that activities usually follow a daily pattern.
 +
  
  
  ```r
 @@ -193,7 +192,7 @@ plot_steps_per_day(complete_steps_per_day, complete_mean_steps, complete_median_
  ![plot of chunk complete_steps_per_day](figure/complete_steps_per_day.png) 
  
  
 -Comparing with the calculations done in the first section of this document, we observe that the mean and median values have changed. The histogram replects a more concentrated distribution around the mean. The outliers (closer to 0 steps) have reduced.
 +Comparing with the calculations done in the first section of this document, we observe that while the mean value remains unchanghed, the median value has shifted closer to the mean.
  
  ## Are there differences in activity patterns between weekdays and weekends?
