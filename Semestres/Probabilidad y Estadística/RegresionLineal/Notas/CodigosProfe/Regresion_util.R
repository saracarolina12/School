# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 11 01
# =====
# Archivo de utiler�as para Regresi�n Lineal Simple
# -----
# Funciones
# -----
# C�lculo de los principales resultados de una Regresi�n Lineal Simple
regresion_lineal_simple = function(datos, x_nueva=NULL) {
  # Esta funci�n asume que la primera columna contiene los valores para x y la segunda para y
  x = datos[,1]
  y = datos[,2]
  n = dim(datos)[1]
  # ---
  # Calculamos beta_gorro0 y beta_gorro1
  Sxx = sum(x^2) - 1/n*(sum(x))^2
  Sxy = sum(x*y) - 1/n*(sum(x))*sum(y)
  Syy = sum(y^2) - 1/n*(sum(y))^2
  beta_gorro1 = Sxy/Sxx
  beta_gorro0 = mean(y) - beta_gorro1*mean(x)
  # Calculamos r y r^2
  r = Sxy/sqrt(Sxx*Syy)
  r2 = r^2
  # Calculamos los residuos
  y_gorro = beta_gorro0 + beta_gorro1*x
  residuos = y - y_gorro
  residuos_std = (residuos - mean(residuos))/sd(residuos)
  
  # ---
  # Gr�fica de dispersi�n
  plot(x, y, main="Gr�fica de Dispersi�n",
       xlab=names(datos)[1], ylab=names(datos)[2],
       pch=16, col="blue")
  # Agregamos la recta de regresi�n
  abline(a=beta_gorro0, b=beta_gorro1, col="red")
  
  # ---
  # Gr�ficas de residuos
  par(mfrow=c(2,2))
  # --
  # Dispersi�n de Residuos vs x
  titulo = paste("Residuos Std vs", names(datos)[1])
  plot(x, residuos_std, pch=16, col="green", main=titulo, xlab=names(datos)[1],
       ylab="Residuos Estandarizados")
  abline(h=0, col="red")
  # Histograma de residuos
  hist(residuos_std, main="Histograma de Residuos Std",
       xlab="Residuos Estandarizados", ylab="Frecuencia", col="green")
  # Gr�fica de probabilidad normal
  qqnorm(residuos_std, pch=16, col="green",
         main="Gr�fica de probabilidad Normal \n Residuos Estandarizados",
         xlab="Cuantiles Esperados", ylab="Cuantiles Observados")
  qqline(residuos_std, col="red")
  # Gr�fica secuencial de residuos
  plot(residuos_std, pch=16, col="green", type="b",
       main="Gr�fica secuencial de Residuos Std",
       xlab="Posici�n", ylab="Residuos Estandarizados")
  abline(h=0, col="red", lty=2)
  # --
  par(mfrow=c(1,1))
  
  # ---
  # Pron�stico de y para x_nueva
  if (! is.null(x_nueva)) {
    y_nueva = beta_gorro0 + beta_gorro1*x_nueva
  } else {
    y_nueva = NULL
  }
  
  # ---
  # Devolvemos el resultado al programa principal
  resultado = list(beta_gorro0=beta_gorro0, beta_gorro1=beta_gorro1,
                   residuos=residuos, residuos_std=residuos_std,
                   r=r, r2=r2, y_nueva=y_nueva)
  
  return(resultado)
}

# =====

regresion_intervalo_confianza = function(xp, datos, pos_y,
                                          modelo_reg, coef_conf) {
  p = length(xp)
  xp = c(1, xp)
  y_gorro = sum(modelo_reg$coefficients*xp)
  MSE = mean(modelo_reg$residuals^2)
  n = dim(datos)[1]
  alfa = 1 - coef_conf
  t_alfa_medios = qt(alfa/2, n - p, lower.tail=FALSE)
  
  # =====
  # Construcci�n de X
  X = as.matrix(cbind(1,datos[,-pos_y]))
  
  # ---
  termino_x = xp %*% solve(t(X) %*% X) %*% xp
  LIC = y_gorro - t_alfa_medios * sqrt(MSE*(termino_x))
  LSC = y_gorro + t_alfa_medios * sqrt(MSE*(termino_x))
  
  lista_resultado = list(limite_inferior_confianza=LIC,
                         limite_superior_confianza=LSC)
  
  return(lista_resultado)
}

# =====

regresion_intervalo_prediccion = function(xp, datos, pos_y,
                                          modelo_reg, coef_conf) {
  p = length(xp)
  xp = c(1, xp)
  y_gorro = sum(modelo_reg$coefficients*xp)
  MSE = sum(modelo_reg$residuals^2)
  n = dim(datos)[1]
  alfa = 1 - coef_conf
  t_alfa_medios = qt(alfa/2, n - p, lower.tail=FALSE)
  
  # =====
  # Construcci�n de X
  X = as.matrix(cbind(1,datos[,-pos_y]))
  
  # ---
  termino_x = xp %*% solve(t(X) %*% X) %*% xp
  LIP = y_gorro - t_alfa_medios * sqrt(MSE*(1 + termino_x))
  LSP = y_gorro + t_alfa_medios * sqrt(MSE*(1 + termino_x))
  
  lista_resultado = list(limite_inferior_prediccion=LIP,
                         limite_superior_prediccion=LSP)
  
  return(lista_resultado)
}

# =====

graficas_residuos = function(residuos, x, nombre_x="X") {
  residuos_std = (residuos - mean(residuos))/sd(residuos)
  # ---
  # Gr�ficas de residuos
  par(mfrow=c(2,2))
  # --
  # Dispersi�n de Residuos vs x
  titulo = paste("Residuos Std vs", nombre_x)
  plot(x, residuos_std, pch=16, col="green", main=titulo,
       xlab=nombre_x, ylab="Residuos Estandarizados")
  abline(h=0, col="red")
  # Histograma de residuos
  hist(residuos_std, main="Histograma de Residuos Std",
       xlab="Residuos Estandarizados", ylab="Frecuencia", col="green")
  # Gr�fica de probabilidad normal
  qqnorm(residuos_std, pch=16, col="green",
         main="Gr�fica de probabilidad Normal \n Residuos Estandarizados",
         xlab="Cuantiles Esperados", ylab="Cuantiles Observados")
  qqline(residuos_std, col="red")
  # Gr�fica secuencial de residuos
  plot(residuos_std, pch=16, col="green", type="b",
       main="Gr�fica secuencial de Residuos Std",
       xlab="Posici�n", ylab="Residuos Estandarizados")
  abline(h=0, col="red", lty=2)
  # --
  par(mfrow=c(1,1))
  
  return(NULL)
}


