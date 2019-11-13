a <- 5
#ctrl+ enter - okamzite spusteni prikazu
#help: search engine a keywords - vyhledavani

mean
#tabulátor - tabulka s prikazy, f1- napoveda
mean(a)
#ctrl + l - promazani console
#ctrl +shift+ c - z radku vytvori poznamku
#zkratky - help keyboard shortcuts
# ls() vypíše promìnné
#true - T, false - F
#print vypíše urèitou promìnou
#rm() vymaze promennou, rm(list=ls()) smaze vse
#getwd() vypíše pracovní adresáø
#rozlisovat velká a malá písmena
#pozor na prepsani promenne
#lepsi nez rovnitko pouzivat sipku pri zadavani promenne, v ramci funkce je lepsi rovnitko
#vektor je radek cisel nebo pismen(atributu), matici s toho udelame pridanim vice radku, pole 
#text se dava do uvozovek
#str() vypise strukturu promenne
#vektor pomoci prikazu c()
#pokud dame cely prikaz do zavorky, tak se hned vypise
#vec<-10:15 vypise cisla od 10 do 15
# vec[] vyhledavani zaznamu,podminky, vec[c()]
#%in% je zaznam ve vektoru? 5%in% vec
#== testovani pro kazde zvlast, procenta to ukazou shrnute
#podobne funguje funkce match
#matrix matice, ridime se podle tabulatoru
#byrow jde po radcich, normalne jde po sloupcich
#dim() uda kolik ma matice radku a sloupcu
#matrx[2,2] zaznam druheho radku druheho sloupce
#array pole
#datovy ramec data.frame(name=c("Matt", "Kate","Jacqiure","Simon","Nita"), age= c (20:24))
#dalsi vyhledavani : dimnames(), colnames radky, rownames sloupce
#dolar vypise 

#2.cviceni
#data() - vypise tabulku s daty
#insectsprays, warpbreaks- datové sady
#head() vypise prvni zaznamy, tail() vypise posledni zaznamy, n=3 zadame pocet zaznamu
#summary shrne data, charakteristiky statisticke, min, max, prumer, median, 1. a 3. kvartil
#aggregate seskupování aggregate(InsectSprays[,1],by=list(InsectSprays$spray), FUN=mean) (FUN=sum)
#zmena jmen sloupcu colnames(vrazdy)<-c("skupiny","pocet_mrtvych")
#zmena  jmen radku rownames
#faktor je oznaceni skupiny
#vypis podle parametru warpbreaks[warpbreaks$wool=="A",]  warpbreaks[warpbreaks$breaks<25,] 
#warpbreaks[warpbreaks$wool!="A",] vykricnik znamena vylouceni typu
#warpbreaks[warpbreaks$wool!="A" & warpbreaks$tension=="L",] vice podminek
#warpbreaks[warpbreaks$wool!="A" | warpbreaks$tension=="L",] bud a nebo
#warpbreaks[warpbreaks$wool!="H" | warpbreaks$tension=="L",]
#warpbreaks[warpbreaks$tension==%in% c("L","H"),] co to je?
#pridavani dalsich radku warpbreaks[,4]<-0
#procenta 100*warpbreaks[,1]/sum(warpbreaks[,1])
#pojmenovani konkretniho radku  colnames(warpbreaks)[4]<-"percentage"
#seznamy
#list() jedny závorky [] vypise, [[]] primo do hodnoty
#sort seøazení sort(vec, decreasing=T) naopak serazeni, letters pismena
#df[order(df$name),] serazeni

#cviceni 3
#nejlepsi formaty pro nahravani jsou .txt a .csv 
#nahravani s exelu read.xlsx library("xlsx") sesit<-paste(getw(),"Eurostat_data.xlsx", sep="/") pop<-read.xlsx(sesit,"population") 
#nahravani pres import dataset
#odstraneni vybranych sloupcu a prepsani tabulky  nezam<-nezam[,-c(3,5,7)] 
#nezam.total<-nezam[,1:2] vybrani urcitych sloupcu, pop.2012<-pop[,c("GEO","X2012")]
#vypsani urciteho radku crime.2012[crime.2012$GEO=="Scotland",2]
#secteni hodnot UK<-crime.2012[crime.2012$GEO=="Scotland",2]+crime.2012[crime.2012$GEO=="England and Wales",2]+crime.2012[crime.2012$GEO=="Northern Ireland (UK)",2]
#crime.2012[,1] <-as.character(crime.2012[,1]) struktura na text 
# na cisla crime.2012[,2]<-as.numeric(crime.2012[,2]) 
# nez.crime<-merge(nezam.total, crime.2012, by="GEO", all=T) zachovat vse
#spojeni vice tabulek nez.crime<-merge(nezam.total, crime.2012, by="GEO") nebo nez.crime<-merge(nezam.total, crime.2012, by.x="GEO", by.y="GEO")

