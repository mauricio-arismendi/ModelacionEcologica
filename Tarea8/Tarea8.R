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


plot(aleatorio, pch=19, cex=0.5, main="Patrón Aleatorio")
summary(aleatorio)
?pch



env.rand<-envelope(aleatorio, pcf, nsim=99, correction="isotropic",
                   r=seq(0, 7, by=0.1))
?envelope

plot(env.rand, ylim=c(0.5,2), xlim=c(0,4), las=1, main="PCF patron aleatorio",
     legend=TRUE)
