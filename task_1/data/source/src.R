# Version R: sdfafsf
# Elaborado por: Angelica Alvarez, Sebastian Marin y Alejandro Acelas
# 

# Importamos los paquetes necesarios
library(rio)
library(skimr)
library(tidyverse)
rm(list = ls())

# -----------------------------------------

# 1. Vectores
# TODO: Alejandro - Crear los tres vectores del punto 1
v1 = 1:100
v2 = 2*(0:49) + 1
v3 = v1[-v2]

# -----------------------------------------

# 2. Limpiar base de datos

# TODO: Alejandro - Importar base de datos de excel y quitar filas con NaN
cultivos = import("task_1/data/input/cultivos.xlsx", sheet="CultivosIlicitos", col_names = T, range="A9:Y362")

# DUDA: Podriamos cambiarlo para que quite todas las filas con na
cultivos = cultivos %>% drop_na(CODDEPTO, DEPARTAMENTO, CODMPIO, MUNICIPIO)
skim(cultivos)

# -----------------------------------------


# 3. GEIH

# TODO: Alejandro - Importar datos Encuesta Hogares

general = import("task_1/data/input/2019/Cabecera - Caracteristicas generales (Personas).rds")
ocupados = import("task_1/data/input/2019/Cabecera - Ocupados.rds")
desocupados = import("task_1/data/input/2019/Cabecera - Desocupados.rds")
inactivos = import("task_1/data/input/2019/Cabecera - Inactivos.rds")
ftrabajo = import("task_1/data/input/2019/Cabecera - Fuerza de trabajo.rds")

# TODO: (Nombre) - Crear variables indicadoras para ocupados, desocupados, inactivos y fuerza de trabajo

# TODO: (Nombre) - Unir las bases de datos usando secuencia_p, orden y directorio como identificadores

# TODO: (Nombre) - Generar 3 tablas con estadisticas descriptivas para la base de datos

# TODO: (Nombre) - Generar 3 tablas con estadisticas descriptivas para la base de datos

# TODO: (Nombre) - Generar 3 gr?ficos sobre los datos

# TODO: (Nombre) - Generar 3 gr?ficos sobre los datos


