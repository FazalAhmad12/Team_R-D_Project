wim <- read.csv("Wimbledon-men-2013.csv")

# Create winner/loser variables for FSW and SSW
wim$WinnerFSW <- ifelse(wim$Result == 1, wim$FSW.1, wim$FSW.2)
wim$LoserFSW  <- ifelse(wim$Result == 1, wim$FSW.2, wim$FSW.1)

wim$WinnerSSW <- ifelse(wim$Result == 1, wim$SSW.1, wim$SSW.2)
wim$LoserSSW  <- ifelse(wim$Result == 1, wim$SSW.2, wim$SSW.1)

# Paired t-tests
t.test(wim$WinnerFSW, wim$LoserFSW, paired = TRUE)
t.test(wim$WinnerSSW, wim$LoserSSW, paired = TRUE)

# Logistic regression
model <- glm(Result ~ FSW.1 + SSW.1, data = wim, family = binomial)
summary(model)

# Visualisations
boxplot(wim$WinnerFSW, wim$LoserFSW,
        names = c("Winner FSW", "Loser FSW"),
        main = "First-Serve Points Won: Winner vs Loser")

boxplot(wim$WinnerSSW, wim$LoserSSW,
        names = c("Winner SSW", "Loser SSW"),
        main = "Second-Serve Points Won: Winner vs Loser")

hist(wim$WinnerFSW - wim$LoserFSW,
     main = "Distribution of FSW Differences",
     xlab = "FSW Difference (Winner - Loser)")
