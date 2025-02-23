#
# Distribuci�n Exponencial
# ---
#Ejemplo 1
#
#
# Suponga que el tiempo de respuesta X en cierta terminal de computadora en l�nea tiene una distribuci�n exponencial con tiempo esperado de respuesta igual a 5 segundos
# a) Determine la  probabilidad de que el tiempo de respuesta sea a lo sumo 10
# ---
# Soluci�n:
# Como el tiempo esperado de respuesta es E(X)=1/lambda y E(X) = 5 entonces 1/lambda = 5, as� que lambda = 0.2
# a) P(X <= 10) = 0.8647
lambda = 0.2
prob_menor_igual_10 = pexp(10, 0.2)
prob_menor_igual_10

# b) P(5 <= X <= 10) = 0.2325
prob_5_a_10 = pexp(10, 0.2) - pexp(5, 0.2)
prob_5_a_10


#-----------------------------------------------------------------------------------------
# Ejemplo 2
#
# Suponga que los tiempos entre llegadas de pacientes a un consultorio siguen una distribuci�n exponencial
# Se sabe que los pacientes llegan al consultorio a intervalos promedio de 30 minutos. La cl�nica abre a las 8:00am.
# Calcule la probabilidad de que
# a) El primer paciente llegue a las 8:10am o antes R = 0.2832 (lambda aproximado a 4 decimales)
# b) El primer paciente llegue despu�s de las 8:10am R = 0.7168
# c) El tiempo entre el primer y el segundo paciente sea de 15 minutos o menos R = 0.3939 ( P(X <= 15) )
# d) El tiempo entre el segundo paciente y el tercero sea de entre 20 y 40 minutos R = P(20 < X < 40) = 0.2499
# ---
# Como E(X) = 30, lambda = 1/30
lambda = 1/30
# a) P(X <= 10) = 0.2835
prob_menor_igual_10 = pexp(10, lambda)
prob_menor_igual_10
# b) P(X > 10) = 0.7165
prob_mayor_que_10 = 1 - prob_menor_igual_10
prob_mayor_que_10



#------------------------------------------------------------------------------------------
#
#
# Suponga que el tiempo de atenci�n al p�blico en la secci�n "para llevar" de un restaurante de comida r�pida es una variable aleatoria que sigue una distribuci�n exponencial con media 4 minutos. Suponga adem�s, que se presenta un cliente para solicitar un pedido para llevar
# a) Calcule la probabilidad de que su pedido tarde cuando mucho 4 minutos en ser despachado R = 0.6321
# b) Calcule la probabilidad de que su pedido tarde m�s de 4 minutos en ser despachado R = 0.3679
# c) Calcule la probabilidad de que su pedido tome entre 4.5 y 7.0 minutos R = 0.1509
# d) Calcule el tiempo m�ximo que tardan en atender al 20% de los pedidos m�s r�pidos R = 0.89 minutos
# e) Calcule el tiempo m�nimo que se tarda en atender al 5% de los pedidos que m�s tiempo toman R = 11.98 minutos
# ---
# E(X) = 4, entonces lambda = 1/4 = 0
# d) P(X < x0) = 0.20, entonces x0 = 0.8926
lambda = 0.25
cuantil_20 = qexp(0.20, lambda)
cuantil_20

# e) P(X > x0) = 0.05, entonces x0 = 11.98
cuantil_95 = qexp(1-0.05, lambda)
cuantil_95

