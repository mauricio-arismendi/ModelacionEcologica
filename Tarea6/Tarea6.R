# Tarea 6
# Mauricio Arismendi
# RRNN UFRO
# m.arismendi02@ufromail.cl



rm(list=ls())

#setwd("c:\\Users\\mauri\\OneDrive\\Documents\\GitHub\\ModelacionEcologica\\Tarea6") #windows
setwd("/home/mauricio/Documents/ModelacionEcologica/Tarea6")
list.files()

db <- read.csv("Recicla_ufro_3.csv", header = TRUE, sep = ",")
str(db)
head(db)
tail(db)

db$Recicle[db$Recicle == "1"] <- "SI RECICLA"
db$Recicle[db$Recicle == "0"] <- "NO RECICLA"
db$[db$ == "1"] <- "SI RECICLA"


str(db)
library("party")

# 1) Caracterice atributos básicos de personas encuestadas comparando quienes reciclan (i.e., separan 
#    para reciclar) y quienes no reciclan en la UFRO. 

table(db$Gender, db$Recicle)
table(db$Etnia, db$Recicle)
table(db$Spirituality, db$Recicle)
table(db$Exercise, db$Recicle)
table(db$Asociativity, db$Recicle)
table(db$Nature.Experience, db$Recicle)
table(db$Degree.studies, db$Recicle)
table(db$Faculty, db$Recicle)
table(db$Advance.years, db$Recicle)


barplot(table(db$Asociativity, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"))
barplot(table(db$Nature.Experience, db$Recicle), beside = TRUE, legend = TRUE, col = c("red", "green"))

chi_square <- chisq.test(db$Asociativity, db$Recicle)
print(chi_square)

anova_result <- aov(Age ~ Recicle, data = db)
boxplot(db$Age ~ db$Recicle, xlab = "Recicla", ylab = "Edad", col = c("red", "green"), names = c("No Recicla", "Recicla"))

table_data <- table(db$Degree.studies, db$Recicle)
barplot(table_data, beside = TRUE, legend = TRUE, col = c("red", "green"), 
        names = c("Pregrado", "Postgrado"), 
        main = "Reciclaje por Nivel de Estudios")

tapply(db)






# 2) Qué variables influencian que un estudiante recicle en la UFRO? Cuantas personas se asocian a 
#  mayor y menor probabilidad de reciclaje? (Genere un árbol con nombres de variables en castellano) 






# 3) En base al resultado, qué iniciativas impulsaría usted para fomentar el reciclaje en la Universidad? 
