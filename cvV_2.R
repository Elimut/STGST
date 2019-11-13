setwd("D:/Skola/I-STGST/Cviceni/cvIV")

########### NAHRANI DAT ##############

# Import Dataset

# kod
pop <- read.delim("D:/Skola/I-STGST/Cviceni/cvIV/population.txt")
nezam <- read.delim("D:/Skola/I-STGST/Cviceni/cvIV/unemployment.txt", dec=",")
crime <- read.csv("D:/Skola/I-STGST/Cviceni/cvIV/Crimes.csv", sep=";")

#nahrani dat primo z excelu
library('xlsx')

sesit <- paste(getwd(),"Eurostat_data.xlsx",sep='/')
# sesit <- "D:/Skola/I-STGST/Cviceni/cvIV/Eurostat_data.xlsx"

pop <- read.xlsx(sesit,'population')
nezam <- read.xlsx(sesit,2)
crime <- read.xlsx(sesit,3)

######## Uprava datove sady ######
nezam <- nezam[,-c(3,5,7)]
nezam.total <- nezam[,1:2]
colnames(nezam.total) <- c('GEO', 'nezamestnanost')

pop.2012 <- pop[,c('GEO','X2012')]
colnames(pop.2012) <- c('GEO','populace')

crime.2012 <- crime[,c('GEO', 'X2012')]
colnames(crime.2012) <- c('GEO','kriminalita')

UK <- crime.2012[crime.2012$GEO == 'Scotland',2] + crime.2012[crime.2012$GEO == 'Northern Ireland (UK)',2] + crime.2012[crime.2012$GEO == 'England and Wales',2]

crime.2012[,1] <- as.character(crime.2012[,1]) # zmena datoveho typu z faktoru na text
crime.2012[49,] <- c('United Kingdom', UK)
crime.2012[,2] <- as.numeric(crime.2012[,2]) # zmena datoveho typu z textu na cislo

# spojeni datovych sad na zaklade nazvu jednoho z atributu
nez.crime <- merge(nezam.total, crime.2012, by = 'GEO')
data.2012 <- merge(nez.crime, pop.2012, by = 'GEO')

# vytvoreni noveho sloupce s poctem kriminalnich cinu na 
data.2012[,5] <- 10000*data.2012$kriminalita/data.2012$populace
colnames(data.2012)[5] <- 'kriminalita_pop'

#### stredni hodnoty (miry polohy) ####

# aritmeticky prumer
mean(data.2012)
mean(data.2012[,2], na.rm = T)
# mean(na.omit(data.2012[,2]))
mean(data.2012[,2], trim = 0.1, na.rm = T)

sapply(data.2012[,2:5],mean, na.rm = T)
# for (i in 2:5) print(mean(data.2012[,i], na.rm = T))
sapply(data.2012[,2:5],function(x) mean(x, na.rm = T, trim = 0.1))

# pripojeni datove sady, pouzivaji se jen nazvy sloupcu
attach(data.2012)

# median
median(nezamestnanost, na.rm = T)
sapply(data.2012[,2:5],median, na.rm = T)

#kvantily
quantile(data.2012[,2], na.rm = T)
quantile(data.2012[,2], na.rm = T, prob = c(0.3,0.6))
quantile(data.2012[,2], na.rm = T, prob = seq(0, 1, 0.1))
quantile(data.2012[,2], na.rm = T, prob = c(1:4/4))

#geometricky prumer
gmean <- function(x) exp(mean(log(x))) #definice funkce
gmean(na.omit(data.2012[,2]))

#harmonicky prumer
hmean <- function(x) 1/mean(1/x)
hmean(na.omit(data.2012[,2]))

# modus
library(lsr)
modeOf(data.2012[,2], na.rm = TRUE)
maxFreq(data.2012[,2], na.rm = TRUE)

#### charakteristiky (miry) variability ####

# minimum a maximum
min(data.2012[,2], na.rm = T)
max(data.2012[,2], na.rm = T)

