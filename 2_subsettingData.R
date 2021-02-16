args = commandArgs(trailingOnly=TRUE)
wd<-args[1]
setwd(wd)
results_location<-args[2]
column_filter_1<-args[3]
filter_1<-args[4]
column_filter_2<-args[5]
filter_2<-args[6]
source(paste(wd,"0_loadLibraries.R",sep=""))
loadpkg("dplyr")

## Load data from module 1

load(paste(results_location,"brca_rnaseq.RData",sep=""))
load(paste(results_location,"sample_data.RData",sep=""))

#### Get the breast cancer subtypes data

filter_1_samples <- sample_data[sample_data[, column_filter_1]==filter_1,]
filter_1_barcodes <- filter_1_samples$`Complete TCGA ID`

filter_2_samples <- sample_data[sample_data[, column_filter_2]==filter_2,]
filter_2_barcodes <- filter_2_samples$`Complete TCGA ID`


#### Subset the expression data according to cancer subtypes

brca_rnaseq.filter1 <- brca_rnaseq.tumour[, which(colnames(brca_rnaseq.tumour) %in% filter_1_barcodes)]

brca_rnaseq.filter2 <- brca_rnaseq.tumour[, which(colnames(brca_rnaseq.tumour) %in% filter_2_barcodes)]

filter_1_name<-paste("brca_rnaseq",column_filter_1,filter_1,"RData",sep=".")
filter_2_name<-paste("brca_rnaseq",column_filter_2,filter_2,"RData",sep=".")

save(brca_rnaseq.filter1, file = paste(results_location,filter_1_name,sep=""))
save(brca_rnaseq.filter2, file = paste(results_location,filter_2_name,sep=""))
