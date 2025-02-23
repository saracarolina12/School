#Examen 2, pregunta 9
# En un art�culo de la revista Consumer Reports se compararon varios tipos de bater�as. En particular se estudi� una muestra de 100 piezas de bater�as AA alcalinas Duracell. Suponga que la la media aritm�tica fue de 4.2 y su desviaci�n est�ndar muestral del tiempo de vida fue de 1.75 horas para dichas bater�as.
# 
# Elabore una funci�n en R que reciba la varianza de una muestra, el tama�o de muestra y un coeficiente de confianza, y que devuelva el intervalo de confianza para la varianza. Utilice ese programa para calcular un intervalo de confianza de 90% para la varianza en los tiempos de vida las bater�as alcalinas AA Duracell.

IC_mu_sigma_conocida = function(x_barra, sigma, n, coef_conf) {
  alfa = 1 - coef_conf
  z_alfa_medios = qnorm(alfa/2, lower.tail=FALSE)
  
  LIC = x_barra - z_alfa_medios*sigma/sqrt(n)
  LSC = x_barra + z_alfa_medios*sigma/sqrt(n)
  
  resultado = list(lim_inf_conf=LIC, lim_sup_conf=LSC)
  
  return(resultado)
}

x_barra = 4.2      #Media
sigma = 1.75           #Desviaci�n est�ndar
n = 100              #Tama�o de muestra
coefConf = 0.90     #Coeficiente de confianza

IC1 = IC_mu_sigma_conocida(x_barra, sigma, n, coefConf)
IC1