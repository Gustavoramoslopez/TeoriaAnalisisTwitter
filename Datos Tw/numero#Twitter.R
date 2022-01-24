#install.packages("tidytext")
#install.packages("tidyr")
library(rtweet)
library(tidytext)
library(tidyr)
library(tidyverse)


### hashtags mas comunes

tw_albert <- search_tweets(q = "alberto fernandez",n = 5000,
                          langs = "es",
                          include_rts = FALSE) # no incluye retweets



tw_albert_hashtags <- tw_albert %>% 
  unnest(hashtags)%>% ##donde hay mas de un # me repite la fila separandolos
  filter(!is.na(hashtags)) %>% #is.na me devuelve TRUE mas el !,me da lo que no es n/a
  mutate( hashtags = toupper(hashtags)) %>% #escribe todo en matuscula
  count(hashtags) %>%
  arrange(desc(n)) %>% #ordenar de mayor a menor
  head(20) 


is.na(NA) #SOLO ASI DA TRUE
!is.na(NA)# asi devuelve true cuando no son NA
!is.na("2")


if (2==3) {
  print("es verdad")
} else {
  print("no lo es")
}



#####  GRAFICAR

p <- ggplot(data = tw_albert_hashtags,
            mapping = aes(x = reorder(hashtags,n),#ordeno de izquierda a derecha
                          y = n))


p <- p + geom_bar(stat = "identity",  #igual a la info que le doy
                  fill = "red")    #color de barras

p <- p + coord_flip()#voltea las coordenadas poniendo la verticas en la horizontal
#las barras salen del costado

p <- p + labs(title = "# Mas Usados en Twitter",
          x = "# mas dichos",
          y = "num de veces",
          subtitle = "Alberto Fernandez")

p



