shapiro.test(data[,3]) #jestli ma normalni rozdeleni
hist(data[,3])
hist(data[,3],nclass = 20)
qqPlot(data[,3]) #bud shapiro, podivat na hist a qq plot -> zjisteni normalnosti
qqPlot(log(data[,3]))
shapiro.test(log(data[,3]))
geodata <- as.geodata(data, coords.col = 1:2, data.col = 3)
geodata$data <- log(data[,3])
plot(geodata,lowess = T) #vidim ze mam data bez trendu
var <- variog(geodata) #variogram
plot(var) #vidim ze je tam nudget efekt, + nekolik zlomu v prahu
vario.fit <- variofit(var, nugget = 0.18, max.dist = 200) #variogram, Rko se odpichne od danych udaju a snazi se udelat podle tech zadanych hodnot nejlepsi variogram
lines(vario.fit,col="red") # zjištìní jak je vhodný
summary(geodata) # na základì nejmenší a nejvìtší x a y udìláme grid
loci <- expand.grid(seq(300,700,b=2),seq(5900,6400,b=2)) #vytvoreni rastru
plot(loci)
kc <- krige.conv(geodata, loc = loci, krige = krige.control(obj.model = vario.fit) )#kriging
loci <- expand.grid(seq(300,700,b=5),seq(5900,6400,b=5))
kc <- krige.conv(geodata, loc = loci, krige = krige.control(obj.model=vario.fit))
contour(kc,add=T)
image(kc,value = exp(kc$predict))
image(kc,value = exp(sqrt(kc$krige.var))
