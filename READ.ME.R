#instrukcja obslugi
# wloz wszystkie katalogi z danymi do katalogu "corpus" - mozesz zroic linki do katalogow

# zainstaluj biblioteki
#install.packages('tm')
#install.packages('SnowballC')
#install.packages('proxy')

# umiesc skrypty: pre.R, hcluster.R, kmeans.R w katalogu w którym znajduje się katalog "corpus"
# czyli bedziesz mial cos takiego

#- cluster
#  |-health_sciences_subcat_medicine_and_dentistry_txt
#  |-13_cat_physical_sciences_and_engineering_subcat_computer_science_txt
#  |-19_high_energy_particles_txt
#  |-22_cat_life_sciences_subcat_biochemistry_genetic_and_molecular_biology_txt
#  |-31_cat_health_sciences_subcat_medicine_and_dentistry_txt
#  |- 44_cat_social_sciences_and_humanities_subcat_economics_econometrics_and_finance_txt
#-hcluster.R
#-pre.R
#-kmeans.R

# najpierw wykonaj skrypt pre.R następnie wykonaj skrypt kmeans.R i hcluster.R