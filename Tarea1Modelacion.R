# Tarea 1: Modelacion Ecologica
# Asignatura: Modelación Ecológica. Código: ACF394.
# Profesor: Dr. Andrés Fuentes.
# Estudiante: Mauricio Nicolás Arismendi Aedo.
# Correo: m.arismendi02@ufromail.cl
# Carrera: Ingeniería en Recursos Naturales

#Instalamos librerias
install.packages("magrittr", dependencies = TRUE)
install.packages("dplyr", dependencies = TRUE)
install.packages("devtools", dependencies = TRUE)
install.packages("SamplingUtil", dependencies = TRUE)
install.packages("ggplot2", dependencies = TRUE)
#1
#creamos pob1 con lo pedido
pob1 <- rnorm(n = 1200, mean = 8, sd = 2.1)

#extraemos 4 muestras
muestra1<-sample(pob1, size=10, replace=FALSE)
muestra2<-sample(pob1, size=30, replace=FALSE)
muestra3<-sample(pob1, size=100, replace=FALSE)
muestra4<-sample(pob1, size=500, replace=FALSE)

#hacemos histogramas con esas muestras
hist(muestra1)
hist(muestra2)
hist(muestra3)
hist(muestra4)

# diferencia radica en que, a mayor tamaño muestral, los valores del histograma tienden a 
# la distribución normal, (Gaussiana).  Esto lo explica el Teorema Central del Límite

#2

#hacemos el dataframe de numeros consecutivos
pob2 <- data.frame(1:200)
pob2

#extraemos muestras pedidas

muest1 <- sample(pob2, size=20, replace=FALSE)
muest2 <- sample(pob2, size=60, replace=TRUE)

#cargamos librerias e instalamos los recursos para
# hacer muestreo sistematico

library(devtools)
install_github("DFJL/SamplingUtil")
library(SamplingUtil)

#hacemos muestreo sistematico
muest3 <- sys.sample(N=nrow(pob2)+1, n = 40)

#también se puede hacer muestreo sistemático utilizando
# un bucle for, asi:



#cargamos estos datos en histogramas
hist(muest1)
hist(muest2)
hist(muest3)

#3

#cargamos libreria
library(deSolve)



#creamos parametros y los guardamos en variables

tasa_crecimiento <- c(r=3.99) #tasa de crecimiento
individuo.inicial <- c(1) # 1 individuo inicial
tiempo1 <- seq(0, 2, by=0.01666) #divide la hora en intervalos de 60 min

#hacemos la función
coli <- function(time, y, parms){
  n <- y[1]
  r <- parms[1]
  dn.dt <- r * n
  return(list(c(dn.dt)))
}

#llamamos la función y le pasamos los parametros
salida <- ode(y = individuo.inicial, time = tiempo1, func=coli, parms = tasa_crecimiento)
salida

library(ggplot2)
#hacemos un gráfico bien bonito:
plot(salida[,1], salida[,2], type="l", lwd=2, xlab="Tiempo (horas)",
     ylab="Tam. Poblacional", col="chocolate4", xlim=c(0, 2),
     main="Crecimiento Exponencial (positivo)", las=1, ylim=c(0, 3000))
