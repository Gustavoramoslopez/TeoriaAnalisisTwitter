library(rtweet)
library(tidyr)
library(tidyverse)
library(ggplot2)

install.packages("VennDiagram")
library(VennDiagram)
?VennDiagram
#Trazado del diagrama de Venn

usuario2 <- "CFKArgentina"
usuario <- "alferdez"

albert_friends <- get_friends(users = usuario, n = 600)
cfk_friends <- get_friends(users = usuario2, n = 250)

#uso funcion venn.diagram
venn.diagram(x = list(albert = albert_friends$user_id, 
                      cfk = cfk_friends$user_id),
             filename = "amigos_alb_cfk.png",
             fill = c("red3", "orange"),
             alpha = 0.50,
             cex = 2.5  )
#asi me crea un fichero de imagen en la carpeta(ver files

#x, filename, fill, alpha, cex

#x = creo una lista, que va a tener los user id de albert y cfk
#creo la lista, paso la variable de friends y selecciono la columna-
#-la columna que quiero con $ (used_id)

#filename = es el nombre de la figura
#fill = el 1er color para el 1er conjunto, el 2do para el 2do conjunto
#alpha = es la unidad de transparencia al 50%
#cex =  tamaño de la fuente de la letra 2.5, el estandar es 1