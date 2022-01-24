library(datos)
#mis_paises <- datos::paises
#View(mis_paises)

library(tidyverse)
mis_paises <- datos::paises
mis_paises %>% View
#equivale a hacer la accion antes y menos codigo


#importar csv
library(data.table)
getwd() #nos muestra donde estamos
dir() #nos muestra que hay
# setwd() cambia donde estamos
dat <- fread("datos_paises.csv") # %>% View()
#fread suma una fila como numeracion
# otra manera es : informacion <- read.csv(file = "datos_paises.csv", sep = ";")



#importal xlsx
library(readxl)

dat2 <- read_xlsx("datos_paises.xlsx")
dat2 %>% View

