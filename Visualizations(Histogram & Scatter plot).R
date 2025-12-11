library(readr)
Wimbledon_men_2013_1_ <- read_csv("Wimbledon-men-2013 (1).csv")
wmen <-read.csv("Wimbledon-men-2013 (1).csv")
summary(wmen)
head(wmen, 5)
clean <- na.omit(wmen[, c("FSW.1", "SSW.1")])
plot(clean$FSW.1, clean$SSW.1,xlab = "FSW.1 (First-Serve Points Won)",
     ylab = "SSW.1 (Second-Serve Points Won)",
     main = "Scatterplot of 1st serve won vs 2nd serve won",pch = 19)
abline(lm(SSW.1 ~ FSW.1, data = clean), col = "red")
dv <- wmen$SSW.1
dv <- dv[!is.na(dv)]
hist(dv, breaks = 10, prob = TRUE,   col = "lightblue",main = "Hist of 2nd Serve won with Nrml Curve",xlab = "Dependent Variable")
x_vals <- seq(min(dv), max(dv), length = 100)
normal_curve <- dnorm(x_vals, mean = mean(dv), sd = sd(dv))
lines(x_vals, normal_curve, col = "red", lwd = 2)