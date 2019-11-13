#prejmenovani
colnames(pop.2012)[2] <- "populace" 

#vyber sloupcu
crime.2012 <- Crimes[,c("GEO","X2012")]

# vyber sloupce
crime.2012[,2]

#vyber radek jehoz hodnota je "Scotland" a jeho druhy sloupec
crime.2012[crime.2012$GEO == "Scotland",2]
crime.2012[crime.2012$GEO == "Northern Ireland (UK)",2]
crime.2012[crime.2012$GEO == "England and Wales",2]

#secteni
crime.2012[crime.2012$GEO == "Scotland",2] + crime.2012[crime.2012$GEO == "Northern Ireland (UK)",2] + crime.2012[crime.2012$GEO == "England and Wales",2]

# struktura tabulky
str(crime.2012)

# funkce menici datovy typ as.character() - prepise datovy typ na text 

crime.2012[,1] <- as.character(crime.2012[,1])

#pridani radku cislo 49 a jeho "naplneni"
crime.2012[49,] <- c("United Kingdom", UK)

#prevedeni na numericky format
crime.2012[,2] <- as.numeric(crime.2012[,2])

#spojeni datovych sad
nez.crime <- merge(nezam.total, crime.2012, by = "GEO")

#prepocet na 10 000 obyvatel (vytvoreni sloupce)
data.2012[,5] <- 10000*data.2012$kriminalita/data.2012$populace