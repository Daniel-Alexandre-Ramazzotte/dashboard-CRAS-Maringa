# dashboard-CRAS-Maringa

## Planejamento

Shiny tem problemas de acesso simultâneo

solução inicial: implementar docker + golem na produção 
escalonamento: implementação de async, + cache estrtuturado + servidor melhor + dockerização com Kubernetes

Implementação do shiny com uma autenticação dos funcionários com a lib auth0

Implementação de uma página de inserção de dados (após definir como serão armazenados, bd ou arquivo de planilha) e consequente sistema hierárquico para permitir que apenas pessoas autorizadas alterem ou acrescentem dados

REFS DE GOLEM:
- https://rstudio.github.io/cheatsheets/golem.pdf
- https://engineering-shiny.org/
- https://golemverse.org/packages/

## Demandas

POR TERRITÓRIO DE CRAS
•	1 mapa com distribuição de pontos de cadastro e pontos de instituições
•	1 mapa de concentração de cadastro
•	1 tabela com dados obtidos a partir do censo 2022 e do banco de dados do CadÚnico,
•	1 Gráficos de faixas etárias / Pirâmide etária
•	1 Gráficos de sexo 
•	1 Gráficos de renda
•	1 gráfico com série histórica de Famílias cadastradas
•	1 gráfico com série histórica de Cadastros desatualizados
•	1 gráfico com série histórica com Cadastros em descumprimento de condicionalidade


COMPARATIVO ENTRE TERRITÓRIOS DE CRAS
Gráficos


•	Gráfico - Idosos
•	Gráfico - Beneficiários PBF
•	Gráfico - Beneficiários BPC
•	Gráfico - Descumprimento de condicionalidade
•	Gráfico - Cadastros desatualizados


GRÁFICOS (para cadaCRAS) – série histórica


1. Faixas de renda (CadÚnico):

2. Faixas etárias / Pirâmide etária (CadÚnico):

3. Sexo (CadÚnico):

4. Famílias cadastradas no CadÚnico: Evolução desde julho de 2023
•	Periodicidade: a cada 4 (quatro meses): 01/março; 01/julho; 01/novembro; 

5. Cadastros desatualizados: (pizza? Cadastrados/desatualizados? )
•	Periodicidade: a cada 4 (quatro meses): 01/março; 01/julho; 01/novembro; 

6. Cadastros em descumprimento de condicionalidade:
•	Periodicidade: a cada 4 (quatro meses): 01/março; 01/julho; 01/novembro;
•	Por condicionalidade: saúde, educação e atualização cadastral




GRÁFICOS (Comparativos entre CRAS)
Idosos
Beneficiários PBF
Beneficiários BPC
Descumprimento de condicionalidade
Cadastros desatualizados

## Exemplos

Duas plataformas que acesso vez ou outra, me parecem interessantes como possibilidade de "inspiração":
1.	o Atlas Brasil (http://www.atlasbrasil.org.br/perfil/municipio/411520)
2.	Mapa OSCs do IPEA (https://mapaosc.ipea.gov.br/mapa)

## Obs

1.	seria essencial ter recursos de visualização dos dados geográficos (pontos e áreas) que serão georreferenciados a priori, basicamente, os dados do CadÚnico, os territórios e as instituições. Ter possibilidade de ver um mapa de densidade de cadastros por território também seria importante. Um exemplo, está no anexo.
2.	Segundo: Capacidade para gerar e visualizar dados agregados por território de CRAS em tabelas e gráficos, ao lado ou abaixo do mapa.
3.	Terceiro: geração de relatórios pdf com dados de cada território e comparativo entre eles.
4.	Quarto: ter uma forma de entrada dos dados georeferenciados de forma fácil, para que isto possa ser feito na Secretaria. Com isso, imagino eu, o sistema, que já terá toda a programação para produzir os indicadores a partir do banco de dados, fará os cálculos e agregações, permitindo obter o perfil geral de cada território.
Duas plataformas que acesso vez ou outra, me parecem interessantes como possibilidade de "inspiração":
1.	o Atlas Brasil (http://www.atlasbrasil.org.br/perfil/municipio/411520)
2.	Mapa OSCs do IPEA (https://mapaosc.ipea.gov.br/mapa)

O importante, no final é: viabilizar a obtenção automática (após lançar as bases já georreferenciadas e padronizadas, claro) daquelas informações por território, em três recursos básicos: mapas, tabela e gráficos.
