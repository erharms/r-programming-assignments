install.packages("ggplot2")
data(mtcars)
head(mtcars)
avg_mpg <- tapply(mtcars$mpg, mtcars$cyl, mean)

colors <- ifelse(avg_mpg > mean(avg_mpg), "darkred", "grey")

barplot(
  avg_mpg,
  col = colors,
  border = NA,
  main = "Average MPG by Number of Cylinders",
  xlab = "Cylinders",
  ylab = "Miles per Gallon"
)
mtcars_ordered <- mtcars
  arrange(hp)
  mutate(order = row_number())

ggplot(mtcars_ordered, aes(x = order, y = mpg)) +
  geom_line(color = "steelblue") +
  geom_point(size = 2) +
  labs(
    title = "MPG Across Cars Ordered by Horsepower",
    x = "Cars (Ordered by Horsepower)",
    y = "Miles per Gallon"
  ) +
  theme_minimal(base_size = 12)

ggplot(mtcars_ordered, aes(x = order, y = mpg, color = factor(am))) +
  geom_line() +
  geom_point(size = 2) +
  labs(
    title = "MPG Pattern by Transmission Type",
    x = "Cars (Ordered by Horsepower)",
    y = "Miles per Gallon",
    color = "Transmission"
  ) +
  scale_color_manual(labels = c("Automatic", "Manual"),
                     values = c("orange", "darkgreen")) +
  theme_minimal(base_size = 12)

