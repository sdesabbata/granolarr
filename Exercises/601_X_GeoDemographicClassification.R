##########
# Example for Practical 8
# Author: Stefano De Sabbata
# Date: 24 Septemnber 2019
# Licensed under the GNU General Public License v3.0 https://www.gnu.org/licenses/gpl-3.0.html
##########

library(tidyverse)

# Load 2011 Output Area Classification data -------------------------------

# The line below will work for Practical 8, if the data is in your R project folder
#leicester_2011OAC <- read_csv("2011_OAC_Raw_uVariables_Leicester.csv")

# The line below will work if you are working from the main repository
leicester_2011OAC <- read_csv("Data/2011_OAC_Raw_uVariables_Leicester.csv")


# Example 1 ---------------------------------------------------------------

# k-means on two variables

# Step 1: plot

leicester_2011OAC %>%
  ggplot(
    aes(
      x = u011, 
      y = u016, 
    )
  )+
  geom_point()

# Step 2: cluster

geodemog_class_1 <- leicester_2011OAC %>%
  select(u011, u016) %>%
  kmeans(centers=2, iter.max=50)

leicester_my_geodemo <- leicester_2011OAC %>%
  add_column(geodemog_class_1 = geodemog_class_1$cluster)

# Step 3: plot result

leicester_my_geodemo %>%
  ggplot(aes(
    x = u011, y = u016, 
    colour = factor(geodemog_class_1))) +
  geom_point() +
  theme(legend.position = "bottom") +
  scale_color_brewer(palette = "Set1")


# Example 2 ---------------------------------------------------------------

# Finding the optimal number of clusters

data_to_cluster <- data.frame(
  x_values = c(rnorm(40, 5, 1), rnorm(60, 10, 1), rnorm(20, 12, 3)),
  y_values = c(rnorm(40, 5, 1), rnorm(60, 5, 3), rnorm(20, 15, 1))
  )


data_to_cluster %>%
  ggplot(
    aes(
      x = x_values, 
      y = y_values, 
    )
  )+
  geom_point()

# Number of samples per k
bootstrap_n <- 1000

# k values to be taken into account
within_sum_squares <- rep(0,15)

# Value for k = 1 (only one cluster)
within_sum_squares[1] <- (nrow(data_to_cluster)-1)*sum(apply(data_to_cluster,2,var))

for (i in 2:15){
  print(i)
  # Bootstrapping
  # calculated k-means the number of time specified by bootstrap_n
  within_sum_squares_bootstrap <- c()
  for (x in 1:bootstrap_n){
    # create the vector containing WCSS per each time k-means is calculated
    within_sum_squares_bootstrap <- c(
      within_sum_squares_bootstrap,
      # Sum within-cluster sum of squares
      # from each cluster
      sum(
        kmeans(
          data_to_cluster, 
          centers=i, iter.max=50
        )$withinss #within-cluster sum of squares
      )
    )
  }
  # take the minimum 
  within_sum_squares[i] <- min(within_sum_squares_bootstrap)
}

# Plot
plot(1:15, within_sum_squares[1:15], type="b", xlab="Number of Clusters", ylab="Within groups sum of squares", xlim=c(1,15))

