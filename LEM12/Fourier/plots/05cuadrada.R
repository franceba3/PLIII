rm(list = ls(all.names = TRUE))

df <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/05cuadrada",
                 header = FALSE, sep = "\t", dec = ",")

df2 <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/06cuadradafrecuencia", 
                  header = FALSE, sep = "\t", dec = ",")

dev.new()

par(bg = "#f7f7f7", mfrow = c(2,1)) 

plot(df$V1, df$V2, pch = 16, cex = 0, xlab = "t (ms)", ylab = "U (V)")
lines(df$V1, df$V2, col = "darkblue")

title("Onda cuadrada")
grid(NULL, NULL, lty = 3, col = "lightgray")
box()
#legend(
#  x = "topright", inset = .02,
#  legend = c("Puntos medidos", "Interpolación"),
#  pch = c(16, NA),
#  lty = c(NA, 1),
#  col = c("Black", "Red")
#)

plot(df2$V1, df2$V2, pch = 16, cex = 0, xlab ="f (kHz)", ylab = "U (V)")
lines(df2$V1, df2$V2, col = "darkblue")
title("Espectro de frecuencias")
grid(NULL, NULL, lty = 3, col = "lightgray")
box()
#legend(
#  x = "topright", inset = .02,
#  legend = c("Puntos medidos", "Interpolación"),
#  pch = c(16, NA),
#  lty = c(NA, 1),
#  col = c("Black", "Green")
#)