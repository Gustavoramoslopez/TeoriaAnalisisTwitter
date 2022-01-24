library(rtweet)
library(tidyverse)

tw_albert <- search_tweets(q = "alberto fernandez",n = 200)
View(tw_albert)

tw_covid <- search_tweets(q = "covid19",n = 200)
View(tw_covid)

#vista rapida de todos los datos
tw_albert %>% glimpse
tw_covid %>% glimpse


#filtrar por lenguaje español
tw_covid_es <- tw_covid %>% filter(lang == "en")
View(tw_covid_es)



#contar los tweet que subio cada uno
tw_covid_es %>%
  count(screen_name) %>%
  arrange(desc(n)) #ordena al inverso las veces que aparece, de mayor a menor
  #View()

#lo mismo mas largo, encierro todo en un grupo y lo cuenta las n veces
tw_albert %>%
  group_by(screen_name)%>%
  summarise(numero_de_tweets_hechos = n())
