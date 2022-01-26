library(rtweet)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(wordcloud)

#install.packages("lubridate")
library(lubridate)
#Fechas y horas simplificadas con lubridate

usuario <- "Alferdez"

#busco los favs que puso esa cuenta
favorites <- get_favorites(user = usuario, n = 500)



#info de las cuenttas que puso fav
us_data_albert <- users_data(favorites)


us_data_albert_anio <- us_data_albert %>% 
  distinct(user_id, account_created_at) %>%  #devuelve sin repetir use, created
  select(account_created_at) %>% #selecciono columna
  mutate(anio = account_created_at %>% format("%Y")) %>%
  count(anio) #cuento las cuentas creadas en cada año


#distinct solo devuelve elementos unicos, si hay 2 lineas iguales
#devuelve solo una

#en mutate, muto nueva variable con la columna,y formateo su fecha para usar año
#como ya es un dato fecha solo cambio que fecha uso, no hace falta hacerlo fecha

us_data_albert %>% glimpse  #para ver tipos de datos de columna entre otras


#################     GRAFICAR

p <- ggplot(data = us_data_albert_anio,
            mapping = aes(x = anio,
                          y = n))
p <- p + 
  geom_bar(stat = "identity") +
  labs(tittle = "Cuentas por año",
       x = "Año",
       y = " # de cuentas creadas",
       subtitle = "Alferdez") 
p
