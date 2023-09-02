# Tarea 1 Modelacion Ecologica
# Mauricio Nicolás Arismendi Aedo
install.packages("magrittr", dependencies = TRUE)
install.packages("dplyr", dependencies = TRUE)
install.packages("devtools", dependencies = TRUE)
install.packages("SamplingUtil", dependencies = TRUE)


pob1 <- rnorm(n = 1200, mean = 8, sd = 2.1)

muestra1<-sample(pob1, size=10, replace=FALSE)
muestra2<-sample(pob1, size=30, replace=FALSE)
muestra3<-sample(pob1, size=100, replace=FALSE)
muestra4<-sample(pob1, size=500, replace=FALSE)


hist(muestra1)
hist(muestra2)
hist(muestra3)
hist(muestra4)

La diferencia radica en que, a mayor tamaño muestral, los valores del histograma tienden a 
la distribución normal, (Gaussiana).  Esto lo explica el Teorema Central del Límite


pob2 <- data.frame(1:200)
pob2

library(devtools)
install_github("DFJL/SamplingUtil")
library(SamplingUtil)


muest1 <- sample(pob2, size=20, replace=FALSE)

muest2 <- sample(pob2, size=60, replace=FALSE)

muest3 <- sys.sample(N=nrow(pob2)+1, n = 40)
muest3

muest1 
muest2
muest3


