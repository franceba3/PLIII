rm(list = ls(all.names = TRUE)) #Clear all()ç

library(readxl)
data <- readxl::read_excel("Desktop/Physics/Physics Lab III/LO6/DF/data.xlsx", 
                           sheet = "Sheet2")

plot(data$r, data$m)