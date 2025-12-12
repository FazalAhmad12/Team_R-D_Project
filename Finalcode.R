library(readr)
library(ggplot2)
Wimbledon_men_2013_1_ <- read_csv("Wimbledon-men-2013 (1).csv")
wmen <-read.csv("Wimbledon-men-2013 (1).csv")
summary(wmen)
head(wmen, 5)
clean <- na.omit(wmen[, c("FSW.1", "SSW.1")])
# Scatterplot
ggplot(wmen, aes(x = FSW.1, y = SSW.1)) +
  geom_point(color = "red", size = 2, alpha = 0.8) +
  geom_smooth(method = "lm", color = "blue", se = FALSE) +
  labs(
    title = "Scatter Plot of FSW1 vs SSW1",
    x = "First Serve Won (FSW1)",
    y = "Second Serve Won (SSW1)"
  ) 
  theme_minimal()
  mean_fsw1 <- mean(wmen$FSW.1, na.rm = TRUE)
  sd_fsw1   <- sd(wmen$FSW.1, na.rm = TRUE)
  
  # Histogram with normal distribution curve
  ggplot(wmen, aes(x = FSW.1)) +
    geom_histogram(
      aes(y = ..density..),
      bins = 15,
      fill = "blue",
      color = "black",
      alpha = 0.7
    ) +
    stat_function(
      fun = dnorm,
      args = list(mean = mean_fsw1, sd = sd_fsw1),
      color = "red",
      linewidth = 1
    ) +
    labs(
      title = "Histogram of First Serve Won (FSW1) with Normal Curve",
      x = "First Serve Won (FSW1)",
      y = "Density"
    ) +
    theme_minimal()
# Perform Spearman's rank correlation test between FSW.1 and SSW.1
spearman_test <- cor.test(wmen$FSW.1, wmen$SSW.1, method = "spearman", exact = FALSE)
print("Spearman's Rank Correlation Test Results:")
print(spearman_test) 
# Perform Kendall's rank correlation test between FSW.1 and SSW.1
kendall_test <- cor.test(wmen$FSW.1, wmen$SSW.1, method = "kendall")
print("Kendall's Rank Correlation Test Results:")
print(kendall_test)
