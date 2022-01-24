library(ggplot2)
library(tidyverse)
library(datos)
library(data.table)
library(readxl)

#
mis_paises <- datos::paises

base_ordenada <- mis_paises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  summarise(pob_continente = sum(poblacion)) %>%
  ungroup() %>%
  mutate(pob_mundial = sum(pob_continente)) %>%
  mutate(perc_pob_mundial = pob_continente/pob_mundial*100) %>%
  arrange(desc(perc_pob_mundial))


#
base_ordenada

#
p <- ggplot(base_ordenada,
            mapping = aes(x = continente,
                          y = perc_pob_mundial,
                          col = continente))
#
p <- p + geom_point()



#
p <- p + labs(tittle = "Percptual de la pob mundial",
              x = "continentes",
              y = "%")
print(p)
