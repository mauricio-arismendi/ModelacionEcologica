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

 #lo dejé para después y me dio flojera hacerlo. Pero lo haré en algún momento.

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

# vamos a ver los tiempos que pide: 30 min, 1 hr y 2 hrs.
tiempito <- seq(0, 2, by = 0.5) #divide la hora en intervalos de 60 min
salida2 <- ode(y = individuo.inicial, time = tiempito, func=coli, parms = tasa_crecimiento)
salida2

#cargo nueva funcion con nuevas variables (el tratamiento pues)
tasa_tratamiento <- c(r=-3.6)
individuosTotales <- c(2922) 
tiempo2 <- seq(0, 3, by=0.01666) #divide la hora en intervalos de 60 min


coli_tratamiento <- function(time, y, parms){
  n <- y[1]
  r <- parms[1]
  dn.dt <- r * n
  return(list(c(dn.dt)))
}

#la llamo con la nueva variable obviamente
salida3 <- ode(y = individuosTotales, time = tiempo2, func=coli_tratamiento, parms = tasa_tratamiento)
salida3

#hago un lindo gráfico de la masacre de bacterias
plot(salida3[,1], salida3[,2], type="l", lwd=2, xlab="Tiempo (horas)",
     ylab="Tam. Poblacional", col="chocolate", xlim=c(0, 2),
     main="Crecimiento Exponencial pero negativo", las=1, ylim=c(0, 3000))

#4

#de nuevo hacemos una funcion, esta vez con K
#que será una asintota horizontal:
crecim_logistico <- function(times, y, parms) {
  n <- y[1]
  r <- parms[1]
  k <- parms[2]
  dn.dt <- r * n * (k - n)/k #esta es la ecuacion
  return(list(c(dn.dt)))
}

#le tiramos parametros:
parametros_logisticos <- c(r=0.06, k=90)
inicio <- c(10)
tiempo3 <- seq(0, 200, by=0.5)

#llamamos la funcion cn esos parametros
salidaLog <- ode(y = inicio, times = tiempo3, func = crecim_logistico, parms = parametros_logisticos)
salidaLog

#hacemos un grafico bonito de esto: 
plot(salidaLog[,1], salidaLog[,2], type="l", xlab="Tiempo (dias)",
     ylab="Tam. Poblacional", ylim=c(0,100), main="Crecimiento Logistico, K=90",
     las=1, lwd=2, col="blue", xlim=c(0,150))

abline(h=90, lty=2, lwd=1, col="red")
text(50, 95, "K = 90 = Capacidad de carga", cex=0.7)

#agregamos los cambios para N
inicial2 <- c(30)
nuevosParametros <- c(r=0.06, k=180)
tiempo4 <- seq(0.1, 200, by=0.01)


#pasamos nuevos parametros a la funcion crecim_logistico
nuevaSalida <- ode(y = inicial2, times = tiempo4, func = crecim_logistico, parms = nuevosParametros)
nuevaSalida

#hacemos un grafico super boni 
plot(nuevaSalida[,1], nuevaSalida[,2], type="l", xlab="Tiempo (dias)",
     ylab="Tam. Poblacional", ylim=c(0,200), main="Crecimiento Logistico, K=90",
     las=1, lwd=2, col="blue", xlim=c(0,150))

abline(h=180, lty=2, lwd=1, col="red")
text(50, 185, "K = 180 = Capacidad de carga", cex=0.7)
