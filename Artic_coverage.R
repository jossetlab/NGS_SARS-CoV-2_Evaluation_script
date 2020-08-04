library(ggplot2)
library("tidyverse")

setwd("C:/Users/regueex/Desktop/BIOINFO_ARTICLE/cov_sum")

####### COMPILE COVERAGE RESULTS FROM BEDTOOLS ########

header<-c("pos","VRES20-226-50")

ARTIC_table<-read.table(file = "artic/barcode07_2_PT.cov")
ARTIC_table<-ARTIC_table[,-1]
colnames(ARTIC_table)<-header

header<-c("pos","cov")

table<-read.table(file = "artic/barcode06_2_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-226-47"

table<-read.table(file = "artic/barcode01_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-101-94"

table<-read.table(file = "artic/barcode02_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-102-18"

table<-read.table(file = "artic/barcode03_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-102-59"

table<-read.table(file = "artic/barcode04_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-104-41"

table<-read.table(file = "artic/barcode05_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-104-44"

table<-read.table(file = "artic/barcode06_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-105-80"

table<-read.table(file = "artic/barcode07_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-108-5"

table<-read.table(file = "artic/barcode08_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-108-21"

table<-read.table(file = "artic/barcode09_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-108-36"

table<-read.table(file = "artic/barcode10_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-108-63"

table<-read.table(file = "artic/barcode11_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-111-67"

table<-read.table(file = "artic/barcode12_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-112-5"

table<-read.table(file = "artic/barcode13_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-112-28"

table<-read.table(file = "artic/barcode15_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-60-42"

table<-read.table(file = "artic/barcode16_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-60-56"

table<-read.table(file = "artic/barcode17_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-63-91"

table<-read.table(file = "artic/barcode18_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-66-25"

table<-read.table(file = "artic/barcode19_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-68-20"

table<-read.table(file = "artic/barcode20_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-95-88"

table<-read.table(file = "artic/barcode21_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-101-70"

table<-read.table(file = "artic/barcode22_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-109-10"

table<-read.table(file = "artic/barcode14_PT.cov")
table<-table[,-1]
colnames(table)<-header
ARTIC_table<-merge(ARTIC_table,table,by="pos",all.x=TRUE)
colnames(ARTIC_table)[which(colnames(ARTIC_table)=="cov")]<-"VRES20-112-31"


######## COMPUTE AVERAGE COVERAGE AT 20X FOR ARTIC ONT ##########

input_table<-ARTIC_table
vec_cov20<-c()
for (i in 2:ncol(input_table)){
  coverage<-input_table[,i]
  full_cov<-length(coverage)
  cov_sub<-length(subset(coverage,coverage>20))
  cov
  cov20<-cov_sub/full_cov*100
  vec_cov20<-c(vec_cov20,cov20)
  
}
sample<-colnames(input_table[,2:ncol(input_table)])
artic_sum<-as.data.frame(cbind(sample,vec_cov20))
colnames(artic_sum)<-c("sample","Artic_cov20X")
write.table(x = artic_sum,"cov20_artic.tsv",quote = F,sep="\t",row.names = F)

######### ORGANIZE SAMPLE DEPENDING ON Ct ###########

info<-read.csv2("sample_info.csv")

CTinf20<-subset(info,CT<20)
CT_20_25<-subset(info,CT<25 & CT>=20)
CT_sup25<-subset(info,CT>=25)

LowCT<-as.character(CTinf20$Serotheque)

#LowCT
table_lowCT<-ARTIC_table[,c("pos",LowCT)]
sample<-colnames(table_lowCT)

df_artic_low <- table_lowCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_artic_low,"Artic_Low.tsv",quote=F,sep="\t",row.names = F)

#MID CT
midCT<-as.character(CT_20_25$Serotheque)
table_midCT<-ARTIC_table[,c("pos",midCT)]
sample<-colnames(table_midCT)

df_artic_mid <- table_midCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_artic_mid,"Artic_Mid.tsv",quote=F,sep="\t",row.names = F)

#HIGH CT
highCT<-as.character(CT_sup25$Serotheque)
table_highCT<-ARTIC_table[,c("pos",highCT)]
sample<-colnames(table_highCT)

df_artic_high <- table_highCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_artic_high,"Artic_High.tsv",quote=F,sep="\t",row.names = F)
