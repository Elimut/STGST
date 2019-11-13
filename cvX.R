setwd("D:/Skola/I-STGST/Cviceni/cvX")

data <- read.delim("D:/Skola/I-STGST/Cviceni/cvX/data.txt", dec=",")

#### test normálního rozdìlení ####
shapiro.test(data[,2])
sapply(data[,-1], shapiro.test)

#############################################
############ Parametricke metody ############
#############################################

#### ANOVA + Tukey HSD - analýza variance a vícenásobné porovnávání ####
#### zjišování rozdílù mezi více než dvìma skupinami, srovnání vnitro- a mezi-skupinového rozptylu ####
#### v pøípadì zamítnutí H0: µ1 = µ2 nerovná se µ3 nebo µ1 nerovná se µ2 = µ3 nebo µ1 nerovná se µ2 nerovná se µ3 ####

# rozdeleni do skupin
data$skupina <- 1
data[10:18,'skupina'] <- 2
data[19:27,'skupina'] <- 3
data$skupina <- as.factor(data$skupina)

# pøevedení skupiny na faktor
anova <- aov(nezamestnanost_00 ~  skupina, data = data)
summary(anova)

tukey <- TukeyHSD(anova)
plot(tukey)

a <- quantile(data$nezamestnanost_00, probs=c(0.33, 0.66))
data$skupina <- ifelse(data$nezamestnanost_00 < a[1], 1, ifelse(data$nezamestnanost_00 < a[2], 2, 3))
data$skupina <- as.factor(data$skupina)

anova2 <- aov(produktivita_00 ~  skupina, data = data)
summary(anova2)

tukey2 <- TukeyHSD(anova2); tukey2
plot(tukey2)

#############################################
############ Neparametricke metody ##########
#############################################

EarlyLeavers <- read.delim("D:/Skola/I-STGST/Cviceni/cvX/EarlyLeavers.txt", dec=",")

sapply(EarlyLeavers[,-1], shapiro.test)

#### Kruskal - Wallis test - neparametrická obdoba ANOVY ####
EarlyLeavers$skupina <- 0

b <- quantile(EarlyLeavers$r2005, probs=c(0.33, 0.66))
EarlyLeavers$skupina <- ifelse(EarlyLeavers$r2005 < b[1], 1, ifelse(EarlyLeavers$r2005 < b[2], 2, 3))
EarlyLeavers$skupina <- as.factor(EarlyLeavers$skupina)

kruskal <- kruskal.test(r2005 ~  skupina, data = EarlyLeavers)
kruskal

library(pgirmess)
kruskalmc(r2005 ~  skupina, data = EarlyLeavers)

kruskal2 <- kruskal.test(r2013 ~  skupina, data = EarlyLeavers)
kruskal2
kruskalmc(r2013 ~  skupina, data = EarlyLeavers)
