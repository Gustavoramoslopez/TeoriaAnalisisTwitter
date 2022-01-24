library(datos)
library(tidyverse)
library(readxl)
library(data.table)

mis_paises <- datos::paises

mis_paises %>%
  group_by(continente) #seleccion el grupo
  

mis_paises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  summarise(pob_continente = sum(poblacion)) %>%#crea una fila de pob total, 
  #y muestra los 5 resultados unicamente
  ungroup() #cierra el grupo


mis_paises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  mutate(pob_continente = sum(poblacion)) %>% #crea una nueva fila,
  #pero se repite por cada pais/continente
  ungroup() 


#ASI SE SUMAN LOS CONTINENTES
mis_paises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  summarise(pob_continente = sum(poblacion)) %>%
  ungroup() %>%
  mutate(pob_mundial = sum(pob_continente))
#asi las suma, crea una fila y la repite para los distintos continentes



#Sacamos el numero percentual de cada uno
mis_paises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  summarise(pob_continente = sum(poblacion)) %>%
  ungroup() %>%
  mutate(pob_mundial = sum(pob_continente)) %>%
  mutate(perc_pob_mundial = pob_continente/pob_mundial*100) %>%
  arrange(desc(perc_pob_mundial))
