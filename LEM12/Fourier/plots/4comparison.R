rm(list = ls(all.names = TRUE))

library(gslnls)

df <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/DCsinusoidalreconstruida", 
                 header = FALSE, sep = "\t", dec = ",")

df2 <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/DCsinusoidalreconstruidasin0", 
                  header = FALSE, sep = "\t", dec = ",")

swave <- V2 ~ A*sin(2*pi/T*V1)
swaveu <- V2 ~ A*sin(2*pi/T*V1) + C

dfapprox <- gsl_nls(
  algorithm = "lm",
  fn = swaveu,
  data = df,
  start = c(A = 10, T = 1, C = 5)
)
summary(dfapprox)

t <- seq(from = 0, to = tail(df$V1, 1), by = 0.01)
sinusoidalu <- function(t) {
  return(8.611*sin(2*pi/1.004 * t) + 1.193)
}
rt = sinusoidalu(t)

dfapprox2 <- gsl_nls(
  algorithm = "lm",
  fn = swave,
  data = df,
  start = c(A = 10, T = 1)
)
summary(dfapprox2)

t2 <- seq(from = 0, to = tail(df2$V1, 1), by = 0.01)
sinusoidalu <- function(t2) {
  return(8.611*sin(2*pi/1.004 * t2))
}
rt2 = sinusoidalu(t2)

dev.new()
par(bg = "#f7f7f7", mfrow = c(2,1))

plot(df$V1, df$V2, pch = 16, cex = 0, xlab = "t (ms)", ylab = "U (V)", ylim = c(-10, 10))
grid(NULL, NULL, lty = 3, col = "lightgray")
title("Señal reconstruida con todos los picos del espectro")
lines(t, rt, col = "darkblue")
box()
lines(t, replicate(length(t), 0), col = "black")

plot(df2$V1, df2$V2, pch = 16, cex = 0, xlab ="t (ms)", ylab = "U (V)", ylim = c(-10, 10))
title("Señal reconstruida sin considerar el pico f = 0")
grid(NULL, NULL, lty = 3, col = "lightgray")
lines(t2, rt2, col = "darkblue")
lines(t, replicate(length(t2), 0), col = "black")
box()

##COMPARACIÓN 2

dev.new()
par(bg = "#f7f7f7", mfrow = c(2,2))

plot(df$V1, df$V2, pch = 16, cex = 0, xlab = "t (ms)", ylab = "U (V)", ylim = c(-10, 10))
grid(NULL, NULL, lty = 3, col = "lightgray")
title("Señal reconstruida con todos los picos del espectro")
lines(t, rt, col = "darkblue")
box()
lines(t, replicate(length(t), 0), col = "black")

plot(df2$V1, df2$V2, pch = 16, cex = 0, xlab ="t (ms)", ylab = "U (V)", ylim = c(-10, 10))
title("Señal reconstruida sin considerar el pico f = 0")
grid(NULL, NULL, lty = 3, col = "lightgray")
lines(t2, rt2, col = "darkblue")
lines(t, replicate(length(t2), 0), col = "black")
box()

##COMPARACIÓN 3

dev.new()

plot(df$V1, df$V2, pch = 16, cex = 0, xlab = "t (ms)", ylab = "U (V)", ylim = c(-10, 10))
grid(NULL, NULL, lty = 3, col = "lightgray")
title("Comparación entre las señales \n construidas con y sin el pico f = 0")
lines(t, rt, col = "darkblue", lty = 1)
lines(t2, rt2, col = "red", lty = 1)
lines(t, replicate(length(t), 0), col = "black")
legend(
  x = "bottomleft", inset = .02,
  legend = c("Reconstrucción con f=0", "Reconstrucción sin f=0"),
  lty = c(1, 1),
  col = c("darkblue", "red"),
  bg = "white",
  cex = c(0.75, 0.75)
)

box()

