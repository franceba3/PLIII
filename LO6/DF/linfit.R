rm(list = ls(all.names = TRUE)) #Clear all()

library(readxl)
data <- readxl::read_excel("Desktop/Physics/Physics Lab III/LO6/DF/data.xlsx", 
                           sheet = "Sheet2")

linear <- lm(r ~ m, data = data)
summary(linear)

plot(data$m, data$r * 1e6,  cex = 0.5, pch = 16, ylab = expression(Delta*x (mu*m)), xlab = "m")
arrows(y0 = (data$r - data$dr) * 1e6, x0 = data$m, y1 = (data$r + data$dr) * 1e6, x1 = data$m, code = 3, angle = 90, length = 0.03, col = "black", lwd = 1)

linear$coefficients[c("m")] <- linear$coefficients[c("m")] * 1e6

abline(linear, lty = 2, col = "green")
grid(NULL, NULL, lty = 3, col = "lightgray")

#text(-4, 1000, expression(Delta*x (m) == (1.6e-6 pm 1.8e-6) + 3.488e-6 pm 4.))

legend(
  x = "bottomright", inset = .02,
  legend = c("Distance to m-th order", "Linear fit"),
  pch = c(16, NA),
  lty = c(NA, 1),
  col = c("Black", "Green")
)

box()