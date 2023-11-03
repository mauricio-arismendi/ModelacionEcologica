## Tarea 5 ##

# Mauricio Arismendi Aedo
# m.arismendi02@ufromail.cl
# Ingeniería en Recursos Naturales
# Saludos al(a) ayudante que va a revisar esto
# Profesor: Rodrigo Vargas.
# UFRO. 


rm(list=ls())

install.packages("devtools", dependencies = TRUE)
library(devtools)
install_github("kamapu/Lexiguel")
library(Lexiguel)
data(rc_gaps)
data(rc_gaps.env)

rc_gaps
rc_gaps.env

summary(rc_gaps)
rc_gaps <- as.data.frame(rc_gaps)
str(rc_gaps)
str(rc_gaps.env)

rc_gaps.env
rc_gaps.env <- as.data.frame(rc_gaps.env)
summary(rc_gaps.env)
summary(rc_gaps)

rc_gaps.env$gaptype <- as.factor(rc_gaps.env$gaptype)
rc_gaps.env$rank.area <- as.factor(rc_gaps.env$rank.area)

#ordenamos con nombre los gaptypes
levels(rc_gaps.env$gaptype) <- c("No invadido", "tratado", "invadido")

#rikeza
rc_gaps$riq <- rowSums(rc_gaps)
rc_gaps$riq

#sumamos gaptype a rc_gaps
rc_gaps$gaptype <- rc_gaps.env$gaptype

head(rc_gaps)
str(rc_gaps)

#Descriptive statistics
summary(rc_gaps)
summary(rc_gaps.env)

#1

tapply(rc_gaps.env$area, rc_gaps.env$gaptype, summary)
tapply(rc_gaps.env$area, rc_gaps.env$gaptype, sd)
tapply(rc_gaps.env$area, rc_gaps.env$gaptype, var)

tapply(rc_gaps$riq, rc_gaps.env$gaptype, summary)
tapply(rc_gaps$riq, rc_gaps.env$gaptype, sd)
tapply(rc_gaps$riq, rc_gaps.env$gaptype, var)

#Calculamos índices de Pielou y Shannon-Wiener

library(vegan)
Htotal <- diversity(rc_gaps$riq)
Jtotal <- Htotal/log(specnumber(rc_gaps$riq))

Htotal
Jtotal
noInvSP

Hnoinvadido <- diversity(noInvSP$riq)
Hnoinvadido

Htratado <- diversity(TratSP$riq)
Htratado

HInvadido <- diversity(InvSP$riq)
HInvadido

Jnoinvadido <- Hnoinvadido/log(specnumber(noInvSP$riq))
Jnoinvadido

Jtratado <- Htratado/log(specnumber(TratSP$riq))
Jtratado

JInvadido <- HInvadido/log(specnumber(InvSP$riq))
JInvadido




#2

#subsets en .env, que sería en cada tipo

noInvadidoArea <- subset(rc_gaps.env, gaptype == "No invadido")
InvadidoArea <- subset(rc_gaps.env, gaptype == "invadido")
TratadoArea <- subset(rc_gaps.env, gaptype == "tratado")

#aquí sería el tipo, pero respecto a las especies halladas
noInvSP <- subset(rc_gaps, gaptype == "No invadido")
InvSP <- subset(rc_gaps, gaptype == "invadido")
TratSP <- subset(rc_gaps, gaptype == "tratado")


#y si vemos indices de biodiversidad en cada tipo de claro?


#hacemos nuevos subsets sin columnas que no necesitamos

colnames(noInvSP)
noInvSPnoRiq <- noInvSP[, -c(48,49)]
invSPnoRiq <- InvSP[, -c(48,49)]
TratSPnoRiq <- TratSP[, -c(48,49)] 

str(noInvSPnoRiq)
str(invSPnoRiq)
str(TratSPnoRiq)

#generamos curvas SLOSS
curvaNoInvadido <- sloss(noInvSPnoRiq, noInvadidoArea, area)
curvaInvadido <- sloss(invSPnoRiq, InvadidoArea, area)
curvaTratado <- sloss(TratSPnoRiq, TratadoArea, area)

#arrejuntamos uno al lado del otro (graficos)
par(mfrow = c(1,3))

#ploteamos
plot(curvaNoInvadido, main = "Claros No Invadidos", xlab = "Area Acumulada (m^2)", 
  ylab = "Especies Acumuladas (Nº)")

plot(curvaInvadido, main = "Claros Invadidos", xlab = "Area Acumulada (m^2)", 
     ylab = "Especies Acumuladas (Nº)")
plot(curvaTratado, main = "Claros Tratados", xlab = "Area Acumulada (m^2)", 
     ylab = "Especies Acumuladas (Nº)")

legend(650, 10, c("Grande a Pequeño", "Pequeño a Grande"), lty=c(1,2), bty="n", cex=0.6)

