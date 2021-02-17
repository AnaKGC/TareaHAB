WORKINGDIRECTORY=$1
SUBSET=$3


for results in $WORKINGDIRECTORY
do
  if [ -d $WORKINGDIRECTORY/results ]
  then
    echo "La capeta results ya existe."
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
Rscript "3_DEA.R" $WORKINGDIRECTORY $WORKINGDIRECTORY/results/ $SUBSET
