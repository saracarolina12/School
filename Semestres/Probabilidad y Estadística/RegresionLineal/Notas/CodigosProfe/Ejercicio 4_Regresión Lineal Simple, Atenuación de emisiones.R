# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 11 08
# =====
# Lectura del archivo de utiler�as
source("C:\\Users\\Paul\\Google Drive\\UP\\UP_2020\\2021_2_Ing_Probabilidad_y_Estad�stica\\Unidad 7\\Regresion_util.r")
# =====
# Programa principal
# ---
# 4.	La Comisi�n Federal de Comunicaciones (FCC, por sus siglas en ingl�s) de Estados Unidos especifica que las emisiones electromagn�ticas radiadas por dispositivos digitales se deben medir en un sitio de prueba de campo abierto. A fin de verificar la aceptabilidad de un sitio de prueba es preciso evaluar la atenuaci�n del sitio (es decir, la p�rdida de transmisi�n desde un dipolo de media onda hasta la salida de otro cuando ambos dipolos se colocan sobre el plano de tierra). Un estudio realizado en un sitio de prueba en Fort Collins, Colorado, produjo los siguientes datos de atenuaci�n del sitio (en decibeles) y frecuencia de transmisi�n (en megahertz)  para dipolos a una distancia de 3 metros.
# Frecuencia de transmisi�n, x, MHz	50	100	200	300	400	500
# Atenuaci�n del sitio, y, dBL	11.5	15.8	18.2	22.6	26.2	27.1
# --
# Frecuencia de transmisi�n, x, MHz	600	700	800	900	1000	
# Atenuaci�n del sitio, y, dBL	29.5	30.7	31.3	32.6	34.9	
# --
# Definici�n de los datos
Frecuencia = c(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
Atenuacion = c(11.5, 15.8, 18.2, 22.6, 26.2, 27.1, 29.5, 30.7, 31.3, 32.6, 34.9)
emisiones_datos = data.frame(cbind(Frecuencia, Atenuacion))
emisiones_datos
# ---
# a.	Elabore un diagrama de dispersi�n para los datos. �Es evidente una relaci�n lineal entre x y y?
modelo1 = regresion_lineal_simple(emisiones_datos)
modelo1
# R: No parece muy lineal la relaci�n entre las variables, porque se aprecia una curvatura en la disposici�n de los puntos. Comienzan por debajo de la recta, luego suben y despu�s bajan y la vuelven a cruzar

# ---
#  b.	Encuentre la l�nea de m�nimos cuadrados que relaciona la atenuaci�n del sitio y con la frecuencia de transmisi�n x.
modelo1
# El modelo de regresi�n lineal simple que relaciona las variables es:
# y_gorro = beta_gorro0 + beta_gorro1*x
# Atenuacion_gorro = 14.1749 + 0.0224*Frecuencia

# ---
# c.	Trace la l�nea de m�nimos cuadrados sobre el diagrama de dispersi�n para verificar sus c�lculos.
# La recta se traza al ejecutar nuestra funci�n de regresi�n lineal

# ---
# d.	Interprete los valores de beta_gorro0 y beta_gorro1
# beta_gorro0 = 14.1749
#     Esto significa que para una frecuencia de 0 MHz, la atenuaci�n ser�a 
#     de 14.1749. Aunque dado que no habr�a atenuaci�n si no hay emisi�n de
#     se�al, parece que en realidad beta0 = 0
#
# beta_gorro1 = 0.0224
#     Esto se interpreta como que por cada MHz adicional en la se�al radiada
#     la atenuaci�n aumenta 0.0224 dB

# ---
# e.	Elabore y analice las gr�ficas de residuos estandarizados para ver si identifica violaciones a los supuestos del modelo
# Gr�fica de dispersi�n vs x
#   Los residuos parecen tener una relaci�n cuadr�tica con respecto a x dado
#   que comienzan siendo negativos, ascienden y se vuelven positivos y despu�s
#   bajan y se hacen negativos de nuevo. Eso no parece un comportamiento
#   aleatorio
# Histograma de residuos
#   No parece muy cercano a una distribuci�n Normal, parece haber valores
#   extremos a ambos lados de la media y un hueco en la parte central
# Gr�fico de probabilidad Normal
#   No se observan violaciones claras al supuesto de Normalidad, al menos no
#   tan claras como en el histograma, aunque s� se aprecia que el primero y
#   el �ltimo dato est�n alejados del resto, por tanto se les puede considerar
#   como valores extremos
# Gr�fica secuencial de residuos
#   Dado que los datos fueron tomados en orden ascendente en X (Frecuencia)
#   esta gr�fica muestra el mismo comportamiento que ya hab�amos visto en la
#   gr�fica de dispersi�n: los residuos suben y luego bajan con respecto a su
#   valor promedio




















