rm(list = ls(all.names = TRUE)) #Clear all()

library(readxl)
library(NISTnls)
library(gslnls)
data <- readxl::read_excel("Desktop/Physics/Physics Lab III/LO6/LP/data.xlsx", 
                   sheet = "Sheet2")

fitdata <- data.frame(
  #s = sin(pi*data$t/180)^2,
  s = pi*data$t/180,
  r = data$r
)

#Model <- r ~ (sin(s - asin(sin(s)/n)))^2/(sin(s + asin(sin(s)/n)))^2
#Model <- r ~ a*(sin(s - asin(sin(s)/n)))^2/(sin(s + asin(sin(s)/n)))^2
Model <- r ~ a*(sin(s + d - asin(sin(s + d)/n)))^2/(sin(s + d + asin(sin(s + d)/n)))^2
#Model <- r ~ (cos(s) - sqrt(n^2 - (sin(s))^2))/(cos(s) + sqrt(n^2 - (sin(s))^2))
ig <- c(n = 1.5, a = 1, d = 0)


Fit <- gsl_nls(
  algorithm = "lm",
  fn = Model,
  data = fitdata,
  start = ig
)

summary(Fit)

u <- seq(from = 15, to = 85, by = 0.2)
eval <- function(x, a, d, n) {
  y = pi*x/180
  return(a*(sin(y + d - asin(sin(y + d)/n)))^2/(sin(y + d + asin(sin(y + d)/n)))^2)
}

ru <- eval(u, 0.80879, 0.00222, 1.47835)

par(mfrow = c(1, 1), mar = c(4, 6, 2, 2))

plot(data$t, data$r, xlab = expression(theta~(º)), ylab = expression(frac(R[perp]^2, A^2)), cex = 0.75, pch = 16)
lines(u, ru, col="green")

#Grid
axis(1,
     at = seq(20, 80, by = 10),
     tck = 1, lty = 2, col = "lightgray")

axis(2,
     at = seq(0.1, 0.4, by = 0.1),
     tck = 1, lty = 2, col = "lightgray")

box()

legend(
  x = "topleft", inset = .02,
  legend = c("Reflectivity", "Regression"),
  pch = c(16, NA),
  lty = c(NA, 2),
  col = c("Black", "Green")
)
