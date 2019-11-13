setwd("D:/Skola/I-STGST/Cviceni/cvIX")

data <- read.delim("D:/Skola/I-STGST/Cviceni/cvIX/data.txt", dec=",")

#### test normálního rozdìlení ####
shapiro.test(data[,2])
sapply(data[,-1], shapiro.test)

#### F-test shody rozptylù ####
var.test(data[,2], data[,3])
var.test(data[,4], data[,5])

#############################################
############ Parametricke metody ############
#############################################
#### t-test o shodì støedních hodnot ####
#### jednostranné testy (<, menší nebo rovno, >, vìtší nebo rovno), oboustranné testy (=, nerovná se) ####
#### jednovýbìrový t-test - srovnání výbìru s pøedpokládaným prùmìrem ####
t.test(data$produktivita_00, mu = 100)
t.test(data$produktivita_00, mu = 100, alternative='less')

t.test(data$produktivita_12, mu = 100)
t.test(data$produktivita_12, mu = 100, alternative='less')

#### dvouvýbìrový t-test - srovnání støedních hodnot dvou nezávislých výbìrù ####
# považujeme výbìry za nezávislé, 27 nahodnych mest v polsku a nemecku
nezam_pl <- data$nezamestnanost_00; nezam_ge <- data$nezamestnanost_12
t.test(nezam_pl, nezam_ge)

pr_pl <- data$produktivita_00; pr_ge <- data$produktivita_12
t.test(pr_pl, pr_ge)

#### párový t-test - srovnání støedních hodnot dvou závislých výbìrù ####
t.test(data$nezamestnanost_00, data$nezamestnanost_12, paired = T)
t.test(data$produktivita_00, data$produktivita_12, paired = T)

t.test(data$produktivita_00, data$produktivita_12, paired = T, alternative = 'less')

#### ANOVA + Tukey HSD - analýza variance a vícenásobné porovnávání ####
#### zjišování rozdílù mezi více než dvìma skupinami, srovnání vnitro- a mezi-skupinového rozptylu ####
#### v pøípadì zamítnutí H0: µ1 = µ2 nerovná se µ3 nebo µ1 nerovná se µ2 = µ3 nebo µ1 nerovná se µ2 nerovná se µ3 ####

# rozdeleni do skupin
# data$skupina <- 1
# data[10:18,'skupina'] <- 2
# data[19:27,'skupina'] <- 3
# data$skupina <- as.factor(data$skupina)
# 
# anova <- aov(nezamestnanost_00 ~  skupina, data = data)
# summary(anova)
# 
# tukey <- TukeyHSD(anova)
# plot(tukey)
# 
# a <- quantile(data$nezamestnanost_00, probs=c(0.33, 0.66))
# data$skupina <- ifelse(data$nezamestnanost_00 < a[1], 1, ifelse(data$nezamestnanost_00 < a[2], 2, 3))
# data$skupina <- as.factor(data$skupina)
# 
# anova2 <- aov(produktivita_00 ~  skupina, data = data)
# summary(anova2)
# 
# tukey2 <- TukeyHSD(anova2); tukey2
# plot(tukey2)

#############################################
############ Neparametricke metody ##########
#############################################

EarlyLeavers <- read.delim("D:/Skola/I-STGST/Cviceni/cvIX/EarlyLeavers.txt", dec=",")

sapply(EarlyLeavers[,-1], shapiro.test)

#### Mann - Whitney test - srovnání shody rozdìlení dvou nezávislých souborù ####
#### neparametrická obdoba dvouvýbìrového t-testu ####
wilcox.test(EarlyLeavers$Men, EarlyLeavers$Women)
wilcox.test(EarlyLeavers$Men, EarlyLeavers$Women, alternative='greater')

wilcox.test(EarlyLeavers$r2013, EarlyLeavers$Target)

#### Wilcoxonùv test - pro párová pozorování, neparametrická obdoba párového t-testu ####
#### H0: medián rozdílù je 0 ####
wilcox.test(EarlyLeavers$r2005, EarlyLeavers$r2013, paired = T)
wilcox.test(EarlyLeavers$r2005, EarlyLeavers$r2013, alternative = 'less', paired = T)
wilcox.test(EarlyLeavers$r2005, EarlyLeavers$r2013, alternative = 'greater', paired = T)
wilcox.test(EarlyLeavers$r2013, EarlyLeavers$Target, paired = T)

#### Kruskal - Wallis test - neparametrická obdoba ANOVY ####
# EarlyLeavers$skupina <- 0
# 
# b <- quantile(EarlyLeavers$r2005, probs=c(0.33, 0.66))
# EarlyLeavers$skupina <- ifelse(EarlyLeavers$r2005 < b[1], 1, ifelse(EarlyLeavers$r2005 < b[2], 2, 3))
# EarlyLeavers$skupina <- as.factor(EarlyLeavers$skupina)
# 
# kruskal <- kruskal.test(r2005 ~  skupina, data = EarlyLeavers)
# kruskal
# 
# library(pgirmess)
# kruskalmc(r2005 ~  skupina, data = EarlyLeavers)
# 
# kruskal2 <- kruskal.test(r2013 ~  skupina, data = EarlyLeavers)
# kruskal2
# kruskalmc(r2013 ~  skupina, data = EarlyLeavers)
