# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 10 04
# =====
# Ejemplo. Distribuci�n de la media aritm�tica de una poblaci�n no normal (exponencial, en este caso)
# Generamos n observaciones uniformes con par�metro lambda = 1/50
# Calculamos el valor de x.barra (que en este caso es 1/lambda), repetimos y hacemos un histograma de frecuencia
m <- 1000
# Tama�o de la muestra extra�da
n <- 50
# Par�metros de la distribuci�n exponencial
lambda = 1/50
x.barra <- rep(0,times=m)
for (i in 1:m) {
  x <- rexp(n,rate=lambda)
  x.barra[i] <- mean(x)
}
# Light steel blue http://www.computerhope.com/htmcolor.htm
miColor <- "#728FCE"
# Beige. Color complementario con #728fce
miColor2 <- "#CFB172"
par(mfrow=c(1,2))
principalOrig <- "Histograma de X,\n variable original "
principalOrig = paste(principalOrig, "Exp(",round(lambda,4),")")
xOrig <- rexp(m, rate=lambda)
hist(xOrig,col=miColor2,main=principalOrig,xlab="X",ylab="Frecuencia relativa",freq=FALSE)
principal <- paste("Histograma de x.barra,",m," muestras\n de tama�o n = ",n,sep="")
hist(x.barra,col=miColor,main=principal,xlab="x.barra",ylab="Frecuencia relativa",freq=FALSE)
# Le superponemos una distribuci�n normal con media mu y varianza sigma^2/n
mu <- 1/lambda
sigma <- 1/lambda
ejeX <- seq(mu-3*sigma,mu+3*sigma,length=200)
norm <- dnorm(ejeX,mu,sigma/sqrt(n))
lines(ejeX,norm,col="red")
par(mfrow=c(1,1))
