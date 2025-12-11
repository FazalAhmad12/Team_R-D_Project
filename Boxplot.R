# Read the CSV file
df <- read.csv("Wimbledon-men-2013.csv", header = TRUE, stringsAsFactors = FALSE)

# Convert blank strings and "NA" strings to proper NA
df[df == "" | df == "NA"] <- NA

aces_long <- df %>%
  select(Player1, Player2, ACE.1, ACE.2) %>%
  pivot_longer(cols = c(ACE.1, ACE.2),
               names_to = "AceType",
               values_to = "Aces")

boxplot(Aces ~ AceType,
        data = aces_long,
        main = "Distribution of Aces (Player1 vs Player2)",
        xlab = "Ace Column",
        ylab = "Number of Aces",
        col = c("skyblue", "lightgreen"))

numeric_df <- df %>% select(where(is.numeric))

boxplot(numeric_df,
        main = "Boxplot of All Numeric Match Statistics",
        las = 2,
        col = "orange")