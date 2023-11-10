# Tarea 6
# Mauricio Arismendi
# RRNN UFRO
# m.arismendi02@ufromail.cl



rm(list=ls())

#setwd("c:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea6") #windows
setwd("/home/mauricio/Documents/ModelacionEcologica/Tarea6")
list.files()
class(db$Recicle)
db <- read.csv("Recicla_ufro_3.csv", header = TRUE, sep = ",")
str(db)
head(db)
tail(db)

db$Recicle[db$Recicle == "1"] <- "SI RECICLA"
db$Recicle[db$Recicle == "0"] <- "NO RECICLA"

db$Etnia[db$Etnia == "1"] <- "SI PERTENECE"
db$Etnia[db$Etnia == "0"] <- "NO PERTENECE"

db$Spirituality[db$Spirituality == "1"] <- "SI PRACTICA"
db$Spirituality[db$Spirituality == "0"] <- "NO PRACTICA"

db$Exercise[db$Exercise == "1"] <- "2-3 VECES X SEMANA"
db$Exercise[db$Exercise == "0"] <- "NO REALIZA"

db$Asociativity[db$Asociativity == "1"] <- "SI PARTICIPA"
db$Asociativity[db$Asociativity == "0"] <- "NO PARTICIPA"

db$Nature.Experience[db$Nature.Experience == "1"] <- "SI"
db$Nature.Experience[db$Nature.Experience == "0"] <- "NO POSEE APEGO"

db$Degree.studies[db$Degree.studies == "0"] <- "PREGRADO"
db$Degree.studies[db$Degree.studies == "1"] <- "POSTGRADO"

X <- db[, c('Age', 'Gender', 'Etnia', 'Spirituality', 'Exercise', 'Asociativity', 'Nature.Experience', 'Degree.studies')]
y <- db$Recicle
model <- ctree(Recicle ~ ., data = db)

X$Gender <- as.factor(X$Gender)
X$Degree.studies <- as.factor(X$Degree.studies)


summary(db$Spirituality)
str(db)
library("party")

# 1) Caracterice atributos básicos de personas encuestadas comparando quienes reciclan (i.e., separan 
#    para reciclar) y quienes no reciclan en la UFRO. 

barplot(table(db$Gender, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green", "black"), main = "Reciclantes por Género", ) 
barplot(table(db$Etnia, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Reciclantes por Etnia")
barplot(table(db$Spirituality, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Reciclantes por Espiritualidad")
barplot(table(db$Exercise, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Reciclantes por Cantidad de Ejercicio")
barplot(table(db$Asociativity, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Reciclantes por Pertenencia a una Agrupación")
barplot(table(db$Nature.Experience, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Reciclantes por Cercanía a la Naturaleza")
barplot(table(db$Degree.studies, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"), main = "Reciclantes si tienen Posgrado")
barplot(table(db$Faculty, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green", "black", "blue", "yellow", "brown", "orange"), main = "Reciclantes por Facultad")
barplot(table(db$Advance.years, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green", "black", "blue", "yellow", "brown", "orange", "pink", "white"), main = "Reciclantes por año que cursa")



# 2) Qué variables influencian que un estudiante recicle en la UFRO? Cuantas personas se asocian a 
#  mayor y menor probabilidad de reciclaje? (Genere un árbol con nombres de variables en castellano) 

dbEspanol <- db  # Asegurémonos de no modificar el dataframe original
names(dbEspanol) <- c("Edad", "Genero", "Etnia", "Espiritualidad", "Ejercicio", 
                         "Asociatividad", "Experiencia_Rural", "Nivel_Estudios", 
                              "Facultad", "Anios_Avance", "Recicla")

dbEspanol$Genero <- as.factor(dbEspanol$Genero)
dbEspanol$Etnia <- as.factor(dbEspanol$Etnia)
dbEspanol$Espiritualidad <- as.factor(dbEspanol$Espiritualidad)
dbEspanol$Ejercicio <- as.factor(dbEspanol$Ejercicio)
dbEspanol$Asociatividad <- as.factor(dbEspanol$Asociatividad)
dbEspanol$Experiencia_Rural <- as.factor(dbEspanol$Experiencia_Rural)
dbEspanol$Nivel_Estudios <- as.factor(dbEspanol$Nivel_Estudios)
dbEspanol$Recicla <- as.factor(dbEspanol$Recicla)
dbEspanol$Facultad <- as.factor(dbEspanol$Facultad)
dbEspanol$Anios_Avance <- as.integer(dbEspanol$Anios_Avance)

str(dbEspanol)

datosArbol <- dbEspanol[c("Edad", "Genero", "Etnia", "Espiritualidad", "Ejercicio", "Asociatividad", "Experiencia_Rural", "Nivel_Estudios", "Recicla", "Facultad", "Anios_Avance")]
arbol1 <- ctree(Recicla~., data=dbEspanol)
plot(arbol1, drop=F, main= "Arbol de Clasificación")
