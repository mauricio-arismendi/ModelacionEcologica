#----------------------------------------
######################  T a r e a  3
####---------------------------------------

getwd()
install.packages("rms", dependencies = TRUE)

setwd("C:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea3\\") 

list.files()

library(survival)
library(rms)

rm(list=ls())


dat<-read.csv("experim_germ_araucaria.csv", header=T,sep=",")


str(dat)
head(dat)
tail(dat)



germ<-Surv(dat$tiempo, dat$germinacion)
germKcurve <- survfit(germ ~ tratamiento, data=dat)


plot(germKcurve, lty=2, xlim=c(0,10), col = c("chocolate4", "red"), lwd = 2,
     main ="Curvas de Germinación Usando Kaplan-Meier", xlab="Tiempo (días)",
     ylab="Probabilidad de Supervivencia", las=1)

legend("bottomleft", c("Frío", "Control"), lty=2, bty="n", col=c("chocolate4", "red"), cex = 1)

#2

tapply(dat$germinacion, dat$tratamiento, sum)

#3

dd<-datadist(dat)
options(datadist = "dd")

m1<-psm(germination ~ tratamiento, data=dat, y=TRUE,
        dist="weibull")
str(m1)
summary(m1)
anova(m1)

survplot(m1, tratamiento=NA, fun=function(y) (1-y),
         ylab="Probabilidad de germinación", xlab="Días")


