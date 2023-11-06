# Tarea 6
# Mauricio Arismendi
# RRNN UFRO
# m.arismendi02@ufromail.cl



rm(list=ls())

setwd("c:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea6") #windows
list.files()

db <- read.csv("Recicla_ufro_3.csv", header = TRUE, sep = ",")
str(db)
head(db)
tail(db)

db$Recicle[db$Recicle == "1"] <- "SI RECICLA"
db$Recicla[db$Recicle == "0"] <- "NO RECICLA"


# 1) Caracterice atributos básicos de personas encuestadas comparando quienes reciclan (i.e., separan 
#    para reciclar) y quienes no reciclan en la UFRO. 






# 2) Qué variables influencian que un estudiante recicle en la UFRO? Cuantas personas se asocian a 
#  mayor y menor probabilidad de reciclaje? (Genere un árbol con nombres de variables en castellano) 






# 3) En base al resultado, qué iniciativas impulsaría usted para fomentar el reciclaje en la Universidad? 
