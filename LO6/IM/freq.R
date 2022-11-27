rm(list = ls(all.names = TRUE))

c = 299792458
#12.26 - 3µ out of optical contact
fm26 <- data.frame(
  f <- c(417538.2, 445456.8, 469894.1, 498822.7, 525951.7, 551089.1, 576524, 606867.3, 628495.7) * 1e9,
  m <- 1:9
)

l26 <- lm(f ~ m, data = fm26)
k26 <- summary(l26)$coefficients[2,1]
summary(l26)
print(0.5*c/k26)
#plot(fm$m, fm$f)


fm25 <- data.frame(
  f <- c(423435.7, 442824.9, 464075, 484317.3, 504701.1, 525030.6, 540077.2, 565446.1, 585532.1) * 1e9, 
  m <- 1:9
)

print(0.5*c/summary(lm(f ~ m, data = fm25))$coefficients[2,1])
