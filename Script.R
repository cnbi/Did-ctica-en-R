#-------------------------- Operadores útiles -------------------------------------
#
# Relacionales:
# >= Mayor o igual que
# <= Menor o igual que
# == Igual que
# != Que no sea igual que
# 
# Lógicas:
# & Y(And)
# | O(Or)

############################## Didáctica en R #####################################

# Cargar la base desde Excel
install.packages("readxl")
library(readxl)
Basexl <- read_excel("Base_de_datos.xlsx")
View(Basexl)

# Uso de attach()
Basexl$SUJETO
attach(Basexl)
SUJETO
detach(Basexl)

# Filtrar según posiciones
## Columnas
Basexl[, 6:27]
## Filas
Basexl[1:20, ]

# Filtrar usando dyplr
library(dplyr)
## Filtrar la edad únicamente
filter(Basexl, Edad > 20)
## Filtrar los registros según la edad y la puntuación en escala 2.
filter(Basexl, between(Edad, 20, 25) & escala2 >= 4)

# Crear pequeñas bases
## Filtrar únicamente las columnas
Basexl1 <- Basexl[ ,6:16]
Basexl1
## Filtrar únicamente los registros(filas)
Basexl2 <- Basexl[1:20, ]
Basexl2

#------------------------- Estadísticos descriptivos -------------------------------
# Frecuencias
install.packages("fdth")
library(fdth)
frecuencias <- fdt(Basexl$Universidad, by = TRUE, k=3)
frecuencias

# Descriptivos de la variable Total1
## Mínimo valor en la variable 
min(Basexl$Total1)

## Máximo valor en la variable 
max(Basexl$Total1)

## Rango
max(Basexl$Total1) - min(Basexl$Total1)

## Media de la variable 
mean(Basexl$Total1)

## Media de la variable recortando el 10% de la muestra
mean(Basexl$Total1, trim = 0.1)

## Mediana de la variable
install.packages("DescTools")
library(DescTools)
median(Basexl$Total1)

## Varianza de la variable
var(Basexl$Total1)

## Desviación estándar de la variable
sd(Basexl$Total1)

#--------------------------- Visualización de datos -------------------------------
# Activación del paquetes
install.packages("ggplot2")
library(ggplot2)

# Visualización de datos
ggplot(data = Basexl) + 
     geom_smooth(aes(x = Total1, y = Total2, color = "red")) +
     labs(title = "Relación entre Test 1 y Test 2", x = "Test 1", y = "Test 2") +
     theme(legend.position = "none")

# Cheat sheet para ggplot. En estas imágenes están las funciones que hace parte de ggplot mostrando
# ejemplos
# https://github.com/rstudio/cheatsheets/blob/main/data-visualization-2.1.pdf
