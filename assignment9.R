library(ggplot2)
library(lattice)

data("iris", package = "datasets")
head(iris)

plot(iris$Sepal.Length, iris$Petal.Length,
     main = "Base R: Sepal Length vs Petal Length",
     xlab = "Sepal Length (cm)",
     ylab = "Petal Length (cm)",
     pch  = 19,
     col  = as.numeric(iris$Species))

legend("topleft",
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19,
       bty = "n")

hist(iris$Sepal.Width,
     main = "Base R: Distribution of Sepal Width",
     xlab = "Sepal Width (cm)",
     col  = "lightblue",
     border = "white")

xyplot(Petal.Length ~ Sepal.Length | Species,
       data = iris,
       layout = c(3, 1),
       main = "Lattice: Petal vs Sepal Length by Species",
       xlab = "Sepal Length (cm)",
       ylab = "Petal Length (cm)",
       pch  = 19,
       col  = "darkgreen")

ggplot(iris, aes(x = Sepal.Length,
                 y = Petal.Length,
                 color = Species)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "ggplot2: Petal vs Sepal Length with Linear Trend",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)"
  ) +
  theme_minimal()