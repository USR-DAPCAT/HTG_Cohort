#16.03.2022#

#12.03.2022#
#21.02.2022#



##################################################################################################
#i)       Repàs variables , temes basals
#ii)      a les taules posar la N.
#iii)     Fer la taula totes les variables ajustat per d'EDAT I SEXE
#iv)      Grups d'Edats , pels BLOCS!.
#
########


#
##################################################################################################
#14.02.2022
##################################################################################################
#0)    les mateixes Taules pels 5 GRUPS! Ok
#i)    No embaràs Secundari.             Ok 
#ii    afegir EDAT+TG.Continua           Ok

#iii)  Prevalença[Triglicèrids Normal/Moderat ,Greu,Molt Greu]  2019 Ok 

#iv)   Falta la Prevalança de la resta d'anys: 2010,2011,2012,2013,2014,2015,2016,2017,2018. 
#v)    ForestPlot--plot_model-- [Greu/No Greu]OR, 
#         [per totes les variables Desc General/totes les variables Desc General ajustat per Edat i Sexe] 
#         [Bloc1/Bloc1 ajustat per Edat i Sexe] 
#         [Bloc2/Bloc2 ajustat per Edat i Sexe]
#         [Bloc3/Bloc3 ajustat per Edat i Sexe]
#
#vi)   Les P dels 5 Grups. ok 
#vii)  S'ha de fer en Anglès!

#
#
#
#################################################################################################
#10.12.2021
#################################################################################################
#Hola Ray, 
#
#No parecen existir cambios en la prevalencia en las enfer mentales. ¿Habéis comprobado el filtro y la fuente? 
#Si hemos restringido a enfermedades mayores (esquizo, depresión mayor, y pscosis, p.e) me parece mucho n 40%. 
#En cuanto a la figura es mejor ahora, pero si queremos mostrarla como final tendríamos que ver la forma de hacerla más níitida,
#alternativamente podemos tabular los datos para producir la figura en excel, p.e. 
#Si se puede producir hoy un informe completo de al menos un año para planificar la reunión del martes perfecto. 
#Gracias
#Emilio
#
#################################################################################################
#la població diana, és aquella , que entre el 2010-2019, 
#s'hagi fet una prova de Triglicèrids, en algun Cap de Catalunya.
#
#
#
##############
#[09.11.2021]#
##############
#
#library(tibble)
#
#
#
#DUBTES::::
##################################################################################################
#i)
#Consumo de alcohol, (sin/bajo/alto riesgo), 
#En el caso de bajo o sin riesgo + Pancreatitis alcohólica >>>convertir en alto riesgo ???
##################################################################################################
#ii)
#Desglosar por diferentes tratamientos:
#•	HMG CoA reductase inhibitors ???
#•	Fibrates ok!
#•	Bile acid sequestrants ???
#•	Nicotinic acid and derivatives ???
#•	Ezetimibe ???
#•	Other lipid modifying agents ???
##################################################################################################
#iii)
#
#Fármacos:
#  Antidiabéticos:
#  
#   •	NIAD; incluyen ADO y GLP-1 ???
#   •	INSULINAS
##################################################################################################
#iv)
#Calcular MEDEA ???
##################################################################################################
#v)
#Calcular AMBITO ???
##################################################################################################
#Causas secundarias de HTG, tabla de Prevalencias de HTG desglosadas por sexos y grupos de edad 
#
#1.	Alcohol alto y/o bajo riesgo y/o Ingesta alcohol setmanal [UBE] {Alcohol} 
#ingesta semanal > 13 UBA en mujeres y > 21 en hombres y/o agrupador problemas de salud: 
#ALCOHOL Diabetes mal controlada HbA1c >8, 
#
#2.	Obesidad IMC>30 OK!!!
#3.	Enfermedad renal crónica FG<60 y CAC>300 ???
#4.	Embarazo ????
#5.	TSH>10 ???
#6.	HIV (VIH)  ????
#7.	Enfermedades autoinmunes sistémicas: tipo lupus ???
#8.	Hemocromatosis (HEMOCROMAT)  ???
#9.	Farmac_ca_sec antipsicóticos  ok
#10.Fármacos esteroides (no los cutáneas) ???
##################################################################################################



#--------------------------------------------------------------------------------------------------#
#                           2019                                      ##                             #
#--------------------------------------------------------------------------------------------------#


#MOSTRA!
# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2019"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#





#POBLACIO!!



# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=F
ANY="2019"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#
#
#
#
#
#--------------------------------------------------------------------------------------------------#



















#rai.




#--------------------------------------------------------------------------------------------------#
#                           2010                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2010"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../../DADES/HTG/mostra"
            dir_dades_desti="dades/mostra"
            nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_preparcio_HTG_"),nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti))

#--------------------------------------------------------------------------------------------------#


#FER-HO!:


#---------------------------  ANALISI -------------------------------------------------------------#
library("dplyr")
rm(list=ls())
gc()
load("codi/params.Rdata")
#--------------------------------------------------------------------------------------------------#

#--------------------------------------------------------------------------------------------------#
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#















#--------------------------------------------------------------------------------------------------#
#                           2013                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2013"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#






#--------------------------------------------------------------------------------------------------#
#                           2016                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2016"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#





#--------------------------------------------------------------------------------------------------#
#                           2019                                      ##                             #
#--------------------------------------------------------------------------------------------------#
# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2019"
# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#













####jordi:


#--------------------------------------------------------------------------------------------------#
#                           2010                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2010"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#


#--------------------------------------------------------------------------------------------------#
#                           2013                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2013"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#






#--------------------------------------------------------------------------------------------------#
#                           2016                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2016"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#





#--------------------------------------------------------------------------------------------------#
#                           2019                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=T
ANY="2019"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#








#23.3.2022


#poblacio:



#--------------------------------------------------------------------------------------------------#
#                           2010                                      ##                             #
#--------------------------------------------------------------------------------------------------#

# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=F
ANY="2010"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#






# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=F
ANY="2013"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#





# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=F
ANY="2016"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#













# -------------------------   PARAMETRES  --------------------------------------------------------
gc()
rm(list=ls())
mostra=F
ANY="2019"

# -----------------------------------------------------------
dir_dades_desti="dades/poblacio" 
dir_dades_origen="../DADES/HTG/HTG" 
nom_output="Poblacio"
if (mostra) {dir_dades_origen="../DADES/HTG/mostra"
dir_dades_desti="dades/mostra"
nom_output="Test"}

# Rang anys per generar dates index
data_inici=paste0(ANY,'0101')
data_final=paste0(ANY,'1231')

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
rmarkdown::render(input="./codi/2_preparacio_HTG.RMD",
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
rmarkdown::render(input="./codi/3_analisi_HTG.RMD",
                  output_file=paste0(here::here("resultats/Informe_Exploratori_HTG_"),ANY,"_",nom_output,Sys.Date()),
                  params = list(dir_dades_desti=dir_dades_desti,ANY=ANY))
#--------------------------------------------------------------------------------------------------#






