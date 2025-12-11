#############################################
# Analysis.R – Wimbledon 2013 Serve Study
# This script performs:
# - Data loading and cleaning
# - Variable creation (WinnerFSW, LoserFSW, WinnerSSW, LoserSSW)
# - Visualisation (boxplots + histogram)
# - Paired t-tests
# - Logistic regression predicting match outcome
#############################################

# Load required packages
library(tidyverse)

# 1. Load dataset
wim <- read.csv("Wimbledon-men-2013.csv")

# 2. Create winner and loser serve variables -------------------------------

# First-Serve Points Won
wim$WinnerFSW <- ifelse(wim$Result == 1, wim$FSW.1, wim$FSW.2)
wim$LoserFSW  <- ifelse(wim$Result == 1, wim$FSW.2, wim$FSW.1)

# Second-Serve Points Won
wim$WinnerSSW <- ifelse(wim$Result == 1, wim$SSW.1, wim$SSW.2)
wim$LoserSSW  <- ifelse(wim$Result == 1, wim$SSW.2, wim$SSW.1)

# 3. Summary statistics ----------------------------------------------------
summary(wim$WinnerFSW)
summary(wim$LoserFSW)
summary(wim$WinnerSSW)
summary(wim$LoserSSW)

# 4. Visualisations --------------------------------------------------------

# Boxplot: FSW
boxplot(wim$WinnerFSW, wim$LoserFSW,
        names = c("Winner FSW", "Loser FSW"),
        main = "First-Serve Points Won: Winners vs Losers",
        xlab = "Match Outcome",
        ylab = "FSW")

# Boxplot: SSW
boxplot(wim$WinnerSSW, wim$LoserSSW,
        names = c("Winner SSW", "Loser SSW"),
        main = "Second-Serve Points Won: Winners vs Losers",
        xlab = "Match Outcome",
        ylab = "SSW")

# Histogram: FSW difference
hist(wim$WinnerFSW - wim$LoserFSW,
     main = "Distribution of FSW Differences",
     xlab = "FSW Difference (Winner - Loser)",
     ylab = "Frequency")

# 5. Hypothesis testing: Paired t-tests ------------------------------------

# Paired t-test for FSW
t_test_fsw <- t.test(wim$WinnerFSW, wim$LoserFSW, paired = TRUE)
print(t_test_fsw)

# Paired t-test for SSW
t_test_ssw <- t.test(wim$WinnerSSW, wim$LoserSSW, paired = TRUE)
print(t_test_ssw)

# 6. Logistic regression ----------------------------------------------------

# Predict match outcome using both serve variables
model <- glm(Result ~ FSW.1 + SSW.1, data = wim, family = binomial)
summary(model)

#############################################
# End of Analysis.R
#############################################
