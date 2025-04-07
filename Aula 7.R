# AULA 7: USANDO IA PARA FAZER GRÁFICOS

# No chat GPT, peça o que quer que seja feito.

# Meu texto: Usando a biblioteca WDI, coletam-se estes dados (em painel):

# DADOS EM PAINEL
# dadospib <- WDI(country = 'all',
#                indicator = 'SE.XPD.CPRM.ZS')
 
# 1) Faça um gráfico moderno apresentando a evolução dos gastos com educação 
# primária no Brasil desde o ano 2000 até onde se tem registro
# 2) Adicione um título adequado ao gráfico
# 3) Faça um degradê de azul onde os tons mais claros representam os valores mais 
# 4) baixos
# 5) No Eixo X deve conter o ano e no eixo Y deve conter os valores
# 6) Quero o gráfico em formato de barras

# DADOS EM PAINEL: Evolução dos gastos com educação primária no Brasil

# Carregar pacotes
library(WDI)
library(dplyr)
library(ggplot2)

# Baixar os dados de despesa corrente no ensino primário (% do gasto governamental)
dadospib <- WDI(country = 'all',
                indicator = 'SE.XPD.CPRM.ZS',
                start = 2000)

# Filtrar Brasil e remover valores ausentes
dados_brasil <- dadospib %>%
  filter(country == "Brazil", !is.na(SE.XPD.CPRM.ZS))

# Gráfico moderno com degradê de azul
ggplot(dados_brasil, aes(x = year, y = SE.XPD.CPRM.ZS, fill = SE.XPD.CPRM.ZS)) +
  geom_col() +
  scale_fill_gradient(low = "#cce5ff", high = "#004080") +
  labs(
    title = "Evolução dos Gastos com Educação Primária no Brasil (2000 - Último Registro)",
    x = "Ano",
    y = "% do Gasto Total do Governo",
    fill = "% Gasto"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10))
  )

# CORTE TRANSVERSAL: Comparação da evolução dos investimentos em educação primária entre Brasil e Japão

# Obter os dados para Brasil e Japão em 2010
dados_corte <- WDI(country = c("BR", "JP"),
                   indicator = "SE.XPD.CPRM.ZS",
                   start = 2010, end = 2010)

# Renomear os países para o gráfico
dados_corte$country <- recode(dados_corte$country,
                              "Brazil" = "Brasil",
                              "Japan" = "Japão")

# Gráfico roxo de comparação
ggplot(dados_corte, aes(x = country, y = SE.XPD.CPRM.ZS, fill = SE.XPD.CPRM.ZS)) +
  geom_col(width = 0.6) +
  scale_fill_gradient(low = "#e0ccff", high = "#5e2a84") +
  labs(
    title = "Despesa Corrente com Educação Primária (% do Gasto Governamental) – 2010",
    x = "País",
    y = "% do Gasto Total do Governo",
    fill = "% Gasto"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10))
  )

# SÉRIE TEMPORAL: Ano que mais e que menos houve investimento em educação primária no Brasil

# Obter os dados do Brasil
dados_brasil <- WDI(country = "BR", indicator = "SE.XPD.CPRM.ZS", start = 2000, end = 2023)

# Renomear colunas
dados_brasil <- dados_brasil %>%
  rename(gasto = SE.XPD.CPRM.ZS, ano = year)

# Filtrar os anos de maior e menor investimento
extremos <- dados_brasil %>%
  filter(gasto == max(gasto, na.rm = TRUE) | gasto == min(gasto, na.rm = TRUE))

# Gráfico de barras com tons de rosa
ggplot(extremos, aes(x = factor(ano), y = gasto, fill = gasto)) +
  geom_col(width = 0.6) +
  scale_fill_gradient(low = "#fcd6e2", high = "#c71585") +
  labs(
    title = "Anos de Maior e Menor Investimento em Educação Primária – Brasil",
    x = "Ano",
    y = "% do Gasto Total do Governo",
    fill = "% Gasto"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10))
  )