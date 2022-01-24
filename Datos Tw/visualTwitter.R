library(rtweet)
library(ggplot2)
library(tidyverse)

tw_albert <- search_tweets(q = "alberto fernandez", n = 100)


usuario = "RafaelNadal"
fv_albert <- get_favorites(user = usuario, n =400)
fv_albert %>% glimpse #vista rapida de datos




#ordenar datos
dat_top10 <- fv_albert %>% 
  count(screen_name) %>% #conteo de datos
  arrange(desc(n))%>% #esto con el tidyverse, orden mayo a menor
  head(5) #los primeros 10 nada mas

dat_top10

####visualiazcion

#mapping
p = ggplot(data = dat_top10,  #reorder ordena de menor a mayor, mas la n
           mapping = aes(x =reorder(screen_name,n), #mapping aes,es grafico x y
                         y = n,
                         col = usuario)) #rebordea las lineas

#geom  geometria, tipo de puntos

# p <- p + geom_point()  esto es un punto
?geom_bar
p <- p + geom_bar(stat = "identity",   # stat = igual a los datos
                  fill = "red3")   #da color a las barras

#labels titulos
p <- p + labs(title = "Usuarios que les gusta albert",
              x = "Usuarios",
              y = "num de likes")

#dibujar
 p + theme_classic()  #cambia el tema de fondo thmeme_ 
 
 
 
 
 
########################################################
#numero de favoritos por año
 
#install.packages("lubridate")
library(lubridate) #buen para trabajar con fechas

fv_nadal_fecha <- fv_albert %>% 
  mutate(fecha = ymd_hms(created_at)) %>% #creamos coloumna con ymd_hms, created at
  mutate(fecha = format(fecha, "%Y")) %>%  #selecciono la fecha a mostrar                                      
  select(created_at, fecha) %>%
  count(fecha)

#grafico

p <- ggplot(data = fv_nadal_fecha,
            mapping = aes(x = fecha,
                          y = n,
                          group = 1))

p <- p + geom_line()

p <- p + labs(title = "Fav por año",
                x = "Años",
                y = "Num de de favs",
                subtitle = "Rafael Nadal en Twitter")
p

