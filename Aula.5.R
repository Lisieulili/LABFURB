# Atividades - Aula 5

# install.packages("WDI")

library(WDI)

options(scipen = 999)

# DADOS EM PAINEL
dados_obesidade <- WDI(country = 'all', indicator = 'SH.STA.OWAD.ZS')

# CORTE TRANSVERSAL
dados_obesidade_2000 <- WDI(country = 'all', indicator = 'SH.STA.OWAD.ZS', start = 2000, end = 2000)

# SÉRIE TEMPORAL
dados_obesidade_br <- WDI(country = 'BR', indicator = 'SH.STA.OWAD.ZS')

head(dados_obesidade)
