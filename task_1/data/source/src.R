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
cultivos = cultivos %>% drop_na()
skim(cultivos)

# Pivotear a formato long
cultivos = cultivos %>% pivot_longer(cols=num_range('', 1999:2019), names_to = "ANIO",
                                     names_transform = list(ANIO = as.integer), values_to = "HECTAREAS")
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

ocupados = bind_cols(ocupados, list(OCUPADO=1))
desocupados = bind_cols(ocupados, list(DESOCUPADO=1))
inactivos = bind_cols(ocupados, list(INACTIVO=1))
ftrabajo = bind_cols(ocupados, list(FUERZA_TRABAJO=1))
# TODO: (Nombre) - Unir las bases de datos usando secuencia_p, orden y directorio como identificadores
completo = left_join(general, ocupados, by=c("secuencia_p", "orden", "directorio"), suffix=c('', '.y'))
completo = left_join(completo, desocupados, by=c("secuencia_p", "orden", "directorio"), suffix=c('', '.y'))
completo = left_join(completo, inactivos, by=c("secuencia_p", "orden", "directorio"), suffix=c('', '.y'))
completo = left_join(completo, ftrabajo, by=c("secuencia_p", "orden", "directorio"), suffix=c('', '.y'))

# Faltan las columnas P6030S1, P6440, P6450
completo = completo %>% select(c(secuencia_p, orden, directorio, P6020, P6040 
                                 , P6920, INGLABO, dpto, fex_c_2011, ESC, mes, P6050,
                                 OCUPADO, DESOCUPADO, INACTIVO, FUERZA_TRABAJO))

# Falta reemplazar NA values por 0s

# thing = completo %>% mutate(OCUPADO = ifelse(p6020 == 1, "Hombre","Mujer"), p6160 = ifelse(p6160 == 1, "Lee","No Lee"))
# TODO: (Nombre) - Generar 3 tablas con estadisticas descriptivas para la base de datos

# TODO: (Nombre) - Generar 3 tablas con estadisticas descriptivas para la base de datos

# TODO: (Nombre) - Generar 3 gr?ficos sobre los datos

# TODO: (Nombre) - Generar 3 gr?ficos sobre los datos


