Pro dnešní cvièení využijte datovou sadu data.txt

S využitím základní statistiky, grafù, regrese a korelace popište datovou sadu (èíselné sloupce)

1. vypoèítejte a okomentujte základní statistické charakteristiky #min, max, mean, median, Q1 :Q3 (modus)
2. vytvoøte a interpretujte základní grafy #sloupcovy/histogram, Q-Q.plot, x-y graf (scatterplot),box plot,
3. zjistìte zda existuje mezi danými jevy závislost v jednotlivých letech #korelace, regrese 
4. kvantifikujte tuto závislost pomocní rovnice lineární regrese a zjistìte kvalitu modelu
5. zmìnil se vztah mezi obìma obdobími? Liší se vztah mezi nezamìstnaností a produktivitou v roce 2000 a 2012?

describe(data[,2:5], na.rm = T)

vars  n  mean    sd median trimmed   mad  min   max range  skew kurtosis   se
nezamestnanost_00    1 27  8.76  4.70   7.00    8.54  4.60  2.3  18.8  16.5  0.54    -1.00 0.90
nezamestnanost_12    2 27 10.57  5.15   9.90    9.86  4.00  4.3  25.0  20.7  1.33     1.45 0.99
produktivita_00      3 26 84.54 36.92  77.05   84.75 52.48 23.5 142.7 119.2 -0.06    -1.50 7.24
produktivita_12      4 27 92.84 33.61  86.30   91.62 37.95 44.1 176.8 132.7  0.43    -0.69 6.47


