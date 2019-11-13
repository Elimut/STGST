x <- 1:5
x
setwd("C:/users/havelkova/geostat")
getwd ()
log(5)
sqrt(5)
sin(pi/3)*2
b<-6
b
str(b)
c<-"6"
c
str(c)
a=5
b=6
b=a
b
b<-a
a<-a
x<-1:5
x<-c(1:5)
x<-c(1,2,3,4,5)
x<-seq(1,5,by=1)
x<- seq(1,5,by=0.01)
str(x)
x
dim(x)
length(x)
x[5:8]
x[-(1:2)]
fix(x)
m <- matrix(3,nrow=3,ncol=3)
m
m <- matrix(c(1:9),nrow=3,ncol=3)
m
m <- matrix(c(1:9),nrow=3,ncol=3,byrow=T)
m
m[1,3]<-12
m
x <- seq(1,5,by=1)
y <- seq(6, 10, 1)

rbind(x,y)
cbind(x,y)

install.packages("sp")
library("sp")
data(meuse)
vignette("sp")
str(meuse)
write.table(meuse,file="maas.txt")
maas <- read.table("C:/users/havelkova/geostat/maas.txt", header=T, quote="\"")
hist(maas[,4])
maas["cadmium"]
hist(maas[,1])
plot(maas[,1])

x<-1:5
x
x=1:5
x
x=6
x
6+45
log(45)
8^3
x<-T;y<-F
x;y
x<-5!
  x<-c(1:5)
x
x<-seq(1,5by=2)
x<-seq(1,5,by=2)
x
str(x)
x<-(1,5,by=0.01)
x<-seq(1,5,by=0.01)
x
str(x)
y<-x+x
str(y)
x[5]
y[5]
y[5:11]
fix(x)
?matrix
m <-matrix(3,nrow=3,ncol=3)
m
m2<-matrix(4,3,3)
m2
m[1,3]
m<-matrix(c(1:9),3,)
m<-matrix(c(1:9),3,3)
m
m<-matrix(c(1:9),3,3,byrow=T)
m
m[2,3]
m[2,3]<-12
m
library(intamap)
install.packages("intamap")
library("intamap")
vignette(intamap)
vigentte("intamap")
vignette("sp")
vignette("sp")
library(sp)
data(meuse)
str(meuse)
meuse
write.table(meuse,file="maaas.txt")
maaas <- read.table("C:/users/vancurova/geostatistika/cviceni 1/maaas.txt", header=T, quote="\"")
View(maaas)
str(meuse)
maaas$x
maaas["x"]
hist(maaas[,6])
hist(maaas[,6],col=6,xlab="osah masa")
plot(maaas[,6])
tplo(maaas[,6],col=6,xlab="obsah masa")
plot(maaas[,6],col=6,xlab="obsah masa")
plot(maaas[,6],col=6,xlab="obsah masa".pch="T")
plot(maaas[,6],col=6,xlab="obsah masa,pch="T")
plot(maaas[,6],col=6,xlab="obsah masa",pch="T")
savehistory("C:/users/vancurova/geostatistika/cviceni 1/cv1.Rhistory") 