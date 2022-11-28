rm(list = ls(all.names = TRUE))

xn <- data.frame(
  x <- c(2.63749E+12, 2.87957E+12, 3.09359E+12, 3.77038E+12, 4.03138E+12),
  n <- c(1.62153188, 1.62323294, 1.624336782, 1.63328311, 1.63420595)
)

linest <- lm(n ~ x, data = xn)
B <- summary(linest)$coefficients[2, 1]
A <- summary(linest)$coefficients[1, 1]

plot(x * 1e-12, A + B*x, xlab = expression(x (mu * m^-2)), ylab = "n", pch = 16, cex = .75)
title("Evolution of the refractive index with the wavelength") 

u <- seq(2.6, 4.2, by = 0.1)
lines(u, A + B*u*1e+12, col = "green", lty = 5)

text(3.15, 1.630, expression(n ==  1.595 + 9.915 %.% 10^{-15}*x))
text(3.0, 1.629, expression(R^2 == 0.9777))

legend(
  x = "bottomright", 
  inset = .02, 
  legend = c("Experimental data", "Linear regression"),
  pch = c(16, NA),
  lty = c(NA, 5), 
  col = c("black", "green")
)

