SUBSET=$1
Rscript "1_getData.R"
Rscript "2_subettingData.R"
Rscript "3_DEA.R" $SUBSET