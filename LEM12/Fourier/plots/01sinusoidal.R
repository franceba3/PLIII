rm(list = ls(all.names = TRUE))

library(gslnls)

df <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/01sinusoidal",
                 header = FALSE, sep = "\t", dec = ","
                 #No me puedo creer que tenga que poner la ruta entera en RStudio y no en Jupyter. 
                 #Pero bueno, funciona. Un chavalito de casi 20 perdiendo el viernes en esto. Tristísimo.
)

dfapprox <- approxfun(df$V1, df$V2, method = "linear")

df2 <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/02sinusoidalfrecuencia", 
                  header = FALSE, sep = "\t", dec = ",")

#dfapprox <- splinefun(df$V1, df$V2)
#dfapprox2 <- approxfun(df2$V1, df2$V2, method = "constant")
swave <- V2 ~ A*sin(2*pi/T*V1)

dfapprox <- gsl_nls(
  algorithm = "lm",
  fn = swave,
  data = df,
  start = c(A = 10, T = 1)
)
summary(dfapprox)

t <- seq(from = 0, to = tail(df$V1, 1), by = 0.01) #LETS FRY THIS MACHINE BABYYYYY
sinusoidal <- function(t) {
  return(9.636*sin(2*pi/9.653e-1 * t))
}

rt = sinusoidal(t)

dev.new()

par(bg = "#f7f7f7", mfrow = c(2,1)) #Fondo gris claro para la gráfica + subplots 2 filas 1 columna

plot(df$V1, df$V2, pch = 16, cex = 0, xlab = "t (ms)", ylab = "U (V)")
#curve(dfapprox, add = TRUE, col = "red")
title("Onda sinusoidal")
lines(t, rt, col = "blue")
grid(NULL, NULL, lty = 3, col = "darkblue")
box()
#legend(
#  x = "topright", inset = .02,
#  legend = c("Puntos medidos", "Interpolación"),
#  pch = c(16, NA),
#  lty = c(NA, 1),
#  col = c("Black", "Red")
#)

plot(df2$V1, df2$V2, pch = 16, cex = 0, xlab ="f (kHz)", ylab = "U (V)")
title("Espectro de frecuencias")
grid(NULL, NULL, lty = 3, col = "lightgray")
#curve(dfapprox2, add = TRUE, col = "green")
lines(df2$V1, df2$V2, col = "darkblue")
box()
#legend(
#  x = "topright", inset = .02,
#  legend = c("Puntos medidos", "Interpolación"),
#  pch = c(16, NA),
#  lty = c(NA, 1),
#  col = c("Black", "Green")
#)
