###############################
############ TAREA 7 ##########
###############################
### Mauricio Arismendi Aedo ###
###############################
### m.arismendi02@ufromail.cl##
###############################



rm(list = ls())

#cargando datos y librerias

library(vegan)
data(dune)
data(dune.env)
dune.env
install.packages("scatterplot3d", depedencies = TRUE)
library(scatterplot3d)
library(vegan)
library(permute)

#conociendo datos

summary(dune)
summary(dune.env)
str(dune)
str(dune.env)

head(dune)
colnames(dune)
str(dune)

head(dune)
tail(dune)

#1
#Profundidad horizonte A suelos respecto a especies y tipo de uso de suelos
#dune.env$A1
#plot(table(dune.env$A1, dune.env$Use), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Tamaño horizonte A por uso") 
?dune.env
?dune

plot(dune.env$Use, dune.env$A1, main = "Profundidad Horizonte A, respecto a Uso de Suelo", xlab = "Uso de Suelo", ylab = "Profundidad de Horizonte A")
tapply(dune.env$A1 , FUN = mean)

plot(dune.env$Management, dune.env$A1, main = "Uso de suelo")


#Especies de aacuerdo a Profundidad Horizonte A 
