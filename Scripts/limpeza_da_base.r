library(tidyverse)
library(readxl)
library(hunspell)

dados <- read_excel("bases/CONT.CADUNICO.FAM.TOTAL..xlsx")

dados <- dados %>%
  mutate(across(where(is.character), ~ na_if(., "#N/D")))

dados <- dados %>%
  mutate(
    min = as.numeric(str_replace(str_extract(`Faixa de renda per capita da fam?lia`, "\\d+([,\\.]\\d+)?"), ",", ".")),
    max = as.numeric(str_replace(str_extract(`Faixa de renda per capita da fam?lia`, "(?<=a R\\$)\\d+([,\\.]\\d+)?"), ",", "."))
  )

# PROGRAMAR DICIONÁRIO EM PORTUGUÊS PARA CORRIGIR PALAVRAS

# DESCOBRIR O QUE CADA NA SIGNIFICA E DOCUMENTAR ISSO

# VERIFICAR E ARRUMAR OS TIPOS DE DADOS



view(dados)

