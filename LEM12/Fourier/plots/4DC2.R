rm(list = ls(all.names = TRUE))

library(gslnls)

df <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/DC2sinusoidal", 
                 header = FALSE, sep = "\t", dec = ",")
df2 <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/DC2frecuencia", 
                  header = FALSE, sep = "\t", dec = ",")
swave <- V2 ~ A*sin(2*pi/T*V1) + C

dfapprox <- gsl_nls(
  algorithm = "lm",
  fn = swave,
  data = df,
  start = c(A = 10, T = 1, C = 5)
)
summary(dfapprox)


t <- seq(from = 0, to = tail(df$V1, 1), by = 0.01)
sinusoidal <- function(t) {
  return(8.104*sin(2*pi/1.004 * t) + 2.824)
}

rt = sinusoidal(t)
dev.new()
par(bg = "#f7f7f7", mfrow = c(2,1))

plot(df$V1, df$V2, pch = 16, cex = 0, xlab = "t (ms)", ylab = "U (V)", ylim = c(-6, 11))
grid(NULL, NULL, lty = 3, col = "lightgray")
title("DC")
lines(t, rt, col = "darkblue")
box()
lines(t, replicate(length(t), 0), col = "black")

plot(df2$V1, df2$V2, pch = 16, cex = 0, xlab ="f (kHz)", ylab = "U (V)")
title("Espectro de frecuencias")
grid(NULL, NULL, lty = 3, col = "lightgray")
lines(df2$V1, df2$V2, col = "darkblue")
box()
