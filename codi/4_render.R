#htg_cohort!! 31.10.2010----31.12.2108!!


#--------------------------------------------------------------------------------------------------#
#                           2019                                      ##                             #
#--------------------------------------------------------------------------------------------------#


#MOSTRA!RAI:gran funcio!
# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2019"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
#data_inici=paste0(ANY,'0101')
#data_final=paste0(ANY,'1231')


data_inici="20080101"
data_final="20181231"

save.image("codi/params.Rdata")


#---------------------------- LECTURA1 ------------------------------------------------------------# 
rm(list=ls())
gc()
load("codi/params.Rdata")

#--------------------------------------------------------------------------------------------------# 
rmarkdown::render(input="./codi/1_lectura.RMD",
                  output_file=paste0(here::here("resultats/Informe_Lectura_HTG_"),nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti ,dir_dades_origen=dir_dades_origen,
                                bd.dindex1=data_inici,bd.dindex2=data_final))
#--------------------------------------------------------------------------------------------------#
#---------------------------  PREPARACIO ----------------------------------------------------------#
library("dplyr")
rm(list=ls())
gc()
load("codi/params.Rdata")
#--------------------------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------------------------#
rmarkdown::render(input="./codi/2_preparacio.RMD",
                  output_file=paste0(here::here("resultats/Informe_preparcio_HTG_"),nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti))

#--------------------------------------------------------------------------------------------------#
#---------------------------  ANALISI -------------------------------------------------------------#
library("dplyr")
rm(list=ls())
gc()
load("codi/params.Rdata")
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
rmarkdown::render(input="./codi/3_analisi.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#
































#MOSTRA!RAI[antic]
# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2019"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
#data_inici=paste0(ANY,'0101')
#data_final=paste0(ANY,'1231')


data_inici="20080101"
data_final="20181231"

save.image("codi/params.Rdata")


#---------------------------- LECTURA1 ------------------------------------------------------------# 
rm(list=ls())
gc()
load("codi/params.Rdata")

#--------------------------------------------------------------------------------------------------# 
rmarkdown::render(input="./codi/1_lectura_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Lectura_HTG_"),nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti ,dir_dades_origen=dir_dades_origen,
                                bd.dindex1=data_inici,bd.dindex2=data_final))
#--------------------------------------------------------------------------------------------------#
#---------------------------  PREPARACIO ----------------------------------------------------------#
library("dplyr")
rm(list=ls())
gc()
load("codi/params.Rdata")
#--------------------------------------------------------------------------------------------------#
#--------------------------------------------------------------------------------------------------#
rmarkdown::render(input="./codi/2_preparacio.RMD",
                  output_file=paste0(here::here("resultats/Informe_preparcio_HTG_"),nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti))

#--------------------------------------------------------------------------------------------------#

#---------------------------  ANALISI -------------------------------------------------------------#
library("dplyr")
rm(list=ls())
gc()
load("codi/params.Rdata")
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
rmarkdown::render(input="./codi/3_analisi.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG2_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#





















