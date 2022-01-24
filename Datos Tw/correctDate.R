library(tidyverse)
library(datos)
library(readxl)
library(data.table)

mis_paises <- datos::paises
#seleccionar fila
mis_paises %>% 
  select (pais,anio, pib_per_capita)
#se lee de atras para adelante

#una condicion de true o false y me muestra dicho filtro
paises %>%
  filter(pais == "Argentina") %>%
  select(pais,anio,pib_per_capita) %>% View
#solo la fila pais
      
mis_paises %>%
  filter(pais == "Brasil") %>%
  select(esperanza_de_vida) %>% View


mis_paises %>%
  arrange(poblacion) %>% View
#por defecto de menor a mayor

mis_paises %>%
  arrange(desc(poblacion)) %>% View()
#desc ordena de mayor a menor

mis_paises %>%
  arrange(pib_per_capita) %>% View

#ya para terminar y combinar todo


mis_paises %>%
  filter(pais == "Argentina") %>%
  select(pib_per_capita, anio) %>% View()


mis_paises %>%
  filter(continente == "Europa") %>%
  arrange(desc(poblacion)) %>%
  select(pais, anio, poblacion) %>% View()
