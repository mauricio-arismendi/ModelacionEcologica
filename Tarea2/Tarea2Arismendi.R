#--------------------------------------------
# Tarea 2 Modelación Ecológica
## Mauricio Arismendi Aedo
### m.arismendi02@ufromail.cl
#### Prof. Dr. Andrés Fuentes
#--------------------------------------------


rm(list=ls())

data <- read.csv(file = "C:\\Users\\mauri\\OneDrive\\Desktop\\richness_rncm2016.csv",
                 header = TRUE,
                 sep = ",",
                 dec = ".",
                 fill = TRUE)

getwd()
setwd("C:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea2")
list.files()

#1

str(data)
head(data)
tail(data)
dim(data)
summary(data)

library(vegan)
library(rich)
