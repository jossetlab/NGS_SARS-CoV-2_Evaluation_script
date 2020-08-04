library(ggplot2)
library("tidyverse")

setwd("C:/Users/regueex/Desktop/BIOINFO_ARTICLE/cov_sum")

####### COMPILE COVERAGE RESULTS FROM BEDTOOLS ########

header<-c("pos","VRES20-226-50")

WTA_table<-read.table(file = "wta/VRES20-226-50.cov")
WTA_table<-WTA_table[,-1]
colnames(WTA_table)<-header

header<-c("pos","cov")

table<-read.table(file = "wta/VRES20-226-47.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-226-47"

table<-read.table(file = "wta/VRES20-101-94.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-101-94"

table<-read.table(file = "wta/VRES20-102-18.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-102-18"

table<-read.table(file = "wta/VRES20-102-59.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-102-59"

table<-read.table(file = "wta/VRES20-104-41.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-104-41"

table<-read.table(file = "wta/VRES20-104-44.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-104-44"

table<-read.table(file = "wta/VRES20-105-80.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-105-80"

table<-read.table(file = "wta/VRES20-108-5.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-108-5"

table<-read.table(file = "wta/VRES20-108-21.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-108-21"

table<-read.table(file = "wta/VRES20-108-36.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-108-36"

table<-read.table(file = "wta/VRES20-108-63.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-108-63"

table<-read.table(file = "wta/VRES20-111-67.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-111-67"

table<-read.table(file = "wta/VRES20-112-5.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-112-5"

table<-read.table(file = "wta/VRES20-112-28.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-112-28"

table<-read.table(file = "wta/VRES20-060-42.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-60-42"

table<-read.table(file = "wta/VRES20-060-56.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-60-56"

table<-read.table(file = "wta/VRES20-063-91.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-63-91"

table<-read.table(file = "wta/VRES20-066-25.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-66-25"

table<-read.table(file = "wta/VRES20-068-20.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-68-20"

table<-read.table(file = "wta/VRES20-95-88.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-95-88"

table<-read.table(file = "wta/VRES20-101-70.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-101-70"


table<-read.table(file = "wta/VRES20-109-10.cov")
table<-table[,-1]
colnames(table)<-header
WTA_table<-merge(WTA_table,table,by="pos",all.x=TRUE)
colnames(WTA_table)[which(colnames(WTA_table)=="cov")]<-"VRES20-109-10"

#empty fastq, this sample dont pass analysis
WTA_table$`VRES20-112-31`<-0

rownames(WTA_table)<-NULL

WTA_table[is.na(WTA_table)] <- 0

######## COMPUTE AVERAGE COVERAGE AT 10X FOR WTA ##########

input_table<-WTA_table
vec_cov10<-c()
for (i in 2:ncol(input_table)){
  coverage<-input_table[,i]
  full_cov<-length(coverage)
  cov_sub<-length(subset(coverage,coverage>10))
  cov
  cov10<-cov_sub/full_cov*100
  vec_cov10<-c(vec_cov10,cov10)
  
}
sample<-colnames(input_table[,2:ncol(input_table)])
wta_sum<-as.data.frame(cbind(sample,vec_cov10))
colnames(wta_sum)<-c("sample","WTA_cov10X")
write.table(x = wta_sum,"cov10_wta.tsv",quote = F,sep="\t",row.names = F)

######### ORGANIZE SAMPLE DEPENDING ON Ct ###########

info<-read.csv2("sample_info.csv")

CTinf20<-subset(info,CT<20)
CT_20_25<-subset(info,CT<25 & CT>=20)
CT_sup25<-subset(info,CT>=25)

#LowCT
LowCT<-as.character(CTinf20$Serotheque)
table_lowCT<-WTA_table[,c("pos",LowCT)]
sample<-colnames(table_lowCT)

df_wta_low <- table_lowCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_wta_low,"wta_Low.tsv",quote=F,sep="\t",row.names = F)

#MID CT
midCT<-as.character(CT_20_25$Serotheque)
table_midCT<-WTA_table[,c("pos",midCT)]
sample<-colnames(table_midCT)

df_wta_mid <- table_midCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_wta_mid,"wta_Mid.tsv",quote=F,sep="\t",row.names = F)

#HIGH CT
highCT<-as.character(CT_sup25$Serotheque)
table_highCT<-WTA_table[,c("pos",highCT)]
sample<-colnames(table_highCT)

df_wta_high <- table_highCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_wta_high,"wta_High.tsv",quote=F,sep="\t",row.names = F)