#cviceni 4
#write.table da data do textaku
#prumer bez dat bez ciselne hodnoty mean(data.2012[,2], na.rm=TRUE)
#mean(data.2012[,2], trim=0.1,na.rm=T) trim orizne extremni hodnoty
#prumer(jine funkce) pro kazdy sloupec zvlast nelze, pouze za pouziti sapply(data.2012[,2:5],FUN=mean, na.rm=T)
#attach(data.2012) po pouziti se muzeme odkazovat hned na nazvy sloupce, pouziva se pri pouzivani jedne tabulky, s vice by mohl byt problem
#data.2012$n hned vypise data o sloupci, staci jen pismeno misto nazvu
#quantile(nezamestnanost, na.rm=T) kvantily, rozdeli na casti
#quantile(nezamestnanost, na.rm=T, probs=c(0.1,0.2,0.3)) na kolik to chci casti
#vygeneruje radu seq(0,1,0.1) .. vytvori decily
#library(lst), funkce modus modeOf(nezamestnanost, na.rm=T), frekvence hodnot maxFreq(data.2012[,2], na.rm=T)
#modeOf(round(data.2012[,2]), na.rm=T) nejcastejsi nezamestnanost, maxFreq(round(data.2012[,2]), na.rm=T) v kolika statech
#min min(data.2012[,2],na.rm=T) a max max(data.2012[,2],na.rm=T), rozsah range(data.2012[,2],na.rm=T)
#IQR(data.2012[,2],na.rm=T) mezikvartilove rozpeti
#var(nezamestnanost,na.rm=T) variace, smerodatna odchylka sd(nezamestnanost,na.rm=T)
#prumerna absolutni odchylka aad(data.2012[,2],na.rm=T), median absolutni odchylky mad(data.2012[,2],na.rm=T)
#library(e1071) sikmost skewness(data.2012[,2], na.rm=T), spicatost kurtosis(data.2012[,2], na.rm=T)
#souhrn vseho summary(data.2012), jen 5 hodnot  fivenum(data.2012[,2], na.rm=T)
#knihovna psych, funkce describe, describeBy

#cviceni 5
#attach, pracuje pouze s nazvy sloupcu
#graf x y: plot(nezamestnanost, kriminalita_pop, xlab="Nezamestnanost (%)",ylab="
#Trestne ciny na 10 000 obyvatel", main="Vztah mezi nezamestnanosti a kriminalitou \n v roce 2012")
#\n odsazuje na dalsi radek
#pch="*" nebo pch=10 (kod), zmeni body v grafu
#col="green", zmeni barvu bodu, light, dark
#RColorBrewer .. barvy balik
#type="p" (l,b,s,h,..) ..typ vykresleni grafu
#pch="" , prazdny graf
#text(nezamestnanost, kriminalita_pop, data.2012[,1]) text misto bodu
#velikost pisma cex=0.5
#regrese: lm <- lm(kriminalita_pop ~ nezamestnanost, data = data.2012)
#summary(lm)
#abline(lm, col = 'red')
#sloupcovy graf
#barplot(kriminalita_pop, main="Pocet trestnych cinu na 10 000 obyvatel",
#col=rainbow(20), names.arg=GEO)
#zmena popisku text(cex=0.7, x=x-0.25,y=2.25, as.character(GEO),xpd=T,srt=90,adj=1.04)
#histogram: hist(log(populace), nclass=10)
#hustotni funkce density(populace), plynule prechody
# histogram frekvence hist(populace, nclass = 8, freq = F, col = 'light blue'), hustotni fce: lines(d,col="orange",lty=2)
#ulozeni grafu export-save as
#boxplot: bowplot(populace)
#srovnani boxplot(data.2012[,2:5])
#skalovani boxplot(scale(data.2012[,2:5]), notch=T), summary(scale(data.2012[,2:5]))
#qqplot srovnani kvantilu, pravdepodobnostni rozdeleni.. qqnorm(kriminalita_pop)
#linie: qqline(kriminalita_pop, col="orange")
# qqnorm(log(kriminalita_pop)), qqline(log(kriminalita_pop), col="orange")
#knihovna qualityTools .. qqPlot(log(kriminalita_pop))
#log logaritmus.. zlogaritmujeme
#kolacovy graf
#pie(na.omit(data.2012[,4]))
#data.pop <- na.omit(data.2012[order(data.2012$populace, decreasing=F),])
#pie(data.pop$populace, init.angle=90, radius = 1, labels = data.pop$GEO)
#teckovy graf
#dotchart(kriminalita_pop, cex = 0.7, labels = GEO)
#serazeni dat ord<-data.2012[order(data.2012$kriminalita_pop),], dotchart(ord[,5], cex = 0.7, labels = ord$GEO)
#median a prumer abline(v=c(median(kriminalita_pop, na.rm=T), mean(kriminalita_pop, na.rm=T)),col=c("orange","blue"),lty=3)
#violin plot