# rozsah
min <- min(data.2012[,2], na.rm = T)
max <- max(data.2012[,2], na.rm = T)
max - min

range(data.2012[,2], na.rm = T)

# mezikvartilove rozpeti
q <- quantile(data.2012[,2], na.rm = T, prob = c(0.25,0.75))
q[2] - q[1]

IQR(data.2012[,2], na.rm = T)

# prumerna absolutni odchylka od prumeru
aad(data.2012[,2], na.rm = T)

# median absolutni odchylky od medianu
mad(data.2012[,2], na.rm = T)

# rozptyl neboli variance
var(data.2012[,2], na.rm = T)

# smerodatna odchylka
sqrt(var(data.2012[,2], na.rm = T))

sd(data.2012[,2], na.rm = T)


#### miry tvaru ####
# sikmost
library(e1071)
skewness(data.2012[,2], na.rm=T)

#spicatost
kurtosis(data.2012[,2], na.rm=T)

#### automaticky vypis zakladni statistiky ####
summary(data.2012)
fivenum(data.2012[,2], na.rm=T)

# automaticky vzpis vcetne charakteristik variability
library(psych)
describe(data.2012[,2], na.rm=T)

###############################
########## grafy ##############
###############################

# XY bodovy graf

attach(data.2012)
plot(nezamestnanost, kriminalita_pop)
plot(nezamestnanost, kriminalita_pop, xlab = 'Nezamestanost (%)', ylab = 'Trestne ciny na 10 000 obyvatel', main = 'Vztah mezi kriminalitou a nezamestnanosti \n v roce 2012')

lm <- lm(kriminalita_pop ~ nezamestnanost, data = data.2012)
summary(lm)
abline(lm, col = 'red')

# sloupcovy graf
barplot(kriminalita_pop)
barplot(kriminalita_pop, main = 'Pocet trestnych cinu na 10 000 obyvatel', col = rainbow(20), names.arg = GEO)

x <- barplot(kriminalita_pop, main = 'Pocet trestnych cinu na 10 000 obyvatel', col = rainbow(20))
text(cex=0.75, x=x-.25, y=2.25, as.character(GEO), xpd=T, srt=90, adj = 1.04)

krim <- as.matrix(crime[1:5,2:5]); rownames(krim) <- as.character(crime[1:5,1])
barplot(krim, col = rainbow(5))

# histogram
hist(populace)
hist(log(populace), nclass = 12)

hist(kriminalita_pop, breaks = 10)
hist(nezamestnanost, breaks = 10)

#density
d <- density(log(populace))
plot(d)
hist(log(populace), nclass = 12, freq = F, col = 'light blue')
lines(d, col = 'red', lty = 3)

# d <- density(populace)
# plot(d)
# hist(populace, nclass = 8, freq = F, col = 'light blue')
# lines(d, col = 'red', lty = 3)

# boxplot

boxplot(populace)
boxplot(data.2012[,2:5])
boxplot(scale(data.2012[,2:5]), notch = T)

# violin plot
library(vioplot)
vioplot(nezam[!is.na(nezam[,2]),2:4])

# qqplot
qqnorm(kriminalita_pop)
qqline(kriminalita_pop, col = 'red')

qqnorm(log(kriminalita_pop))
qqline(log(kriminalita_pop))

library(qualityTools)
qqPlot(kriminalita_pop)
qqPlot(log(kriminalita_pop))

# dot plot
dotchart(kriminalita_pop, cex = 0.7, labels = GEO)
ord <- data.2012[order(data.2012$kriminalita_pop),]

dotchart(ord[,5], cex = 0.7, labels = GEO)
abline(v = c(median(kriminalita_pop, na.rm = T),mean(kriminalita_pop, na.rm = T)), col = "red", lty = 3)

# kruhovy diagram
pie(na.omit(data.2012[,4]))

data.pop <- na.omit(data.2012[order(data.2012$populace, decreasing=F),])

pie(data.pop$populace, init.angle=90, radius = 2, labels = data.pop$GEO)
