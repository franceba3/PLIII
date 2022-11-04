
df <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/01sinusoidal",
                 header = FALSE, sep = "\t", dec = ","
                 #No me puedo creer que tenga que poner la ruta entera en RStudio y no en Jupyter. 
                 #Pero bueno, funciona. Un chavalito de casi 20 perdiendo el viernes en esto. Tristísimo.
)
dfapprox <- approxfun(df$V1, df$V2, method = "linear")


df2 <- read.table("/Users/erwinplanck/Desktop/Physics/Physics Lab III/LEM12/Fourier/plots/data/02sinusoidalfrecuencia", 
                  header = FALSE, sep = "\t", dec = ",")

dfapprox <- splinefun(df$V1, df$V2)
dfapprox2 <- approxfun(df2$V1, df2$V2, method = "constant")


dev.new()
par(bg = "#f7f7f7", mfrow = c(2,1)) #Fondo gris claro para la gráfica + subplots 2 filas 1 columna

par(mar = c(1, 2, 1, 1)*3)
plot(df$V1, df$V2, pch = 16, cex = .5, xlab = "t (ms)", ylab = "U (V)")
curve(dfapprox, add = TRUE, col = "red")
curve(dfap, add = TRUE, col = "blue")
grid(NULL, NULL, lty = 3, col = "lightgray")
box()


par(mar = c(1, 2, 1, 1)*3)
plot(df2$V1, df2$V2, pch = 16, cex = .5, xlab ="f (kHz)", ylab = "U (V)")
grid(NULL, NULL, lty = 3, col = "lightgray")
curve(dfapprox2, add = TRUE, col = "green")
box()