##TESTOVANI HYPOTEZ##
##shapiro
#slouzi k urceni normality
#shapiro.test(data[,2]), shapiro.test(EarlyLeavers[,2])
#nulova hypoteza- data maji normalni rozdeleni (vetsi nebo rovno 0,05, nelze zamitnout nulovou hypotezu)
#alternativni hyp.-nemaji normalni rozdeleni

##test shody rozptylu (f-test)
#srovnava dva rozptyly
#var.test(data[,2],data[,3]), var.test(data[,4],data[,5])
#nulova-rozptyly jsou shodne, alternativni-rozptyly jsou ruzne

##t-testy 
#shoda strednich hodnot, podobnost prumeru skupiny
#meli by mit normalni rozdeleni
#jednovyberovy- srovnavam konktretni datavou sadu s predem urcenym prumerem
#dvouvyberovy- srovnavam jednu datovou sadu s druhou (dva nezavisle vybery)
#parove vybery- porovnavame datovou sadu v ruzna obdobi, mereni je zavisle, tvori par
#jednostrane, oboustranne testovani- sledujeme rovnost, nerovnost

#jednovyberovy
#skutecna produktivita v danych statech souhlasi s prumerem 
#t.test(data$produktivita_00, mu=100) je ruzne od sta, zamitam nulovou, t.test(data$produktivita_12, mu=100) je stejne

#t.test(data$produktivita_00, mu = 100, alternative='less') mensi nez 100, potvrzena alternativni
#t.test(data$produktivita_12, mu = 100, alternative='less') mensi nez 100, potvrzena nulova,neni vyznamne mensi nez 100

#dvouvyberovy
#meli by byt nezavisle
#pokud neni parovy, muzeme mit ruzny pocet dat v kazde sade
#t.test(data$nezamestnanost_00, data$nezamestnanost_12), jsou shodne, nulova hypoteza

#parovy test
#t.test(data$nezamestnanost_00, data$nezamestnanost_12, paired=T) nezamestnanost v roce 2000 a 2012 muze byt povazovana za stejnou
#t.test(data$produktivita_00, data$produktivita_12, paired=T) data jsou odlisne

##neparametricke testovani
#Mann-whitney - nezavisle hodnoty
#wilcoxuv test - v pripade paroveho testovani
#wilcox.test(EarlyLeavers$Men, EarlyLeavers$Women) alternativni hypoteza, jsou ruzne
#wilcox.test(EarlyLeavers$Men, EarlyLeavers$Women, alternative="greater") odchazi vic muzu nez zen?, alternativni hypoteza, vice muzu odchazi
#wilcox.test(EarlyLeavers$r2013, EarlyLeavers$Target) splnili svuj dany cil, prospech nulove hypotezy
#nejsou tak prukazne jako parametricke testy

#parovy test
#wilcox.test(EarlyLeavers$Men, EarlyLeavers$Women, paired = T) odchod muzu a zen je rozdilny
#wilcox.test(EarlyLeavers$r2005, EarlyLeavers$r2013, alternative = 'less', paired = T) rozdil mezi lety
#wilcox.test(EarlyLeavers$r2005, EarlyLeavers$r2013, alternative = 'greater', paired = T) alternativni hypoteza

#cviceni
#summary(lm(log(kriminalita_pop)~nezamestnanost, data=data.eu))
#lm3<-lm(log(kriminalita_pop)~nezamestnanost+I(nezamestnanost^2)+I(nezamestnanost^3), data=data.eu)
#step(lm3) krokova regrese, zjednoduseni, vypise co neni dulezite   

