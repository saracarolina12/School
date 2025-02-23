# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 11 17
# =====
# -----
# Funciones
# -----

# =====
# Programa principal
# -----
# Ejercicio 1
# 1.	Se investig� el efecto del peso del veh�culo (en toneladas) y la temperatura ambiente promedio (en �F) sobre el rendimiento del combustible, en una muestra aleatoria de 10 veh�culos. Los datos se muestran a continuaci�n:
# Peso (X1)	Temperatura (X2)	Rendimiento (Y)
# 1.35	90	17.9
# 1.9	30	16.5
# 1.7	80	16.4
# 1.8	40	16.8
# 1.3	35	18.8
# 2.05	45	15.5
# 1.6	50	17.5
# 1.8	60	16.4
# 1.85	65	15.9
# 1.4	30	18.3
# ===
# Lectura de los datos
rendimiento_datos = read.csv("C:\\Users\\Paul\\Google Drive\\UAA\\2021_2_ISC_Inferencia_Estad�stica\\Unidad 3\\Rendimiento.csv")
rendimiento_datos

# a.	Obtenga una ecuaci�n de m�nimos cuadrados para el modelo de regresi�n lineal que explique el Rendimiento de combustible del veh�culo con base en su Peso y la Temperatura ambiente promedio.
rendimiento_modelo1 = lm(Rendimiento ~ Peso + Temperatura,
                         data=rendimiento_datos)
summary(rendimiento_modelo1)

# El modelo ser�a:
# Rendimiento = 24.7489 - 4.1593*Peso - 0.0149*Temperatura
#

# b.	�Hay pruebas suficientes que indiquen que el modelo resulta �til para predecir y? Pruebe con alfa = 0.10 usando el contraste de hip�tesis del An�lisis de Varianza.


# =====
# c.	Calcule un intervalo de predicci�n de 95% para el rendimiento observado en un autom�vil con un peso de 1.35 ton si la temperatura ambiente es de 40� F. Interprete el intervalo
# El modelo es
# Rendimiento = 24.7489 - 4.1593*Peso - 0.01490*Temperatura
# ---
# Estimaci�n puntual
peso_p = 1.35
temperatura_p = 40
xp = c(peso_p, temperatura_p)
coefConf = 0.95
rendimiento_modelo1 = lm(Rendimiento ~ Peso + Temperatura,
                         data=rendimiento_datos)
yp = sum(rendimiento_modelo1$coefficients*c(1, xp))
yp
# Intervalo de confianza
IC1 = regresion_intervalo_confianza(xp, rendimiento_datos, 3,
                                     rendimiento_modelo1, coefConf)
IC1
# Intervalo de predicci�n
IP1 = regresion_intervalo_prediccion(xp, rendimiento_datos, 3,
                                     rendimiento_modelo1, coefConf)
IP1

# ======
# Matriz de dispersi�n para las variables de un modelo de regresi�n m�ltiple
pairs(rendimiento_datos, col="blue")









