# install.packages("rtweet")
library(rtweet)
library(ggplot2)
#creo una variable y almaceno 100 twits con la palabra alberto fernandez
tw <- search_tweets(q = "alberto fernandez",
                    n = 100)

View(tw)

usuario <- "TouronDamian"

?get_timeline

#Devuelve hasta 3200 estados publicados en las líneas de tiempo de cada uno
#o más usuarios de Twitter específicos
#user , n = x, max_id = hasta que fecha
#get timeline

timeline <- get_timeline(user = usuario, n = 100)
View(gtl)

######

?get_followers
#seguidores que sigue la cuenta, hasta 75mil seguidores
#user,n = numero de seguidores que se busca,


followers <- get_followers(user = usuario, n = 100) %>% View
# %>% me ahorra hacerlo aparte


##############
?get_friends
#devuelve cuentas que sigue uno o mas usuarios especificados,hasta 15 usuarios
#si son 15 establecer TRUE en retryionratelimit
#users, n = num de seguidos a ver, retryonratelimit = TRUE si son 15

friends <- get_friends(users = usuario, n = 100) %>% View


######
?get_favorites
#devuelve hasta 3000 favoritos puestos, por un o mas usuarios especificados
#user, n = num de favs = x

favorites <- get_favorites(user = usuario, n = 100) %>% View


######
?users_data
#el perfil de las personas del tweet aclarado

dataPerfil <- users_data(favorites)  
dataPerfil %>% View()

