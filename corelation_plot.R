# Load dataset
data <- read.csv("Wimbledon-men-2013.csv")

# Select variables
fsw <- data$FSW.1
ssw <- data$SSW.1

# Scatterplot with trendline
plot(fsw, ssw,
     main="Relationship Between First Serve Won and Second Serve Won",
     xlab="First Serve Won (FSW1)",
     ylab="Second Serve Won (SSW1)",
     pch=19, col="blue")

# Add linear trendline
abline(lm(ssw ~ fsw), col="red", lwd=2)

# Spearman correlation
spearman_result <- cor.test(fsw, ssw, method="spearman")
spearman_result
