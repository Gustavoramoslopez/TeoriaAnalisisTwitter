library(datos)
library(tidyverse)

dt <- datos::presidencial

dt %>% View()


dt_uno <- dt %>% group_by(partido) %>%
  filter(partido == "Demócrata")

View(dt_uno)


dt_dos <- dt %>% group_by(partido) %>%
  filter(partido == "Republicano")

View(dt_dos)


dt %>% count(nombre)
dt %>% count(partido) 
#################################################33


dt2 <- datasets::Titanic
View(dt2)


dt2 %>% count(Sex)
