#----------------------------------------
########### T A R E A   4  ##############
#---------------------------------------

getwd()

#Selecciona directorio de trabajo donde R lee archvos de entrada
setwd("c:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea4") #windows
list.files()

library(survival)
library(rms)

rm(list=ls())

dat<-read.csv("aca.canopy.surv.csv", header = TRUE, sep = ";")
 
str(dat)
head(dat)
tail(dat)

#1

#creamos nuestro objeto tipo "survival"
sobrevivencia <- Surv(dat$time, dat$event)

#curvas de Kaplan-Meier
surv.s <- survfit(sobrevivencia ~ species, data = dat)

summary(surv.s)

#graficamos

plot(surv.s, lty = 2, xlim = c(0,10), col = c("chocolate4", "chocolate"), lwd = 2,
     main = "Kaplan-Meier C.alba v/s A.dealbata ", xlab = "Tiempo (días)", ylab = "Probabilidad de supervivencia",
     las = 1)
legend("bottomleft", c("Aromo", "Peumo"), lty=2, bty="n", col=c("chocolate4", "red"), cex = 1)

#2 

tapply(dat$event, dat$species, sum)


#4


dd.data<-datadist(dat)
options(datadist="dd.data")

m2<-psm(sobrevivencia ~ species, data=dat, y = T, dist="weibull")

summary(m2)

anova(m2)

# Plot the outcome from the model
survplot(m2, species, fun=function(y) (y), lwd=2,
         col=c("black", "red"),ylab="Probabilidad de Supervivencia", xlab="Tiempo (días)",
         ylim=c(0,1))



