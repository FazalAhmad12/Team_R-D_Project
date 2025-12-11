library(readr)
Wimbledon_men_2013_1_ <- read_csv("Wimbledon-men-2013 (1).csv")
wmen <-read.csv("Wimbledon-men-2013 (1).csv")
summary(wmen)
head(wmen, 5)
clean <- na.omit(wmen[, c("FSW.1", "SSW.1")])
plot(clean$FSW.1, clean$SSW.1,xlab = "FSW.1 (First-Serve Points Won)",
     ylab = "SSW.1 (Second-Serve Points Won)",
     main = "Scatterplot of FSW.1 vs SSW.1",pch = 19)
abline(lm(SSW.1 ~ FSW.1, data = clean), col = "red")
