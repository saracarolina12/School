# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 11 01
# =====
# Ejercicio 1. Regresi�n Lineal Simple. Procesamiento de datos
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
# 1.	[Ejercicio suplementario 11.57 Mendenhall] Un nuevo paquete de software de consulta se dise�� con el objetivo de lograr un acceso y un mantenimiento m�s eficientes de los conjuntos de datos a gran escala. La eficiencia se mide en t�rminos del n�mero de operaciones de entrada/salida (E/S) de disco (llamadas bloques de almacenamiento) necesarias para acceder al conjunto de datos y darle mantenimiento; cuanto menor sea el n�mero de bloques le�dos, con mayor rapidez se efectuar� la operaci�n. A fin de evaluar el desempe�o del nuevo sistema de software, se registr� el n�mero de operaciones de E/S de disco necesarias para acceder a un conjunto de datos a gran escala, para cada uno de una muestra de 15 conjuntos de datos de diversos tama�os (donde el tama�o se mide como el n�mero de registros contenidos en el conjunto de datos, en miles)
# Registros	350	200	450	50	400	150	350	300	150	500	100	400	200	50	250
# E/S disco	36	20	45	5	40	18	38	32	21	54	11	43	19	7	26
# a.	Elabore la gr�fica de dispersi�n. �Parece existir una relaci�n lineal entre las variables?
# --
procesamiento_datos = read.csv("C:\\Users\\Paul\\Google Drive\\UP\\UP_2020\\2021_2_Ing_Probabilidad_y_Estad�stica\\Unidad 7\\Procesamiento_datos.csv")
procesamiento_datos
reg1 = regresion_lineal_simple(procesamiento_datos)
# R: Aparentemente los datos tienen un comportamiento lineal
# ---
#  b.	Estime puntualmente los coeficientes del modelo de regresi�n lineal simple e interpr�telos en el contexto del problema. Grafique la recta de regresi�n sobre la dispersi�n.
reg1
# beta_gorro0 = 1.403
#     Esto significa que cuando se procesa un archivo con 0 (miles de)
#     registros, se espera que el n�mero de operaciones de ES sea de 1.403
#     Otra forma de interpretarlo ser�a:
#     El n�mero m�nimo de operaciones de ES que se requiere para procesar
#     un archivo es de 1.403.
#
# beta_gorro1 = 0.101
#     Esto significa que por cada 1 (mil) registros adicionales, se requerir�
#     de 0.101 operaciones de ES adicionales
# El modelo es, entonces:
#     y_gorro = 1.403 + 0.101*x
#     ES_operaciones = 1.403 + 0.101*Registros
#
# ---
# c.	Proporcione una estimaci�n por intervalo del 90% de confianza para beta0. Interprete el resultado
# d.	Proporcione una estimaci�n por intervalo del 90% de confianza para beta beta1. Interprete el resultado


# e.	Calcule el valor de r y r2 e interprete ambos resultados. �Corresponden con lo observado en el inciso a)?
reg1 = regresion_lineal_simple(procesamiento_datos)
reg1
# r = 0.992, lo cual indica que existe una relaci�n lineal muy alta y positva
#             entre el n�mero de (miles de) registros y el n�mero de operaciones
#             de ES
# r^2 = 0.984, lo cual indica que el 98.4% de la variabilidad que se observa en
#             el n�mero de operaciones de ES de disco est� explicada por el
#             n�mero de (miles de) registros
# Los valores de estas dos medidas nos dicen que la relaci�n entre ambas
# variables es muy cercana a una l�nea recta
# ---
#  f.	Estime puntualmente el n�mero medio de operaciones de E/S que se tendr�a si se procesa un archivo de 444 (miles de) registros
reg1 = regresionLinealSimple(procesamiento_datos, x_nueva=444)
reg1
# Para Registros = 444 mil, el n�mero de operaciones de ES es 46.253
# ---

# g.	Estime con un intervalo de confianza de 95% el n�mero medio de operaciones de E/S (en miles) que se tendr�a si se procesa un archivo de 444 (miles de) registros
procesamiento_datos = read.csv("C:\\Users\\Paul\\Google Drive\\UP\\UP_2020\\2021_2_Ing_Probabilidad_y_Estad�stica\\Unidad 7\\Procesamiento_datos.csv")
procesamiento_datos
procesamiento_modelo2 = lm(ES_disco ~ Registros, data=procesamiento_datos)
procesamiento_modelo2
# Intervalo de confianza
xp = 444
pos_y = 2
IC_procesamiento = regresion_intervalo_confianza(xp, procesamiento_datos,
                                                 pos_y,
                                                 procesamiento_modelo2, 0.95)
IC_procesamiento

# h.	Estime con un intervalo de confianza de 95% el n�mero observado de operaciones de E/S (en miles) que se tendr�a si se procesa un archivo de 444 (miles de) registros
# Intervalo de predicci�n
xp = 444
pos_y = 2
IP_procesamiento = regresion_intervalo_prediccion(xp, procesamiento_datos,
                                                 pos_y,
                                                 procesamiento_modelo2, 0.95)
IP_procesamiento

# i.	Elabore para los residuos una gr�fica de dispersi�n contra X, un histograma, una gr�fica de cuantiles normales (probabilidad normal) y una gr�fica secuencial y anal�celas para establecer si presentan violaciones claras a los supuestos del modelo de regresi�n lineal simple
# ----
reg1 = regresion_lineal_simple(procesamiento_datos)
reg1

# Gr�fica de dispersi�n
#   Los residuos no muestran tendencias claras y en general est�n por todo el
# espacio de la gr�fica. Los podemos considerar correctos
# Histograma de residuos
#   Es ligeramente sesgado a la derecha; pero en general se ve bien.
# Aparentemente los residuos son Normales
# Gr�fica de probabilidad Normal
#   Los residuos parecen estar aleatoriamente por arriba y por abajo de la recta
# adem�s de que en general est�n muy cerca de esta. Los residuos parecen ser
# Normales
# Gr�fica secuencial de residuos
#   No se aprecia claramente que haya correlaci�n positiva ni negativa entre los
# residuos, por lo cual se pueden considerar correctos

reg1 = regresionLinealSimple(procesamiento_datos)
reg1
