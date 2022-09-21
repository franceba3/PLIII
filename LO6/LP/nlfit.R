rm(list = ls(all.names = TRUE)) #Clear all()

library(readxl)
library(NISTnls)
library(gslnls)
#library(devtools)
#library(nlcor)

data <- readxl::read_excel("Desktop/Physics/Physics Lab III/LO6/LP/data.xlsx", 
                   sheet = "Sheet2")

fitdata <- data.frame(
  #s = sin(pi*data$t/180)^2,
  s = pi*data$t/180,
  r = data$r
)

#Model <- r ~ (sin(s - asin(sin(s)/n)))^2/(sin(s + asin(sin(s)/n)))^2
#Model <- r ~ a*(sin(s - asin(sin(s)/n)))^2/(sin(s + asin(sin(s)/n)))^2
#Model <- r ~ a*(sin(s + d - asin(sin(s + d)/n)))^2/(sin(s + d + asin(sin(s + d)/n)))^2
Model <- r ~ ((cos(s) - sqrt(n^2 - (sin(s))^2))/(cos(s) + sqrt(n^2 - (sin(s))^2)))^2
ig <- c(n = 1.5)


Fit <- gsl_nls(
  algorithm = "lm",
  fn = Model,
  data = fitdata,
  start = ig
)

summary(Fit)


##Eval
u <- seq(from = 15, to = 85, by = 0.2)
eval <- function(x, n) {
  y = pi*x/180
  return(((cos(y) - sqrt(n^2 - (sin(y))^2))/(cos(y) + sqrt(n^2 - (sin(y))^2)))^2)
}

ru <- eval(u, 1.49935)

par(mfrow = c(1, 1), mar = c(4, 6, 2, 2))

plot(data$t, data$r, xlab = expression(theta~(º)), ylab = expression(frac(R[perp]^2, A[perp]^2)), cex = 0.75, pch = 16)

#Grid
axis(1,
     at = seq(20, 80, by = 10),
     tck = 1, lty = 2, col = "lightgray")

axis(2,
     at = seq(0.1, 0.4, by = 0.1),
     tck = 1, lty = 2, col = "lightgray")

box()

lines(u, ru, col="green")

#Errorbars
arrows(x0 = data$t - data$dt, y0 = data$r, x1 = data$t + data$dt, y1 = data$r, code = 3, angle = 90, length = 0.03, col = "black", lwd = 2)
arrows(x0 = data$t, y0 = data$r - data$dr, x1 = data$t, y1 = data$r + data$dr, code = 3, angle = 90, length = 0.03, col = "black", lwd = 2)

legend(
  x = "topleft", inset = .02,
  #legend = c("Reflectivity"),
  #pch = 16,
  #col = c("Black"),
  legend = c("Reflectivity", "Regression"),
  pch = c(16, NA),
  lty = c(NA, 1),
  col = c("Black", "Green")
)

