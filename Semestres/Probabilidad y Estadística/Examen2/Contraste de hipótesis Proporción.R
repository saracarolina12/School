proporcion = function(x, n, alfa, p0, condicion = 0) {
  p_gorro = x/n
  z_calc = (p_gorro - p0)/sqrt((p0*(1 - p0))/n)
  print(paste("Zcalc = ", z_calc))
  z_alfa_medios = qnorm(alfa/2, lower.tail=FALSE)
  z_alfa = qnorm(alfa, lower.tail=FALSE)
  menos_z_alfa = -z_alfa
  
  if(condicion == 0)
  {
    print(paste("-Zalfa = ", menos_z_alfa))
    if(z_calc < menos_z_alfa) resultado = TRUE
    else resultado = FALSE
  }
  else if (condicion == 1)
  {
    print(paste("Zalfa = ", z_alfa))
    if(z_calc > z_alfa) resultado = TRUE
    else resultado = FALSE
  }
  else
  {
    print(paste("Zalfa/2 = ", z_alfa_medios))
    
    if(abs(z_calc) > z_alfa_medios) resultado = TRUE
    else resultado = FALSE
  }
  
  return(resultado)
}

p0 = 0.5           #Proporci�n esperada
x = 108             #Cantidad de elementos que cumplen una caracter�stica
n = 200             #Tama�o de la muestra
alfa = 0.01         #Probabilidad de cometer un error tipo 1
condicion = 2.157       #Condici�n de rechazo de la hip�tesis (0 = z_calc < menos_z_alfa;1 = z_calc > z_alfa; 2 = abs(z_calc) > z_alfa_medios)

rechazo = proporcion(x, n, alfa, p0, condicion) 
rechazo