#pred praci vykreslit data (plot) a pouzit attach

##korelace##
#cor(nezamestnanost, kriminalita_pop), cor(kriminalita_pop, nezamestnanost) .. stejny vysledek
#cor(data.eu[,-1]) korelacni matice
#vyznamnost korelace, korel. test.. cor.test(kriminalita,populace)
#p-value .. hladina spolehlivosti testu .. porovnavame s 5 % (dané) a z toho zjistime jestli plati nulová 
#(pokud je p-value vetsi nez 0,05, pak korelace neni vyznamna) nebo alternativní hypoteza (pokud je hodnota mensi nez 0,5) 
#0.05 vysledek je presny na 95 %, 0.01 vysledek je presny na 99%, ...
#cor.test(nezamestnanost, kriminalita_pop, conf.level=0.9) zmenime tim presnost na procenta
#metody korelaci: cor(kriminalita, populace, method=c("pearson")) (pocita s normalnimi hodnotami)
#cor(kriminalita, populace, method=c("spearman")) (prirazuje hodnotam poradi, malo dat, neni normalni rozdeleni)
# cor(kriminalita, populace, method=c("kendall")) (koeficient shody)

##regrese##
## podminky regrese
# Normální rozdìlení závislé promìnné
# Vzájemná nezávislost závislé promìnné - bez autokorelace (zavislost mezi jednim prvkem (sama sebe), prvek je akorat posunuty)
# Smysluplna linearita vztahu
# Homoskedasticita – konstantní rozptyl, který je nezávislý na parametrech

#test normalniho rozdeleni: shapiro.test(kriminalita), nulova hypoteza.. maji normalniho rozdeleni (vetsi nez 0.5)
#, alternativni.. nemaji normalni rozdeleni (mensi nez 0.5)
#transformace na normalni rozdeleni: shapiro.test(log(kriminalita))

##linearni regrese## 
#lm(kriminalita_pop~nezamestnanost,data=data.eu), lm(nezamestnanost~kriminalita_pop,data=data.eu) neni stejny vysledek, zalezi na poradi
#ulozime si regresi a pouzijeme na ni summary (cisla udavaji zavislosti, hvezdicky dulezitost)
#abline(limn,col="red") vykresli primku do grafu plot(kriminalita_pop~ nezamestnanost, pch="*"),  plot(nezamestnanost, kriminalita_pop, pch="*")
#kriminalita_pop-limn$fitted.values vyfitované hodnoty
# points(nezamestnanost,limn$fitted.values, col="blue") vykresleni pomoci bodu
#par(mfrow=c(2,2)) par model, rozdeli graf na vice casti
#par(mfrow=c(1,1)) vrati do puvodniho stavu

##predikce##
#predict(linm) totez jako fitted.values
#interval spolehlivosti, predict(linm, interval="confidence"), confidencni interval
#plot(kriminalita_pop~nezamestnanost, pch="*") puvodni mereni
#odhad mereni, vyfitovane hodnoty points(data.eu$nezam, linm.pred[,"fit"],col="red")
#points(data.eu$nezam, linm.pred[,"lwr"],col="blue",pch="-") minimalni dolni odhad
#points(data.eu$nezam, linm.pred[,"upr"],col="blue") horni odhad
#novy datovy ramec new<-data.frame(nezamestnanost=1:30)
#pred.new<-predict(linm, newdata=new,interval="confidence") predikce ramce (nezamestnanost do 30%)
# novy podobne akorat s logaritmem  loglinm<-lm(log(kriminalita_pop)~nezamestnanost,data=data.eu) a opakujeme cele vykresleni

##kvadraticka regrese##
#logkvm <- lm(log(kriminalita_pop) ~ nezamestnanost + I(nezamestnanost^2), data = data.eu) zlepsila se presnost
#logkvm.pred<-predict(logkvm,interval="confidence") predikce
#znovu vykreslime plot(log(kriminalita_pop)~nezamestnanost, pch="*"), plot(log(kriminalita_pop)~nezamestnanost, pch="*"), atd.

##kubicka regrese##
#logkum<-lm(log(kriminalita_pop)~nezamestnanost + I(nezamestnanost^2)+I(nezamestnanost^3),data=data.eu)
# pred.logkum<-predict(logkum,interval="confidence") a znovu vykreslime

