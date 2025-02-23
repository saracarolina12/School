source("C:/Users/scago/Documents/GitHub/IA_School/Semestres/Probabilidad y Estad�stica/RegresionLineal/Simple/Ejercicios/Tres/Regresion_util.r")

# 4. La Comisi�n Federal de Comunicaciones (FCC, por sus siglas en ingl�s) de Estados Unidos especifica
# que las emisiones electromagn�ticas radiadas por dispositivos digitales se deben medir en un sitio
# de prueba de campo abierto. A fin de verificar la aceptabilidad de un sitio de prueba es preciso
# evaluar la atenuaci�n del sitio (es decir, la p�rdida de transmisi�n desde un dipolo de media onda hasta la salida de otro cuando ambos dipolos se colocan sobre el plano de tierra).
# Un estudio realizado en un sitio de prueba en Fort Collins, Colorado, produjo los siguientes datos de atenuaci�n del sitio (en decibeles) y frecuencia de transmisi�n (en megahertz) para dipolos a una distancia de 3 metros.

# Frecuencia de transmisi�n, x, MHz
fTransmision = c(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
# Atenuaci�n del sitio, y, dBL 
atenuacion = c(11.5, 15.8, 18.2, 22.6, 26.2, 27.1, 29.5, 30.7, 31.3, 32.6, 34.9)

# a. Elabore un diagrama de dispersi�n para los datos. �Es evidente una relaci�n lineal entre x y y?
regresion_lineal_simple(data.frame(cbind(fTransmision, atenuacion)))
# No parece muy lineal, porque los datos asemejan el comportamiento de una curva.

# b. Encuentre la l�nea de m�nimos cuadrados que relaciona la atenuaci�n del sitio y con la frecuencia de transmisi�n x.
# El modelo de regresi�n lineal que relaciona a las variables es:
  # Ygorro = Betagorro0 + Betagorro1*x
# Entonces la l�nea de m�nimos cuadrados es:
  # Atenuaciongorro = 14.17492 + 0.02242*Frecuencia

# c. Trace la l�nea de m�nimos cuadrados sobre el diagrama de dispersi�n para verificar sus c�lculos.
# Listo, es la l�nea recta sobre el diagrama de dispersi�n (Gr�fica de p�gina 1)

# d. Interprete los valores de BetaGorroCero y BetaGorroUno.
# BetaGorroCero representa el punto donde se corta al eje de las Y. O sea, es nuestra l�nea evaluada en 0. Pero como no deber�a haber atenuaci�n porque no hay emisi�n (Transmisi�n = 0), beta 0 deber�a ser 0.
# BetaGorroUno es la pendiente de la recta. Por cada MHz que en la transmisi�n, se incrementa 0.22db la atenuaci�n.

# e. Elabore y analice las graficas de residuos estandarizados para ver si identifica violaciones a las suposiciones del modelo.
# Gr�fica de dispersi�n vs x: 
  # Los datos asimilan una relaci�n cuadr�tica respecto a x, ya que comienzan por debajo del 0, incrementan hasta cruzar la l�nea de 0 y despu�s vuelven a bajar. No parecen valores aleatorizados.
# Histograma de residuos:
  # No parece cercano a una distribuci�n normal. Hay valores en los extremos y hueco en el centro.
# Gr�fico de probabilidad normal:
  # No se observan violaciones claras como en el histograma, aunque s� se observa una separaci�n entre el primero y �ltimo dato, por lo que se les puede considerar valores extremos.
# Gr�fico secuencial de residuos.
  # Debido a que los datos fueron tomados en orden ascendente, se observa el mismo resultado que en el gr�fico de dispersi�n residuos vs x. O sea que los residuos suben y bajan respecto a su promedio.
# Todas las gr�ficas se ven correctas. Aunque hay una correlaci�n positive en la grafica secuencial de residuos.
