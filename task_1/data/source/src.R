# VersiÃ³n R: sdfafsf
# Elaborado por: Angelica Alvarez, Sebastian Marin y Alejandro Acelas
# 

# Importamos los paquetes necesarios
library(rio)
library(skimr)
library(tidyverse)

# setwd("C:/Users/Sergio Alejandro/OneDrive - Universidad de Los Andes/Documentos/Taller R/task_r_202102/task_1/data")
rm(list = ls())


# 1. Vectores
# TODO: Alejandro - Crear los tres vectores del punto 1
v1 = 1:100
v2 = v1[v1 %% 2 == 1]
v3 = v2 + 1

# -----------------------------------------

# 2. Limpiar base de datos

# TODO: Alejandro - Importar base de datos de excel y quitar filas con NaN
cultivos = import("input/cultivos.xlsx", sheet="CultivosIlicitos", col_names = T, range="A9:Y362")

# DUDA: Podriamos cambiarlo para que quite todas las filas con na
cultivos = cultivos %>% drop_na(CODDEPTO, DEPARTAMENTO, CODMPIO, MUNICIPIO)
skim(cultivos)

# -----------------------------------------


# 3. GEIH

# TODO: Angelica - Importar datos Encuesta Hogares

general = import("input/2019/Cabecera - Caracteristicas generales (Personas).rds")
ocupados = import("input/2019/Cabecera - Ocupados.rds")
desocupados = import("input/2019/Cabecera - Desocupados.rds")
inactivos = import("input/2019/Cabecera - Inactivos.rds")
ftrabajo = import("input/2019/Cabecera - Fuerza de trabajo.rds")

# TODO: (Nombre) - Crear variables indicadoras para ocupados, desocupados, inactivos y fuerza de trabajo

# TODO: (Nombre) - Unir las bases de datos usando secuencia_p, orden y directorio como identificadores

# TODO: (Nombre) - Generar 3 tablas con estadísticas descriptivas para la base de datos

# TODO: (Nombre) - Generar 3 tablas con estadísticas descriptivas para la base de datos

# TODO: (Nombre) - Generar 3 gráficos sobre los datos

# TODO: (Nombre) - Generar 3 gráficos sobre los datos


