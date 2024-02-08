
rm(list = ls(all.names = TRUE)) #Clear all()

library(readxl)
data <- readxl::read_excel("Desktop/Physics/Physics Lab III/LO6/DF/data.xlsx", 
                           sheet = "Sheet3")

centre <- lm(x ~ m, data = data)
summary(centre)

plot(data$m, data$x,  cex = 0.5, pch = 16, ylab = "x (px)", xlab = "m")
arrows(y0 = data$x - data$dx, x0 = data$m, y1 = data$x + data$dx, x1 = data$m, code = 3, angle = 90, length = 0.03, col = "black", lwd = 1)

abline(centre, lty = 2, col = "green")
points(0, 495.09, cex = 0.75, pch = 1, col = "red")

grid(NULL, NULL, lty = 3, col = "lightgray")

legend(
  x = "bottomright", inset = .02,
  legend = c("Position of m-th order", "Linear fit", "Estimated central maximum"),
  pch = c(16, NA, 1),
  lty = c(NA, 1),
  col = c("Black", "Green", "Red"),
  cex = 1
)
