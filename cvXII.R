data <- read.table("D:/Skola/I-STGST/Cviceni/cvXII/data.txt", header=T, quote="\"")

library(e1071)
library(car)

mean(data[,3])
var(data[,3])
sd(data[,3])
skewness(data[,3])
kurtosis(data[,3])
### c(mean(data[,3]),var(data[,3]),sd(data[,3]),skewness(data[,3]),kurtosis(data[,3]))
hist(data[,3])
boxplot(data[,3])

qqPlot(data[,3])
shapiro.test(data[,3])
shapiro.test(log(data[,3]))

######################################################################

library(geoR)
data[,4] <- log(data[,3])
geodata <- as.geodata(data, coords.col=1:2, data.col=4)
plot(geodata, lowess = T)

var<-variog(geodata)
plot(var)
var <- variog(geodata, max.dist=200)
# vario.fit <- variofit(var,max.dist=370000)
# vario.fit <- variofit(var, cov.model = "spherical", nugget = 0.16, max.dist = 220000, fix.nugget = TRUE)
vario.fit <- variofit(var, nugget = 0.18, max.dist = 200, fix.nugget = TRUE)
lines(vario.fit,col="red")

summary(geodata$coords)
loci <- expand.grid(seq(300,700,b=2),seq(5900,6400,b=2))

kc <- krige.conv(geodata,loc=loci,krige=krige.control(obj.model=vario.fit))
# e=exp(1)
par(mfrow = c(1,2))
image(kc, value = exp(kc$predict), col = terrain.colors(12))
contour(kc,value = exp(kc$predict), nlev = 20, add=T)

image(kc, value = exp(sqrt(kc$krige.var)))
contour(kc,value = exp(sqrt(kc$krige.var)), add=T)
par(mfrow = c(1,1))

#################################################################

data[,5] <- 0

attach(data)

a <- quantile(y, probs = c(1:4/4))

data[,5] <- ifelse(y < a[1], 1, ifelse(y < a[2], 2, ifelse(y < a[3], 3, 4)))
data[,5] <- as.factor(data[,5])

table(data[,5])

str(data)

anova <- aov(z~data[,5], data = data)
anova
summary(anova)

plot(TukeyHSD(anova))

plot(x,y, pch = "")
abline(h = c(a[1], a[2],a[3]), lty = 3)
text(x,y, data[,5], cex = 0.6, col = as.numeric(data[,5]))

##################################################
data2 <- read.table("D:/Skola/I-STGST/Cviceni/cvXII/data2.txt", header=T, quote="\"")

attach(data2)
cor(data2[,1], data2[,2])
lm <- lm(data2[,1] ~ data2[,2] + I(data2[,2]^2) + I(data2[,2]^3))
summary(lm)

plot(data2[,1] ~ data2[,2])
points(data2[,2], lm$fitted.values, col = "red")
