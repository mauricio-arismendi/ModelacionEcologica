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
install.packages("scatterplot3d", dependencies = TRUE)
library(scatterplot3d)
library(vegan)
library(permute)

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
#Profundidad horizonte A suelos respecto a especies y tipo de uso de suelos
#dune.env$A1
#plot(table(dune.env$A1, dune.env$Use), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Tamaño horizonte A por uso") 
?dune.env
?dune

plot(dune.env$Use, dune.env$A1, main = "Profundidad Horizonte A, respecto a Uso de Suelo", xlab = "Uso de Suelo", ylab = "Profundidad de Horizonte A")
plot(dune.env$Management, dune.env$A1, main = "Profundidad Horizonte A, respecto a manejo", xlab = "Tipo de Manejo", ylab = "Profundidad Horizonte A")
plot(dune.env$Manure, dune.env$A1, main = "Profundidad Horizonte A, respecto a Cantidad de uso de Estiercol", xlab = "Cantidad de Estiercol", ylab = "Profundidad Horizonte A")



rikeza <- replace(dune[,0:30], dune[,0:30] >0, 1 )
rikeza$Riq <- rowSums(rikeza)
str(rikeza)
head(rikeza)

dune.env$riq <- rikeza$Riq
?dune.env
?sample_n

#Riqueza por Manejo y Uso de suelo:

plot(dune.env$Use, dune.env$riq, main = "Riqueza respecto a Uso de suelo", xlab = "Uso de suelo", ylab = "Riqueza de especies")
plot(dune.env$Management, dune.env$riq, main = "Riqueza respecto a Manejo", xlab = "Tipo de Manejo", ylab = "Riqueza de especies")
plot(dune.env$Manure, dune.env$riq, main = "Riqueza respecto a Cantidad de uso de Estiercol", xlab = "Cantidad de uso de Estiercol", ylab = "Riqueza de especies")

dune$Use <- dune.env$Use

duneHF <- subset(dune.env, Use == "Hayfield" )
duneHP <- subset(dune.env, Use == "Haypastu")
duneP <- subset(dune.env, Use == "Pasture")



duneSP.HF <- subset(dune, Use == "Hayfield")
duneSP.HP <- subset(dune, Use == "Haypastu")
duneSP.P <- subset(dune, Use == "Pasture")

HFnewSP <- sample_n(duneSP.HF, size = 5)
HPnewSP <- sample_n(duneSP.HP, size = 5)
PnewSP <- sample_n(duneSP.P, size = 5)


HFnew.env <- sample_n(dune.envHF, size = 5)
HPnew.env <- sample_n(dune.envHP, size = 5)
Pnew.env <- sample_n(dune.envP, size = 5)

unionSP <- rbind(HFnewSP, HPnewSP, PnewSP)
unionSP


str(duneHF)
str(duneHP)
str(duneP)

summary(duneHF)
summary(duneHP)
summary(duneP)

install.packages("dplyr")
library(dplyr)
?sample_n


HFnew <- sample_n(duneHF, size = 5)
HPnew <- sample_n(duneHP, size = 5)
Pnew <- sample_n(duneP, size = 5)

union <- rbind(HFnew, HPnew, Pnew)
head(union)
tail(union)

#NMDS

library(vegan)

colnames(unionSP)

meta5 <- metaMDS(unionSP[,1:30], distance = "bray", k = 5, trymax = 1000,
                 wascores = T, autotransform = F, noshare = 1)
meta4 <- metaMDS(unionSP[,1:30], distance = "bray", k = 4, trymax = 1000,
                 wascores = T, autotrasform = F, noshare = 1) 
meta3 <- metaMDS(unionSP[,1:30], distance = "bray", k = 3, trymax = 1000, wascores = F,
                 autotrasform = F, noshare = 1)
meta2 <- metaMDS(unionSP[,1:30], distance = "bray", k = 2, trymax = 1000, wascores = F, autotrasform = F, noshare = 1)
meta1 <- metaMDS(unionSP[,1:30], distance = "bray", k = 1, trymax = 1000, wascores = F, autotrasform = F, noshare = 1)

par(mfrow=c(1,3))
stressplot(meta5)
stressplot(meta4)
stressplot(meta3)
par(mfrow=c(1,2))
stressplot(meta2)
stressplot(meta1)
par(mfrow=c(1,1))


plot(c(5:1),c( meta5$stress, meta4$stress, meta3$stress, 
               meta2$stress, meta1$stress), pch=20, col="red", ylab="Stress (%)",
     xlab="Nr dimensiones")
lines(c(5:1), c(meta5$stress, meta4$stress, meta3$stress, meta2$stress, meta1$stress),
      add=T, lty=1, col="blue")

metaf <- metaMDS(unionSP[,1:30], distance = "bray", k = 2, 
                 trymax = 1000, wascores = T,
                 autotrasform = F,  noshare = 1)


plot(metaf)
plot(metaf,main="Composición florística dunas")
text(metaf, display = "sites", col="blue", cex=0.5)# "sites"/ # En azul los sitios o parcelas
text(metaf, display = "species", col="red", cex=0.5)# "sites"/En azul las spp



ordihull(metaf, unionSP$Use, show="Pasture",col = "black", lty=4, lwd=2) 
ordihull(metaf, unionSP$Use, show="Haypastu",col = "chocolate", lty=4, lwd=2) 
ordihull(metaf, unionSP$Use, show="Hayfield",col = "green", lty=4, lwd=2) 



fit <- envfit(metaf, union[,c( "A1", "riq")], permutations = 99, display = "sites")

?fit

?metaMDS
plot(metaf, display=c("species", "sites"))
plot(fit)
