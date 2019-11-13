setwd("D:/Skola/I-STGST/Cviceni/cvXI")

# nacteni dat a jejich pocatecni pruzkum
data <- read.table("D:/Skola/I-STGST/Cviceni/cvXI/dataXI.txt", header=T, quote="\"")
shapiro.test(data[,3])

library(geoR)
geo.data <- as.geodata(data, coords.col = 1:2, data.col=3)
summary(geo.data)

# prostorova pruzkumna analyza
points(geo.data,cex.min=1,cex.max=4, col="gray")
# points(geo.data,cex.min=1,cex.max=4, col=heat.colors(5))
points(geo.data, trend="1st", abs=T, col="gray", cex.max=3)   # rezidua po nafitovani linearniho trendu
points(geo.data, trend="2nd", abs=T, col="gray", cex.max=3)   # rezidua po nafitovani kvadratickeho trendu
# kladna (cerne) a zaporna (bile) rezidua se vyskytuji u sebe - indikuje prostorove autokorelace

plot(geo.data,lowess=TRUE) 
plot(geo.data,lowess=TRUE,trend="1st")     
plot(geo.data,lowess=TRUE,trend="2nd") 

# variogram
plot(variog(geo.data, option = 'cloud'))

variogram  <- variog(geo.data)
plot(variogram)
varfit <- variofit(variogram)
lines(varfit)
varfit <- variofit(variogram, nugget = 50, max.dist = 500)
lines(varfit, col = 'red')
varfit <- variofit(variogram, cov.model = 'gau', nugget = 50, max.dist = 500)
lines(varfit, col = 'blue')

# eyefit <- eyefit(variogram)
# lines(eyefit, col = "green")

var4 <- variog4(geo.data)
plot(var4)

# tvorba rastru
# summary(geo.data)
# b rozestupy, l pocet intervalu
loci <- expand.grid(seq(min(geo.data$coords[,1]), max(geo.data$coords[,1]), b = 5),seq(min(geo.data$coords[,2]), max(geo.data$coords[,2]), b = 5))
plot(loci)

kriging <- krige.conv(geo.data, loc = loci, krige = krige.control(obj.model = varfit))

# kc <- krige.control(obj.model = varfit)
# kriging <- krige.conv(geo.data, loc = loci, krige = kc)

str(kriging)
image(kriging)
contour(kriging,add=T)
contour(kriging, filled = T)

par(mfrow = c(1,2))
image(kriging)
contour(kriging,add=T)
image(kriging, val = sqrt(kriging$krige.var))
contour(kriging, val = sqrt(kriging$krige.var), add=T)
par(mfrow = c(1,1))

# image(kriging, col=rev(heat.colors(10, alpha= 0.2)))
# contour(kriging,add=T)

##### kriging s linearnim trendem #####
plot(geo.data,lowess=TRUE) 
plot(geo.data,lowess=TRUE,trend="1st")

variogram.t  <- variog(geo.data, trend = "1st")
plot(variogram.t)
varfit.t <- variofit(variogram.t, nugget = 55, max.dist = 320)
lines(varfit.t, col = 'red')

kriging.t <- krige.conv(geo.data, loc = loci, krige = krige.control(obj.model = varfit.t))
image(kriging.t, col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.t, add = T)

par(mfrow = c(1,2))
image(kriging, col=rev(heat.colors(10, alpha= 0.5))); contour(kriging, add = T)
image(kriging.t, col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.t, add = T)
par(mfrow = c(1,1))

#### kriging s daty, ktera nemaji normalni rozdeleni a navic se v nich vyskytuje trend ####
geo.data.n <- as.geodata(data, coords.col = 1:2, data.col=4)
plot(geo.data.n)

shapiro.test(geo.data.n$data)
shapiro.test(log(geo.data.n$data))

geo.data.n$data <- log(geo.data.n$data)
plot(geo.data.n, lowess = T, trend = "1st")

variogram.vt  <- variog(geo.data.n, trend = "1st")
plot(variogram.vt)
varfit.vt <- variofit(variogram.vt, nugget = 55, max.dist = 320)
lines(varfit.vt, col = 'red')

kriging.vt <- krige.conv(geo.data.n, loc = loci, krige = krige.control(obj.model = varfit.vt))

summary(data$volume2)
summary(kriging.vt$predict)

# puvodne logarimovane hodnoty je potreba odlogaritmovat nebo pozdeji alespon zobrazit spravne
# kriging.vt.exp <- kriging.vt
# kriging.vt.exp$predict <- exp(kriging.vt.exp$predict)

par(mfrow = c(1,2))
image(kriging.vt, col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.vt, add = T)
# parametr ... val = exp(kriging.vt$predict) ... predstavuje prevedeni cisel zpet na puvodni rozsah (odlogaritmovani)
image(kriging.vt, val = exp(kriging.vt$predict), col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.t, val = exp(kriging.vt$predict), add = T)
par(mfrow = c(1,1))