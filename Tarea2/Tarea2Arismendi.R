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
test.spec$cr # observed cumulative species richness
test.spec$mr # observed mean value of species richness over the n samples
test.spec$uniques # species encountered in only one sample
