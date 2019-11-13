setwd("D:/Skola/I-STGST/Cviceni/cvVII")
data.eu <- read.table("D:/Skola/I-STGST/Cviceni/cvVII/data.eu.txt", header=T, quote="\"")

# scatterplot
plot(data.eu[,-1])

attach(data.eu)

# korelace
cor(nezamestnanost, kriminalita)
cor(kriminalita, populace)
cor(kriminalita_pop, nezamestnanost)

# korealcni matice
cor(data.eu)
cor(data.eu[,-1])

# vyznamnost korelace pomoci testu korelace
cor.test(nezamestnanost, kriminalita)
cor.test(kriminalita_pop, nezamestnanost)


cor(kriminalita_pop, nezamestnanost, method = c("pearson"))
cor(kriminalita_pop, nezamestnanost, method = c("spearman"))
cor(kriminalita_pop, nezamestnanost, method = c("kendall")) 

####################regrese##############################
# podminky regrese
# Norm?ln? rozd?len? z?visl? prom?nn?
# Vz?jemn? nez?vislost z?visl? prom?nn? - bez autokorelace(zavislost mezi jednim prvkem)
# Smysluplna linearita vztahu
# Homoskedasticita ? konstantn? rozptyl, kter? je nez?visl? na parametrech


# normalni rozdeleni
shapiro.test(kriminalita)
shapiro.test(log(kriminalita))

shapiro.test(populace)
shapiro.test(log(populace))

shapiro.test(kriminalita_pop)
shapiro.test(log(kriminalita_pop))

shapiro.test(nezamestnanost)
shapiro.test(log(nezamestnanost))
 
################## linearni regrese ##################
linm <- lm(kriminalita_pop ~ nezamestnanost, data = data.eu) 
linm
summary(linm)

# vykresleni
plot(kriminalita_pop ~ nezamestnanost, pch = '*')
abline(linm, col = 'red')

linm$fitted.values
points(nezamestnanost, linm$fitted.values, col = 'blue')

par(mfrow = c(2,2))
plot(linm)
par(mfrow = c(1,1))

# normal Q-Q - normalita rezidui, mely by byt v liniich na uhlopricku, pokud je vse spravne
# residuals vs. fitted - linearita vztahu - nemel by byt videt zadny mozny vztah - nezavisle rozptylene body
# scale-location - homoskedacita (konstantni rozptyl) - data by mela byt nahodne rozptylena kolem horizontalni linie
# residuals vs. leverage - identifikace outlieru a vyznamnych bodu (mereni) 
#                        - vysoka hodnota leverage - neobvykla kombinace prediktoru, velka cookova vzdalenost = velka vyznamnost


# vypocet predikce a konfidencnich intervalu z puvodnich hodnot
linm.pred <- predict(linm, interval = 'confidence')

plot(kriminalita_pop ~ nezamestnanost, pch = '*')
points(points(data.eu$nezam, linm.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, linm.pred[,'lwr'], col = 'blue', type='p')
points(data.eu$nezam, linm.pred[,'upr'], col = 'blue', type='p')

# zcela jina data nez puvodni - predikce na nova data
new <- data.frame(nezamestnanost = seq(1,30,1))
pred.new <- predict(linm, newdata = new, interval = 'confidence')
points(new[,1], pred.new[,'fit'], col = 'green', type='b')

loglinm <- lm(log(kriminalita_pop) ~ nezamestnanost, data = data.eu) 
loglinm
summary(loglinm)
plot(loglinm)

plot(log(kriminalita_pop) ~ log(nezamestnanost), pch = '*')

abline(loglinm, col = 'red')

loglinm.pred <- predict(loglinm, interval = 'confidence')
points(data.eu$nezam, loglinm.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, loglinm.pred[,'lwr'], col = 'blue', type='p')
points(data.eu$nezam, loglinm.pred[,'upr'], col = 'blue', type='p')

################# kvadraticka regrese #####################
kvm <- lm(kriminalita_pop ~ nezamestnanost + I(nezamestnanost^2), data = data.eu) 
kvm
summary(kvm)
plot(kvm)

plot(kriminalita_pop ~ nezamestnanost, pch = '*')
abline(kvm, col = 'red')

# vypocet predikce a konfidencnich intervalu z puvodnich hodnot
kvm.pred <- predict(kvm, interval = 'confidence')

plot(kriminalita_pop ~ nezamestnanost, pch = '*')
points(data.eu$nezam, kvm.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, kvm.pred[,'lwr'], col = 'blue', type='p')
points(data.eu$nezam, kvm.pred[,'upr'], col = 'blue', type='p')

logkvm <- lm(log(kriminalita_pop) ~ nezamestnanost + I(nezamestnanost^2), data = data.eu) 
logkvm
summary(logkvm)
plot(logkvm)

logkvm.pred <- predict(logkvm, interval = 'confidence')

plot(log(kriminalita_pop) ~ nezamestnanost, pch = '*')
points(data.eu$nezam, logkvm.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, logkvm.pred[,'lwr'], col = 'blue', type='p')
points(data.eu$nezam, logkvm.pred[,'upr'], col = 'blue', type='p')

########### kubicka regrese ################
kum <- lm(kriminalita_pop ~ nezamestnanost + I(nezamestnanost^2) + I(nezamestnanost^3), data = data.eu) 
kum
summary(kum)
plot(kum)

logkum <- lm(log(kriminalita_pop) ~ nezamestnanost + I(nezamestnanost^2) + I(nezamestnanost^3), data = data.eu) 
logkum
summary(logkum)
plot(logkum)

# vypocet predikce a konfidencnich intervalu z puvodnich hodnot
kum.pred <- predict(kum, interval = 'confidence')

plot(kriminalita_pop ~ nezamestnanost, pch = '*')
points(data.eu$nezam, kum.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, kum.pred[,'lwr'], col = 'blue', type='p')
points(data.eu$nezam, kum.pred[,'upr'], col = 'blue', type='p')

logkum.pred <- predict(logkum, interval = 'confidence')

plot(log(kriminalita_pop) ~ nezamestnanost, pch = '*')
points(data.eu$nezam, logkum.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, logkum.pred[,'lwr'], col = 'blue', type='p')
points(data.eu$nezam, logkum.pred[,'upr'], col = 'blue', type='p')

############### vykresleni vsech modelu ######################
plot(kriminalita_pop ~ nezamestnanost, pch = '*')
points(data.eu$nezam, linm.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, kvm.pred[,'fit'], col = 'blue', type='p')
points(data.eu$nezam, kum.pred[,'fit'], col = 'dark green', type='p')

plot(log(kriminalita_pop) ~ nezamestnanost, pch = '*')
points(data.eu$nezam, loglinm.pred[,'fit'], col = 'red', type='p')
points(data.eu$nezam, logkvm.pred[,'fit'], col = 'blue', type='p')
points(data.eu$nezam, logkum.pred[,'fit'], col = 'dark green', type='p')

##################################################################################

# vyhodnoceni rozdilnosti model?
anova(linm, kum)
anova(loglinm, logkum)

# vicenasobna regrese
lm.vse <- lm(kriminalita_pop ~ ., data = data.eu[,-1])
summary(lm.vse)
step(lm.vse)

# model s interakci
lm.vse.i <- lm(kriminalita_pop ~ .^2, data = data.eu[,-1])
summary(lm.vse.i)
step(lm.vse.i)


# nakonec udelat to same a navic zakladni statistiku pro datovou sadu obratnost