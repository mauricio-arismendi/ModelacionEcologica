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

# UB species richness
test.ub<-rich(matrix=spec.ub, nrandom=999,verbose=TRUE)
test.ub$cr # observed cumulative species richness
test.ub$mr # observed mean value of species richness over the n samples

# LS species richness
test.ls<-rich(matrix=spec.ls, nrandom=999,verbose=TRUE)
test.ls$cr # observed cumulative species richness
test.ls$mr # observed mean value of species richness over the n samples


# MS species richness
test.ms<-rich(matrix=spec.ms, nrandom=999,verbose=TRUE)
test.ms$cr # observed cumulative species richness
test.ms$mr # observed mean value of species richness over the n samples


# HS species richness
test.hs<-rich(matrix=spec.hs, nrandom=999,verbose=TRUE)
test.hs$cr # observed cumulative species richness
test.hs$mr # observed mean value of species richness over the n samples


#2

#Medias de diversidad (Shannon)
mean(diversity(spec.ub))
mean(diversity(spec.ls))
mean(diversity(spec.ms))
mean(diversity(spec.hs))

