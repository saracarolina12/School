# source("C:/Users/scago/Documents/GitHub/IA_School/Semestres/Probabilidad y Estad�stica/RegresionLineal/Multiple/Ejercicios/Dos/Regresion_util.R")

ganancias = read.table("C:/Users/scago/Documents/GitHub/IA_School/Semestres/Probabilidad y Estad�stica/RegresionLineal/3Examen/Ej1/Datos.csv", header = TRUE)
#ganancias


#primer modelo con todas las variables
ganancia_modelo = lm(Tiempo ~ �..Numero, data = ganancias)
ganancia_modelo
 summary(ganancia_modelo) 




