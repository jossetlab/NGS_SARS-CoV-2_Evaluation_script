setwd("C:/Users/regueex/Desktop/BIOINFO_ARTICLE/cov_sum")

library(ggplot2)
library("tidyverse")
library(stringr)
library(scales)
library(ggpubr)
library(RColorBrewer)

source("Artic_coverage.R")
source("capture_coverage.R")
source("sophia_coverage.R")
source("WTA_coverage.R")

######### SUMARIZE AVERAGE COVERAGE FROM EACH METHOD ########## 

table_wta<-read.table("cov10_wta.tsv",header=T)
table_capture<-read.table("cov10_capture.tsv",header=T)
table_sophia<-read.table("cov10_sophia.tsv",header=T)
table_artic<-read.table("cov20_artic.tsv",header=T)

tab_recap<-merge(table_wta,table_capture,by="sample")
tab_recap<-merge(tab_recap,table_sophia,by="sample")
tab_recap<-merge(tab_recap,table_artic,by="sample")

#informations table
info<-read.csv2("sample_info.csv")

tab_recap<-merge(tab_recap,info,by.x = "sample",by.y = "Serotheque")
tab_recap<-tab_recap[,-c(6,8)]
tab_recap<-tab_recap[,c("Samplename","sample","CT","Capture_cov10X","Sophia_cov10X","Artic_cov20X","WTA_cov10X")]
tab_recap<-tab_recap[order(tab_recap$CT),]

write.csv2(tab_recap,"recap_coverage.csv",row.names = F)

########## PLOT COVERAGE #############

funLog<-function(number){
  if(number<1) result<-0 else result<-log10(number)
  return(result)
}
#ORDER factors
orderLow<-c("VRES20-109-10","VRES20-66-25","VRES20-105-80","VRES20-95-88","VRES20-101-70","VRES20-68-20","VRES20-226-50","VRES20-226-47")
orderMid<-c("VRES20-104-41","VRES20-112-5","VRES20-60-42","VRES20-108-21","VRES20-60-56","VRES20-63-91","VRES20-102-59","VRES20-108-63")
orderHigh<-c("VRES20-101-94","VRES20-112-28","VRES20-108-36","VRES20-111-67","VRES20-112-31","VRES20-108-5","VRES20-104-44","VRES20-102-18")

####CAPTURE
captureLow<-read.table("Capture_Low.tsv",header=T)
captureMid<-read.table("Capture_Mid.tsv",header=T)
captureHigh<-read.table("Capture_High.tsv",header=T)

#log10 normalisation
captureLow$coverage<-sapply(captureLow$coverage, funLog)
captureMid$coverage<-sapply(captureMid$coverage, funLog)
captureHigh$coverage<-sapply(captureHigh$coverage, funLog)

#Ordering factor
captureLow$sample<-factor(captureLow$sample,levels = orderLow)
captureMid$sample<-factor(captureMid$sample,levels = orderMid)
captureHigh$sample<-factor(captureHigh$sample,levels = orderHigh)

captureLow$CT<-"Low Ct (Ct < 20)"
captureMid$CT<-"MidCt (20 ≤ Ct < 25)"
captureHigh$CT<-"HighCt (Ct ≥ 25)"

all_capture<-rbind(captureLow,captureMid,captureHigh)
all_capture$proto<-"RVOP"

####ARTIC
articLow<-read.table("Artic_Low.tsv",header=T)
articMid<-read.table("Artic_Mid.tsv",header=T)
articHigh<-read.table("Artic_High.tsv",header=T)

#log10 normalisation
articLow$coverage<-sapply(articLow$coverage, funLog)
articMid$coverage<-sapply(articMid$coverage, funLog)
articHigh$coverage<-sapply(articHigh$coverage, funLog)

#Ordering factor
articLow$sample<-factor(articLow$sample,levels = orderLow)
articMid$sample<-factor(articMid$sample,levels = orderMid)
articHigh$sample<-factor(articHigh$sample,levels = orderHigh)

articLow$CT<-"Low Ct (Ct < 20)"
articMid$CT<-"MidCt (20 ≤ Ct < 25)"
articHigh$CT<-"HighCt (Ct ≥ 25)"

all_artic<-rbind(articLow,articMid,articHigh)
all_artic$proto<-"ARTIC"

####SOPHIA
sophiaLow<-read.table("Sophia_Low.tsv",header=T)
sophiaMid<-read.table("Sophia_Mid.tsv",header=T)
sophiaHigh<-read.table("Sophia_High.tsv",header=T)

#log10 normalisation
sophiaLow$coverage<-sapply(sophiaLow$coverage, funLog)
sophiaMid$coverage<-sapply(sophiaMid$coverage, funLog)
sophiaHigh$coverage<-sapply(sophiaHigh$coverage, funLog)

#Ordering factor
sophiaLow$sample<-factor(sophiaLow$sample,levels = orderLow)
sophiaMid$sample<-factor(sophiaMid$sample,levels = orderMid)
sophiaHigh$sample<-factor(sophiaHigh$sample,levels = orderHigh)

sophiaLow$CT<-"Low Ct (Ct < 20)"
sophiaMid$CT<-"MidCt (20 ≤ Ct < 25)"
sophiaHigh$CT<-"HighCt (Ct ≥ 25)"

all_sophia<-rbind(sophiaLow,sophiaMid,sophiaHigh)
all_sophia$proto<-"CleanPlex"

####WTA
wtaLow<-read.table("wta_Low.tsv",header=T)
wtaMid<-read.table("wta_Mid.tsv",header=T)
wtaHigh<-read.table("wta_High.tsv",header=T)

#log10 normalisation
wtaLow$coverage<-sapply(wtaLow$coverage, funLog)
wtaMid$coverage<-sapply(wtaMid$coverage, funLog)
wtaHigh$coverage<-sapply(wtaHigh$coverage, funLog)

#Ordering factor
wtaLow$sample<-factor(wtaLow$sample,levels = orderLow)
wtaMid$sample<-factor(wtaMid$sample,levels = orderMid)
wtaHigh$sample<-factor(wtaHigh$sample,levels = orderHigh)

wtaLow$CT<-"Low Ct (Ct < 20)"
wtaMid$CT<-"MidCt (20 ≤ Ct < 25)"
wtaHigh$CT<-"HighCt (Ct ≥ 25)"

all_wta<-rbind(wtaLow,wtaMid,wtaHigh)
all_wta$proto<-"mNGS"

#prepare data for ggplot2
all_cov<-rbind(all_wta,all_sophia,all_artic,all_capture)
all_cov$CT<- factor(all_cov$CT, levels=c('Low Ct (Ct < 20)','MidCt (20 ≤ Ct < 25)','HighCt (Ct ≥ 25)'))
all_cov$proto<- factor(all_cov$proto, levels=c('mNGS','RVOP','CleanPlex','ARTIC'))

FINAL_PLOT<-ggplot(all_cov, aes(x = pos, y = coverage,group= sample)) +
  geom_line(aes(color=sample),show.legend = FALSE,alpha=.5) +
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = comma,limits = c(0,6)) + 
  xlab("genomic position") + ylab("log10(coverage)")+ 
  geom_hline(aes(yintercept=1),linetype="dashed")+
  theme(plot.title = element_text(hjust = 0.5,size = 14),
        axis.text.x = element_text(size = 6),
        axis.text.y = element_text(size = 6),
        plot.margin = unit(c(3,3,3,3), "cm"))+
  facet_grid( proto  ~ CT )

pdf(file = "Coverage_summary.pdf")
FINAL_PLOT
dev.off()
