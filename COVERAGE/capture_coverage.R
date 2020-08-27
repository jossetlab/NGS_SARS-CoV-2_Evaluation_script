library(ggplot2)
library("tidyverse")
library(stringr)

setwd("C:/Users/regueex/Desktop/BIOINFO_ARTICLE/cov_sum")

####### COMPILE COVERAGE RESULTS FROM BEDTOOLS ########

header<-c("pos","VRES20-226-50")

CAP_table<-read.table(file = "capture/VRES20-226-50.cov")
CAP_table<-CAP_table[,-c(1,2)]
colnames(CAP_table)<-header

header<-c("pos","cov")

table<-read.table(file = "capture/VRES20-226-47.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-226-47"

table<-read.table(file = "capture/VRES20-101-94.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-101-94"

table<-read.table(file = "capture/VRES20-102-18.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-102-18"

table<-read.table(file = "capture/VRES20-102-59.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-102-59"

table<-read.table(file = "capture/VRES20-104-41.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-104-41"

table<-read.table(file = "capture/VRES20-104-44.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-104-44"

table<-read.table(file = "capture/VRES20-105-80.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-105-80"

table<-read.table(file = "capture/VRES20-108-5.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-108-5"

table<-read.table(file = "capture/VRES20-108-21.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-108-21"

table<-read.table(file = "capture/VRES20-108-36.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-108-36"

table<-read.table(file = "capture/VRES20-108-63.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-108-63"

table<-read.table(file = "capture/VRES20-111-67.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-111-67"

table<-read.table(file = "capture/VRES20-112-5.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-112-5"

table<-read.table(file = "capture/VRES20-112-28.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-112-28"

table<-read.table(file = "capture/VRES20-60-42.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-60-42"

table<-read.table(file = "capture/VRES20-60-56.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-60-56"

table<-read.table(file = "capture/VRES20-63-91.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-63-91"

table<-read.table(file = "capture/VRES20-66-25.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-66-25"

table<-read.table(file = "capture/VRES20-68-20.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-68-20"

table<-read.table(file = "capture/VRES20-95-88.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-95-88"

table<-read.table(file = "capture/VRES20-101-70.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-101-70"

table<-read.table(file = "capture/VRES20-109-10.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-109-10"

table<-read.table(file = "capture/VRES20-112-31.cov")
table<-table[,-c(1,2)]
colnames(table)<-header
CAP_table<-merge(CAP_table,table,by="pos",all.x=TRUE)
colnames(CAP_table)[which(colnames(CAP_table)=="cov")]<-"VRES20-112-31"

rownames(CAP_table)<-NULL

######## COMPUTE AVERAGE COVERAGE AT 10X FOR CAPTURE ##########

input_table<-CAP_table
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
capture_sum<-as.data.frame(cbind(sample,vec_cov10))
colnames(capture_sum)<-c("sample","Capture_cov10X")
write.table(x = capture_sum,"cov10.tsv",quote = F,sep="\t",row.names = F)

######### ORGANIZE SAMPLE DEPENDING ON Ct ###########

#informations table
info<-read.csv2("sample_info.csv")

CTinf20<-subset(info,CT<20)
CT_20_25<-subset(info,CT<25 & CT>=20)
CT_sup25<-subset(info,CT>=25)

LowCT<-as.character(CTinf20$Serotheque)

#LowCT
table_lowCT<-CAP_table[,c("pos",LowCT)]
sample<-colnames(table_lowCT)

df_capturelow <- table_lowCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_capturelow,"Capture_Low.tsv",quote=F,sep="\t",row.names = F)

#MID CT
midCT<-as.character(CT_20_25$Serotheque)
table_midCT<-CAP_table[,c("pos",midCT)]
sample<-colnames(table_midCT)

df_capture_mid <- table_midCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_capture_mid,"Capture_Mid.tsv",quote=F,sep="\t",row.names = F)

#HIGH CT
highCT<-as.character(CT_sup25$Serotheque)
table_highCT<-CAP_table[,c("pos",highCT)]
sample<-colnames(table_highCT)

df_capture_high <- table_highCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_capture_high,"Capture_High.tsv",quote=F,sep="\t",row.names = F)

