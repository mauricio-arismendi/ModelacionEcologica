## Tarea 5 ##

# Las bases de datos: rc_gaps y rc_gaps.env (dentro de paquete Lexiguel) 
# contienen información de especies de flora vascular [1=presencia; 0=ausencia] , 
# tamaño (m2) y  tipo de claro según su condición de invasión en un muestreo 
# realizado para 48 áreas  de apertura de dosel producidas por caída de árboles, 
# en el bosque de la isla Robinson Crusoe.

# 1) Considerando ambas bases de dato, genere una tabla de estadística 
# descriptiva de los claros según su condición de invasión Incluya estadígrafos 
# para riqueza de especies y los tamaños considerando medidas de tendencia central
# y dispersión para cada categoría de claro. Estas categorías se encuentran 
# en la columna "gaptype" de la base de datos:  
#  rc_gaps.env, donde: 1= no invadido; 2= tratado [restauración]; 
#  3= invadido por especies exóticas.

# 2)  Genere curvas "SLOSS" y grafíquelas de manera separada para claros 
#  (a) no invadidos, (b) invadidos y (c) tratados

# 3) Comente los gráficos considerando el índice SLOSS.

# 4) Genere recomendaciones para la conservación de la flora isleña 
#  en base a sus resultados. Considere las fortalezas y limitaciones del análisis 
#  generado.

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

#Descriptive statistics
summary(rc_gaps)
summary(rc_gaps.env)

tapply(rc_gaps.env$area, rc_gaps.env$gaptype, summary)
tapply(rc_gaps.env$area, rc_gaps.env$gaptype, sd)
tapply(rc_gaps.env$area, rc_gaps.env$gaptype, var)

tapply(rc_gaps.env$riq, rc_gaps.env$gaptype, summary)
tapply(rc_gaps.env$riq, rc_gaps.env$gaptype, sd)
tapply(rc_gaps.env$riq, rc_gaps.env$gaptype, var)

noInvadido <- subset(rc_gaps.env, gaptype == "No invadido")
Invadido <- subset(rc_gaps.env, gaptype == "invadido")
Tratado <- subset(rc_gaps.env, gaptype == "tratado")



