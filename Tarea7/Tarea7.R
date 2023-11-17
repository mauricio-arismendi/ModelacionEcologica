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

