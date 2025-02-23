# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 11 11
# =====
# Ejercicio 2. Regresi�n Lineal M�ltiple. Ganancias de la industria Qu�mica
# -----
# Lectura de archivo de funciones
# -----
source("C:\\Users\\Paul\\Google Drive\\UP\\UP_2020\\2021_2_Ing_Probabilidad_y_Estad�stica\\Unidad 7\\Regresion_util.r")
# -----
# Funciones
# -----

# =====
# Programa principal
# -----
# Ejercicio 2
# 2.	[Lind et al (2004). Estad�stica para administraci�n y econom�a. Ejercicio 14.19, p. 535] El se�or Steve Douglas fue contratado como gerente en capacitaci�n por una importante empresa financiera. Como primer proyecto, se le pidi� que estudiara la utilidad bruta en la industria qu�mica. �Qu� factores afectan las utilidades en esa industria? Steve seleccion� una muestra aleatoria de 16 compa��as y obtuvo datos respecto a la cantidad de empleados (EMPLEADOS), el n�mero de dividendos consecutivos pagados en acciones comunes (DIVIDENDOS), el valor total del inventario al inicio del presente a�o (INVENTARIO) y la ganancia bruta (GANANCIA) de cada empresa.
# ---
# Lectura de datos
ganancias_datos = read.table("C:\\Users\\Paul\\Google Drive\\UP\\UP_2020\\2021_2_Ing_Probabilidad_y_Estad�stica\\Unidad 7\\Industria Quimica_datos.txt", header=TRUE)
ganancias_datos

# a.	Ajuste un modelo de regresi�n lineal m�ltiple a los datos y estime los coeficientes de regresi�n utilizando todas las variables
ganancia_modelo = lm(Ganancia ~ Empleados + Dividendos + Inventario,
                     data=ganancias_datos)
ganancia_modelo
# Los coeficientes estimados son:
#Coefficients:
#  (Intercept)    Empleados   Dividendos   Inventario  
#965.2809       2.8653       6.7538       0.2873  
# Por tanto el modelo obtenido es:
# Ganancia = 965.2809 + 2.8653*Empleados + 6.7538*Dividendos + 0.2873*Inventarios
#

# b.	Realice el contraste de hip�tesis del An�lisis de Varianza y diga si al menos una de las variables utilizadas es adecuada para pronosticar el valor de la Ganancia
summary(ganancia_modelo)

# c.	Identifique las variables que son �tiles para pronosticar Y para ajustar un modelo corregido. Proporcione este nuevo modelo.
# Observamos que las variables Empleados e Inventario son de utilidad para el
# modelo, no as� Dividendos. Por tanto, se reajusta el modelo omitiendo
# Dividendos
ganancia_modelo2 = lm(Ganancia ~ Empleados + Inventario,
                     data=ganancias_datos)
ganancia_modelo2
summary(ganancia_modelo2)
# Se observa que el modelo ha mejorado, porque todos los coeficientes son
# significativamente distintos de cero y el valor de R^2 pr�cticamente no baj�
# ---
# Call:
# lm(formula = Ganancia ~ Empleados + Inventario, data = ganancias_datos)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1659.93  -660.42   -33.18   578.42  1837.34 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)  
# (Intercept) 1134.7613   418.5743   2.711   0.0178 *
#   Empleados      3.2575     1.4336   2.272   0.0407 *
#   Inventario     0.3099     0.1033   3.001   0.0102 *
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 986.7 on 13 degrees of freedom
# Multiple R-squared:  0.7808,	Adjusted R-squared:  0.747 
# F-statistic: 23.15 on 2 and 13 DF,  p-value: 5.198e-05









