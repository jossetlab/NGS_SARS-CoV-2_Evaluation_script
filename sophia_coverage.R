library(ggplot2)
library("tidyverse")

setwd("C:/Users/regueex/Desktop/BIOINFO_ARTICLE/cov_sum")

####### COMPILE COVERAGE RESULTS FROM BEDTOOLS ########

header<-c("pos","VRES20-226-50")

SOP_table<-read.table(file = "sophia/VRES20-226-50.cov")
SOP_table<-SOP_table[,-1]
colnames(SOP_table)<-header

header<-c("pos","cov")

table<-read.table(file = "sophia/VRES20-226-47.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-226-47"

table<-read.table(file = "sophia/VRES20-101-94.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-101-94"

table<-read.table(file = "sophia/VRES20-102-18.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-102-18"

table<-read.table(file = "sophia/VRES20-102-59.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-102-59"

table<-read.table(file = "sophia/VRES20-104-41.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-104-41"

table<-read.table(file = "sophia/VRES20-104-44.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-104-44"

table<-read.table(file = "sophia/VRES20-105-80.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-105-80"

table<-read.table(file = "sophia/VRES20-108-5.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-108-5"

table<-read.table(file = "sophia/VRES20-108-21.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-108-21"

table<-read.table(file = "sophia/VRES20-108-36.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-108-36"

table<-read.table(file = "sophia/VRES20-108-63.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-108-63"

table<-read.table(file = "sophia/VRES20-111-67.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-111-67"

table<-read.table(file = "sophia/VRES20-112-5.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-112-5"

table<-read.table(file = "sophia/VRES20-112-28.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-112-28"

table<-read.table(file = "sophia/VRES20-60-42.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-60-42"

table<-read.table(file = "sophia/VRES20-60-56.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-60-56"

table<-read.table(file = "sophia/VRES20-63-91.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-63-91"

table<-read.table(file = "sophia/VRES20-66-25.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-66-25"

table<-read.table(file = "sophia/VRES20-68-20.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-68-20"

table<-read.table(file = "sophia/VRES20-95-88.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-95-88"

table<-read.table(file = "sophia/VRES20-101-70.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-101-70"

table<-read.table(file = "sophia/VRES20-109-10.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-109-10"

table<-read.table(file = "sophia/VRES20-112-31.cov")
table<-table[,-1]
colnames(table)<-header
SOP_table<-merge(SOP_table,table,by="pos",all.x=TRUE)
colnames(SOP_table)[which(colnames(SOP_table)=="cov")]<-"VRES20-112-31"

rownames(SOP_table)<-NULL

######## COMPUTE AVERAGE COVERAGE AT 10X FOR SOPHIA ##########

input_table<-SOP_table
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
sophia_sum<-as.data.frame(cbind(sample,vec_cov10))
colnames(sophia_sum)<-c("sample","Sophia_cov10X")
write.table(x = sophia_sum,"cov10_sophia.tsv",quote = F,sep="\t",row.names = F)

######### ORGANIZE SAMPLE DEPENDING ON Ct ###########

info<-read.csv2("sample_info.csv")

CTinf20<-subset(info,CT<20)
CT_20_25<-subset(info,CT<25 & CT>=20)
CT_sup25<-subset(info,CT>=25)

LowCT<-as.character(CTinf20$Serotheque)

#LowCT
table_lowCT<-SOP_table[,c("pos",LowCT)]
sample<-colnames(table_lowCT)

df_sophia_low <- table_lowCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_sophia_low,"Sophia_Low.tsv",quote=F,sep="\t",row.names = F)

#MID CT
midCT<-as.character(CT_20_25$Serotheque)
table_midCT<-SOP_table[,c("pos",midCT)]
sample<-colnames(table_midCT)

df_sophia_mid <- table_midCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_sophia_mid,"Sophia_Mid.tsv",quote=F,sep="\t",row.names = F)

#HIGH CT
highCT<-as.character(CT_sup25$Serotheque)
table_highCT<-SOP_table[,c("pos",highCT)]
sample<-colnames(table_highCT)

df_sophia_high <- table_highCT %>%
  dplyr::select(all_of(sample)) %>%
  gather(key = "sample", value = "coverage", -pos)
write.table(df_sophia_high,"Sophia_High.tsv",quote=F,sep="\t",row.names = F)
