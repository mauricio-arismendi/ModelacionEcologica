###################################
############ TAREA 8 ##############
###################################
### Mauricio Arismendi Aedo #######
###################################
### m.arismendi02@ufromail.cl######
###################################
# Ingeniería en Recursos Naturales#

rm(list = ls())

library(spatstat)

aleatorio <- rpoispp(lambda = 4, win = owin(c(0,14), c(0,20)))
aleatorio

plot(aleatorio)
