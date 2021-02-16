WORKINGDIRECTORY=$1
SUBSET1=$3
#SUBSET2=$4


#mkdir -p $WORKINGDIRECTORY/results

for software in $WORKINGDIRECTORY
do
  if [ -d $WORKINGDIRECTORY/results ]
  then
    echo "La capeta $SOFTWARE ya existe."
else
	mkdir -p $WORKINGDIRECTORY/results
    if [ $WORKINGDIRECTORY -eq 0 + ]
    then
      echo "Ups! Algo ha fallado al crear results"
    else
      echo "results se ha creado con éxito"
    fi
  fi
done

Rscript "1_getData.R" $WORKINGDIRECTORY $WORKINGDIRECTORY/results/
Rscript "2_subettingData.R" $WORKINGDIRECTORY $WORKINGDIRECTORY/results/
Rscript "3_DEA.R" $WORKINGDIRECTORY $WORKINGDIRECTORY/results/ $SUBSET1 
#Ejemplo ejecución 
#sh DEA_Script.sh "/home/jesus/local_projects/DEA_HAB" "/home/jesus/local_projects/DEA_HAB/Data" "brca_rnaseq.RData" "SupplementaryTables1-4.xls" "/home/jesus/local_projects/DEA_HAB/Results1" "Basal"
#sh DEA_Script.sh "C:/Users/Ana/Desktop/Uni/PrimerCuatri/Herramientas/TareaHAB/TareaHAB" "C:/Users/Ana/Desktop/Uni/PrimerCuatri/Herramientas/TareaHAB/TareaHAB" "C:/Users/Ana/Desktop/Uni/PrimerCuatri/Herramientas/TareaHAB/TareaHAB/results" "Basal"