###################################
############ TAREA 8 ##############
###################################
### Mauricio Arismendi Aedo #######
###################################
### m.arismendi02@ufromail.cl######
###################################
# Ingeniería en Recursos Naturales#

rm(list = ls())

#1

library(spatstat)

aleatorio <- rpoispp(lambda = 4, win = owin(c(0,14), c(0,20)))
aleatorio

setwd("c:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea8")
list.files()


plot(aleatorio, pch=19, cex=0.5, main="Patrón de puntos aleatorio")
summary(aleatorio)
?pch



env.rand<-envelope(aleatorio, pcf, nsim=99, correction="isotropic",
                   r=seq(0, 7, by=0.1))
?envelope

plot(env.rand, ylim=c(0.5,2), xlim=c(0,4), las=1,
     main="PCF patron puntos aleatorio", xlab = "distancia entre puntos",
     legend=TRUE)

#2

agregado<-rMatClust(0.03, 3, 120, win=owin(c(0,20), c(0,30))) 
agregado
summary(agregado)

plot(agregado, pch=19, cex=0.5, main="Patrón de puntos agregado")

env.agg<-envelope(agregado, pcf, nsim=99, correction="best",
                   r=seq(0, 10, by=0.1))

plot(env.agg, ylim=c(0.5,2), xlim=c(0,4), las=1,
     main="PCF patron puntos agregado", xlab = "distancia entre puntos",
     legend=FALSE)
summary(agregado)

#3


