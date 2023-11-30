###################################
############ TAREA 8 ##############
###################################
### Mauricio Arismendi Aedo #######
###################################
### m.arismendi02@ufromail.cl######
###################################
# Ingeniería en Recursos Naturales#
??colsum
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
list.files()
chinamuerta <- read.csv("veg_chinamuerta.csv")
str(chinamuerta)
lim <- owin(c(0,50),c(0,50))
plot(lim)

#subseteamos, porque con factor se me alargó demasiado

altaSeveridad <- subset(chinamuerta, severidad =="alta")
altaSeveridadppp <- ppp(altaSeveridad$x, altaSeveridad$y, window=lim)
plot(altaSeveridadppp, cex=1, pch=21, bg="red", main="Rebrotes en zonas de alta Severidad")

as.pcf <- pcf(altaSeveridadppp, r=seq(0,5, by=0.1))
plot(as.pcf, xlim=c(0,5), main=("PCF Rebrotes en Zonas de Alta Severidad"), xlab= c
     ("Distancia radial"))
ms.env<-envelope(altaSeveridadppp,pcf, correction="better", nsim=99,
                 r=seq(0,5, by=0.1))
plot(ms.env,ylim=c(0.3,3.8),main="PCF Rebrotes en Alta Severidad",
     xlim=c(0,5), xlab="Distancia Radial. (r)", las=1)  

#Mediana severidad subset y puntos
mediaSeveridad<-subset(chinamuerta, severidad=="media")
ms.ppp<-ppp(mediaSeveridad$x, mediaSeveridad$y, window=lim)
summary(ms.ppp)
plot(ms.ppp, cex=1, pch=21, bg="yellow", main="Rebrotes en zonas de media Severidad")



#media severidad
ms.pcf<-pcf(ms.ppp, r=seq(0,5, by=0.1))
plot(ms.pcf, xlim=c(0,5), xlab = ("Distancia Radial"))
     
#intervalo de confianza 
ms.env<-envelope(ms.ppp,pcf, correction="isotropic", nsim=99,
                      r=seq(0,5, by=0.1))
     plot(ms.env,ylim=c(0.1,100),main="PCF Rebrotes en Alta Severidad",
          xlim=c(0,5), xlab="Distancia Radial. (r)", las=1)     