##cviceni
#summary(lm(log(kriminalita_pop)~nezamestnanost, data=data.eu))
#lm3<-lm(log(kriminalita_pop)~nezamestnanost+I(nezamestnanost^2)+I(nezamestnanost^3), data=data.eu)
#step(lm3) krokova regrese, zjednoduseni, vypise co neni dulezite   

#data by mìla mít normální rozdìlení
#geo.data<-as.geodata(data,coords.com=1:2,data.col=3) geodata, souøadnice, konkretni hodnoty
#summary(geo.data) vzdalenosti, shrnuti
#points(geo.data) zobrazeni geodat
#points(geo.data,cex.min=1,cex.max=4, col="gray") prumery kolecek, barvy
#points(geo.data, trend="1st", abs=T, col="gray", cex.max=3)
#plot(geo.data,lowess=TRUE)
#variogram-konkretni popis dat, do jake vzdalenosti ma smysl modelovat, v jake vzdalenosti se body vzajemne ovlivnuji
#plot(variog(geo.data, option = 'cloud')) pro vsechny dvojice je vypocitana semivariace
#variogram  <- variog(geo.data) agregovana verze "cloudu", variogram empiricky, vychazi z pozorovani, nelze z nej udelat kriging
#vyber modelu, fitovani(napasovani teoretickeho modelu variogramu), sledujeme kde dochazi ke zlomu,kde je prah, vzdalenosti a silu vztahu mezi body
#varfit <- variofit(variogram, nugget = 50, max.dist = 600)
#varfit.g <- variofit(variogram, cov.model = 'gau', nugget = 50, max.dist = 600) urceni vlastniho modelu
#eyefit, nafitovani od oka eyefit <- eyefit(variogram), v novem okne si to upravime podle sebe
#porovnani eyefit a varfit lines(eyefit, col="green"),lines(varfit, col="red")
#sledujeme jestli data nejsou vyrazne smerove ovlivnena var4 <- variog4(geo.data)
#kriging
#rozsah mrizky loci<-expand.grid(seq(4950,5970,b=10),seq(4820,5730,b=10))
#ktery teoreticky model kc<-krige.control(obj.model=varfit)
#samotny kriging kriging<-krige.conv(geo.data, loc=loci, krige=kc)
#struktura krigingu str(kriging)
# zobrazeni krigingu image(kriging)
#izolinie contour(kriging,add=T) add znamena ze se prida do predchozi vrstvy, jinak se da zvlast
# s legendou contour(kriging,filled=T)
#ruzne palety image(kriging,col=terrain.colors(15))
#image(kriging,col=rainbow(15))
#image(kriging,col=heat.colors(15))
#image(kriging,col=rev(heat.colors(15))) opacne barvy
#image(kriging,val=kriging$krige.var) chyba, odchylka
#odmocnena odchylka image(kriging,val=sqrt(kriging$krige.var))
#contour(kriging,val=sqrt(kriging$krige.var),add=T)
#variogram s trendem variogram.t<-variog(geo.data,trend="1st"), varfit.t <- variofit(variogram.t, nugget = 55, max.dist = 320)
#lines(varfit.t,col="red")
#kriging s trendem kriging.t <- krige.conv(geo.data, loc = loci, krige = krige.control(obj.model = varfit.t))
#image(kriging.t, col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.t, add = T)
#data maji trend, nemaji normalni rozdeleni
#shapiro.test(geo.data.n$data), shapiro.test(log(geo.data.n$data)) zlogaritmovane
#geo.data.n$data<-log(geo.data.n$data), plot(geo.data.n,lowess=T)
#plot(geo.data.n,lowess=T, trend="1st") s trendem
#variogram.vt<-variog(geo.data.n,trend="1st")
#varfit.vt<-variofit(variogram.vt,nugget=55,max.dist=350)
#lines(varfit.vt,col="red")
#kriging.vt <- krige.conv(geo.data.n, loc = loci, krige = krige.control(obj.model = varfit.vt))
#summary(data$volume2),summary(kriging.vt$predict)
#image(kriging.vt, col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.vt, add = T)
#image(kriging.vt, val = exp(kriging.vt$predict), col=rev(heat.colors(10, alpha= 0.5))); contour(kriging.t, val = exp(kriging.vt$predict), add = T)
#puvodni rozsah
#http://www.gisportal.cz/2013/05/jak-vybrat-spravny-graf-ci-diagram/