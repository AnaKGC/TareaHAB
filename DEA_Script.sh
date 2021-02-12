WORKINGDIRECTORY=$1
DATAFOLDER=$2
CANCERDATA=$3
SUPTABLES=$4
RESULTSLOCATION=$5
SUBSET=$6

mkdir -p $RESULTSLOCATION
Rscript "1_getData.R" $WORKINGDIRECTORY $DATAFOLDER $CANCERDATA $SUPTABLES $RESULTSLOCATION
#Ejemplo ejecución 
#sh DEA_Script.sh "/home/jesus/local_projects/DEA_HAB" "/home/jesus/local_projects/DEA_HAB/Data" "brca_rnaseq.RData" "SupplementaryTables1-4.xls" "/home/jesus/local_projects/DEA_HAB/Results1" "Basal"