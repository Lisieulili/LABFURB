library(WDI) #CARREGAR A BIBLIOTECA/PACOTE

options(scipen = 999) # AJUSTA A NOT. CIET.

dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

# WDI é uma função do pacote WDI que acessa os dados da biblioteca
# Função "country" para escolher o país
# "Dados em Painel" -> vários locais e períodos

dadospib2023 <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD', start = 2023, end = 2023)

# dadospib2023 -> corte transversal

dadospibbr <- WDI(country = 'BR', indicator = 'NY.GDP.MKTP.CD')

# Exercícíos: Procure um dado de seu interesse no DataBank e execute o código

KoreaData <- WDI(country = 'KR', indicator = 'SG.VAW.BURN.ZS')

# AULA 6: FAZER GRÁFICOS

# Biblioteca mais importante para fazer dados: ggplot2 (faz parte do pacote tidyverse)

#install.packages("tidyverse")

library(tidyverse)

# DADOS EM PAINEL

grafpainel <- ggplot(dadospib, 
                     mapping = aes(y = NY.GDP.MKTP.CD, x = year)) + 
  geom_point()

print(grafpainel)

# CORTE TRANSVERSAL

grafcorte <- ggplot(dadospib2023, 
                     mapping = aes(y = NY.GDP.MKTP.CD, x = year)) + 
  geom_point()

print(grafcorte)

# SÉRIE TEMPORAL

grafserie <- ggplot(dadospibbr, 
                    mapping = aes(y = NY.GDP.MKTP.CD, x = year)) + 
  geom_line()

print(grafserie)

# DADOS EM PAINEL: COREIA

grafpainel <- ggplot(DataKorea, 
                     mapping = aes(y = SG.VAW.BURN.ZS, x = year)) + 
  geom_point()

print(grafpainel)

# CORTE TRANSVERSAL: COREIA

grafcorte <- ggplot(DataKorea, 
                    mapping = aes(y = SG.VAW.BURN.ZS, x = year)) + 
  geom_point()

print(grafcorte)

# SÉRIE TEMPORAL: COREIA

grafserie <- ggplot(DataKorea, 
                    mapping = aes(y = SG.VAW.BURN.ZS, x = year)) + 
  geom_line()

print(grafserie)
