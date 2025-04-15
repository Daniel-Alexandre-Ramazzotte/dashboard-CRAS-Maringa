library(tidyverse)
library(readxl)
library(hunspell)
library(stringi)

# PROCURAR UMA PK

# Pré-tratagem de dados no Excel anterior ao código seguinte

# Importa a base
dados <- read_excel("arquivos/bases/CONT.CADUNICO.FAM.TOTAL..xlsx")

# Conserta os Na
dados <- dados %>%
  mutate(across(where(is.character), ~ na_if(., "#N/D")))

# Tirar acentos dos nomes das colunas e deixar maiúscula so a primeria letra
names(dados) <- names(dados) |>
  stri_trans_general("Latin-ASCII") |>
  tolower() |>
  (\(x) paste0(toupper(substr(x, 1, 1)), substr(x, 2, nchar(x))))()

# Consertando os tipos de dados
dados$`Data de cadastramento da familia` <- as_date(dados$`Data de cadastramento da familia`, format = "%d/%m/%Y")
dados$`Data da ultima atualizacao da familia` <- as_date(dados$`Data da ultima atualizacao da familia`, format = "%d/%m/%Y")
dados$`Data da carga` <- as_date(dados$`Data da carga`, format = "%d/%m/%Y")
dados <- dados %>%
  mutate(`Existencia de sanitario` = recode(`Existencia de sanitario`,
                                  "Sim" = TRUE,
                                  "Não" = FALSE,
                                  "Não Informado" = NA),
         `Reside em reserva indigena`= recode(`Reside em reserva indigena`,
                                                "Sim" = TRUE,
                                                "Não" = FALSE,
                                                "Não Informado" = NA),
         `Familia quilombola` = recode(`Familia quilombola`,
                                       "Sim" = TRUE,
                                       "Não" = FALSE,
                                       "Não Informado" = NA),
         `Agua canalizada` = recode(`Agua canalizada`,
                                       "Sim" = TRUE,
                                       "Não" = FALSE,
                                       "Não Informado" = NA))

# Tirar da base de dados os acentos e deixar minusculo
dados[] <- lapply(dados, function(col) {
  if (is.character(col)) {
    stri_trans_general(col, "Latin-ASCII")
  } else {
    col
  }
})

dados
# Criando uma coluna com vetor de min e max de faixa de renda per capta

dados <- dados %>%
  mutate(
      min = as.numeric(str_replace(str_extract(`Faixa de renda per capita da familia`, "\\d+([,\\.]\\d+)?"), ",", ".")),
      max = as.numeric(str_replace(str_extract(`Faixa de renda per capita da familia`, "(?<=a R\\$)\\d+([,\\.]\\d+)?"), ",", "."))
  )

# Corrigir o NA, coloquei inf, porque é só maior que 660
max_corrigido <- ifelse(is.na(dados$max), Inf, dados$max)

# Combinar min e max corrigido em uma matriz 2 x n (ou lista de vetores)
vetores <- Map(c, dados$min, max_corrigido)
dados$`Faixa de renda per capita` <- vetores

dados[c("min", "max")] <- NULL



# Conserta Distribui??o
dados$`Forma de abastecimento de agua` <- gsub("\\?", "ca", dados$`Forma de abastecimento de agua`)

# Corringindo erro de importação
dados$`Nome do povo indigena`[11849] <- "KAYABI"


# DESCOBRIR O QUE CADA NA SIGNIFICA E DOCUMENTAR ISSO


