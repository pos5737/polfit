Here's some code to answer the questions.

```
# questions 1 and 2
state_df <- df %>%
  filter(year == 2013 & body == "house") %>%
  group_by(state) %>%
  summarize(avg_ideology = mean(ideology)) %>%
  mutate(state = reorder(state, avg_ideology)) %>%
  glimpse()
ggplot(agg_df, aes(x = avg_ideology, y = state)) + 
  geom_point()

# questions 3 and 4
dem_df <- df %>%
  filter(year == 2013 & body == "house" & party == "D") %>%
  group_by(state) %>%
  summarize(avg_ideology = mean(ideology)) %>%
  mutate(state = reorder(state, avg_ideology)) %>%
  glimpse()
ggplot(dem_df, aes(x = avg_ideology, y = state)) + 
  geom_point()

# questions 5 and 6
rep_df <- df %>%
  filter(year == 2013 & body == "house" & party == "R") %>%
  group_by(state) %>%
  summarize(avg_ideology = mean(ideology)) %>%
  mutate(state = reorder(state, avg_ideology)) %>%
  glimpse()
ggplot(rep_df, aes(x = avg_ideology, y = state)) + 
  geom_point()

# questions 7 and 8
order_fn <- function(x) {
  diff(range(x))
}
party_df <- df %>%
  filter(year == 2013 & body == "house") %>%
  group_by(state, party) %>%
  summarize(avg_ideology = mean(ideology)) %>%
  ungroup() %>%
  mutate(state = reorder(state, avg_ideology, order_fn)) %>%
  glimpse()
ggplot(party_df, aes(x = avg_ideology, y = state, color = party)) + 
  geom_point()
```