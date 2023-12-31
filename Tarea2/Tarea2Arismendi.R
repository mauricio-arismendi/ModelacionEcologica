#--------------------------------------------
# Tarea 2 Modelación Ecológica
## Mauricio Arismendi Aedo
### m.arismendi02@ufromail.cl
#### Prof. Dr. Andrés Fuentes
#--------------------------------------------

rm(list=ls())

data <- read.csv(
  file = "C:\\Users\\mauri\\OneDrive\\Desktop\\richness_rncm2016.csv",
  header = TRUE,
  sep = ",",
  dec = ".",
  fill = TRUE)

getwd()
setwd("C:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea2")
list.files()
options(max.print=999999)

#1

str(data)
head(data)
tail(data)
dim(data)
summary(data)

library(vegan)
library(rich)

spec<-data [, 2:50] #seleccionamos desde columna 2 

spec
spec.ub<-spec [1:20, ]
str(spec.ub); dim(spec.ub)
spec.ub

spec.ls<-spec [21:40, ]
str(spec.ls); dim(spec.ls)
spec.ls

spec.ms<-spec [41:60, ]
str(spec.ms); dim(spec.ms)
spec.ms

spec.hs<-spec [61:80, ]
str(spec.hs); dim(spec.hs)
spec.hs

all.sp<-list(spec.ub, spec.ls, spec.ms, spec.hs) 
class(all.sp)
str(all.sp)

#Ta bom
mean(specnumber(spec))
?rich()

test.spec<-rich(matrix=spec , nrandom=999,verbose=TRUE)
test.spec$cr 
test.spec$mr 
test.spec$uniques 


test.ub<-rich(matrix=spec.ub, nrandom=999,verbose=TRUE)
test.ub$cr 
test.ub$mr 

test.ls<-rich(matrix=spec.ls, nrandom=999,verbose=TRUE)
test.ls$cr 
test.ls$mr 


test.ms<-rich(matrix=spec.ms, nrandom=999,verbose=TRUE)
test.ms$cr 
test.ms$mr 


test.hs<-rich(matrix=spec.hs, nrandom=999,verbose=TRUE)
test.hs$cr
test.hs$mr 


#2

#Medias de diversidad (Shannon)
mean(diversity(spec.ub))
mean(diversity(spec.ls))
mean(diversity(spec.ms))
mean(diversity(spec.hs))

#3
library(rich)
library(vegan)

#creamos indices
ub.div<-diversity(spec.ub)
ls.div<- diversity(spec.ls)
ms.div<-diversity(spec.ms)
hs.div<-diversity(spec.hs)




t.test(ub.div, ls.div, paired=TRUE)
t.test(ub.div, ms.div, paired=TRUE)
t.test(ub.div, hs.div, paired=TRUE)

t.test(ls.div, ms.div, paired=TRUE)
t.test(ls.div, hs.div, paired=TRUE)

t.test(ms.div, hs.div, paired=TRUE)


#4

c2cv(com1=all.sp[[1]], com2=all.sp[[2]], nrandom=999, verbose=FALSE) 
c2cv(com1=all.sp[[1]], com2=all.sp[[3]], nrandom=999, verbose=FALSE) 
c2cv(com1=all.sp[[1]], com2=all.sp[[4]], nrandom=999, verbose=FALSE) 

c2cv(com1=all.sp[[2]], com2=all.sp[[3]], nrandom=999, verbose=FALSE) 
c2cv(com1=all.sp[[2]], com2=all.sp[[4]], nrandom=999, verbose=FALSE) 

c2cv(com1=all.sp[[3]], com2=all.sp[[4]], nrandom=999, verbose=FALSE)

#5

spacum.hs <- specaccum(spec.hs, "rarefaction", permutations = 999,
                       conditioned=TRUE, gamma="jack1")


spacum.ms <- specaccum(spec.ms, "rarefaction", permutations = 999,
                       conditioned=TRUE, gamma="jack1")

spacum.ls <- specaccum(spec.ls, "rarefaction", permutations = 999,
                       conditioned=TRUE, gamma="jack1")

spacum.ub <- specaccum(spec.ub, "rarefaction", permutations = 999,
                       conditioned=TRUE, gamma="jack1")


#grafico
plot(spacum.hs, col= "chocolate1", lwd=1.5, ci.lty=0, ci.col="chocolate1", ylim=c(0,35), xlim=c(0,20),
     las=1, cex.lab=1, font.lab=1, ylab="Riq. Especies Acum.",
     xlab="Esfuerzo de Muestreo", main="Curvas de Acumulacion de Especies")

lines(spacum.ms, col="chocolate2", lwd=1.5, ci.lty=0, ci.col="chocolate2")
lines(spacum.ls, col="chocolate3", lwd=1.5, ci.lty=0, ci.col="chocolate3")
lines(spacum.ub, col="chocolate4", lwd=1.5, ci.lty=0, ci.col="chocolate4")

legend(10,7, c("No quemado", "Baja sev." ,"Media sev.", "Alta sev."), col=c("chocolate4", "chocolate3",
                                                                             "chocolate2", "chocolate1"), lty=1, lwd=1.4,  cex=0.8, bty="n")

legend("topleft", c("No quemado", "Baja sev." ,"Media sev.", "Alta sev."), col=c("chocolate4", "chocolate3",
                                                                                 "chocolate2", "chocolate1"), lty=1, lwd=1.4,  cex=0.8, bty="n")


