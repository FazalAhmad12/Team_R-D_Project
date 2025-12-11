
df <- read.csv("Wimbledon-men-2013.csv")

str(df)
summary(df)

round_counts <- table(df$Round)
print(round_counts)

wins_per_player <- aggregate(Result ~ Player, data=df, function(x) sum(x == "W"))
colnames(wins_per_player)[2] <- "Wins"
print(head(wins_per_player))


hist(wins_per_player$Wins,
     main="Distribution of Wins per Player",
     xlab="Number of Wins")

barplot(round_counts,
        main="Matches per Round",
        xlab="Round",
        ylab="Count")

top_players <- wins_per_player[order(-wins_per_player$Wins), ]
print(head(top_players, 10))

qf <- subset(df, Round == "QF")
print(head(qf))
