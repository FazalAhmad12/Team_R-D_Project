data <- read.csv("Wimbledon-men-2013.csv")

fsw <- data$FSW.1
ssw <- data$SSW.1

# Plots
hist(fsw, main="Distribution of First Serve Won (FSW1)", xlab="FSW1")
hist(ssw, main="Distribution of Second Serve Won (SSW1)", xlab="SSW1")

plot(fsw, ssw,
     main="FSW1 vs SSW1",
     xlab="First Serve Won",
     ylab="Second Serve Won")

# Correlations
cor.test(fsw, ssw, method="pearson")
cor.test(fsw, ssw, method="spearman")
cor.test(fsw, ssw, method="kendall")
