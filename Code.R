# R Code for Exploring Rows and Columns

df <- read.csv("Wimbledon-men-2013.csv")

# Basic exploration
head(df)
tail(df)

# Number of rows and columns
nrow(df)
ncol(df)

# Column names
colnames(df)

# Structure and summary
str(df)
summary(df)

# Column operations
df_cols <- df[ , c("Player", "Round", "Result")]
df$WinFlag <- ifelse(df$Result == "W", 1, 0)

# Row operations
df_first10 <- df[1:10 , ]
df_winners <- subset(df, Result == "W")
df_round1_losers <- subset(df, Round == "R1" & Result == "L")
