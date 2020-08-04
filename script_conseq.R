library(stringr)
library(DECIPHER)
library(bio3d)
library(pheatmap)
library(gridExtra)
library(ape)
library(tidyverse)
library(reshape2)
options(stringsAsFactors = FALSE)

setwd("C:/Users/regueex/Desktop/BIOINFO_ARTICLE/sequences_cons")

###################### FIGURE MINI HEATMAP

countN<-read.csv2("result_countN.csv")
countN$percent<-countN$Ncount/countN$seqlen
countN$truePerc<-countN$percent*100
countN$inverse<-1-countN$percent
write.csv2(x = countN,"table_countN.csv",row.names = F)

tab_newname<-read.table("rename_table.tsv")
countN<-merge(countN,tab_newname,by.x="sample",by.y="oldname")

extractCT<-function(name) {
  split<-str_split(name,"_")
  ctpart<-as.character(split[[1]][2])
  ctvalue<-as.numeric(substring(ctpart,3))
  return(ctvalue)
}
countN$CT<-sapply(countN$newname,extractCT)

extractSamplepart<-function(name) {
  split<-str_split(name,"_")
  spart<-paste0(as.character(split[[1]][1]),"_",as.character(split[[1]][2]))
  return(spart)
}
countN$rew_sample<-sapply(countN$newname,extractSamplepart)

extractproto<-function(name) {
  split<-str_split(name,"_")
  proto<-as.character(split[[1]][3])
  return(proto)
}
countN$proto<-sapply(countN$newname,extractproto)

cutoff10per<-subset(countN,truePerc>10)
cutoff10per$proto<-str_replace(cutoff10per$proto,"AI","CleanPlex")
cutoff10per$proto<-str_replace(cutoff10per$proto,"MI","mNGS")
cutoff10per$proto<-str_replace(cutoff10per$proto,"CI","RVOP")
cutoff10per$proto<-str_replace(cutoff10per$proto,"AO","ARTIC")

cutoff10per$newname<-paste0(cutoff10per$rew_sample,"_",cutoff10per$proto)

seqN10perc<-as.character(cutoff10per$newname)

allseq <- readDNAStringSet("cons_all_proto_NEWNAME2.fasta")

grepsearch<-""
for (sample in seqN10perc){
  grepsearch<-paste0(grepsearch,"|",sample)
}
grepsearch<-substring(grepsearch,2)

filter<-allseq[!is.element(names(allseq),names(allseq)[grep(grepsearch ,names(allseq))])]
names(filter) = gsub(" ","",names(filter))

countN <- countN[order(countN$CT),]
samplelist<-as.character(unique(countN$rew_sample))

fillMatrix<-function(mat){
  getsample<-str_split(colnames(mat)[1],"_")
  sample<-paste0(as.character(getsample[[1]][1]),"_",as.character(getsample[[1]][2]))
  #Add columns
  test<-paste0(sample,"_mNGS")
  if (!(test  %in% colnames(mat) )) {
    mat<-cbind(mat,rep(10000,nrow(mat)))
    colnames(mat)[ncol(mat)]<-test
  }
  test<-paste0(sample,"_CleanPlex")
  if (!(test  %in% colnames(mat) )) {
    mat<-cbind(mat,rep(10000,nrow(mat)))
    colnames(mat)[ncol(mat)]<-test
  }
  test<-paste0(sample,"_RVOP")
  if (!(test  %in% colnames(mat) )) {
    mat<-cbind(mat,rep(10000,nrow(mat)))
    colnames(mat)[ncol(mat)]<-test
  }
  test<-paste0(sample,"_ARTIC")
  if (!(test  %in% colnames(mat) )) {
    mat<-cbind(mat,rep(10000,nrow(mat)))
    colnames(mat)[ncol(mat)]<-test
  }
  #Add rows
  test<-paste0(sample,"_mNGS")
  if (!(test  %in% rownames(mat) )) {
    mat<-rbind(mat,rep(10000,ncol(mat)))
    rownames(mat)[nrow(mat)]<-test
  }
  test<-paste0(sample,"_CleanPlex")
  if (!(test  %in% rownames(mat) )) {
    mat<-rbind(mat,rep(10000,ncol(mat)))
    rownames(mat)[nrow(mat)]<-test
  }
  test<-paste0(sample,"_RVOP")
  if (!(test  %in% rownames(mat) )) {
    mat<-rbind(mat,rep(10000,ncol(mat)))
    rownames(mat)[nrow(mat)]<-test
  }
  test<-paste0(sample,"_ARTIC")
  if (!(test  %in% rownames(mat) )) {
    mat<-rbind(mat,rep(10000,ncol(mat)))
    rownames(mat)[nrow(mat)]<-test
  }
  order<- c(paste0(sample,"_ARTIC"),paste0(sample,"_RVOP"),paste0(sample,"_CleanPlex"),paste0(sample,"_mNGS"))
  mat<-mat[,order]
  mat<-mat[order,]
  return(mat)
}

list_MATRIX<-list()
for (i in 1:24){
  sample<-samplelist[i]
  filter_sample<-filter[is.element(names(allseq),names(allseq)[grep(paste0(sample,"_mNGS|",sample,"_RVOP|",sample,"_ARTIC|",sample,"_CleanPlex") ,names(filter))])]
  if (length(filter_sample@ranges@NAMES)>=2){
    align_filter<-AlignSeqs(filter_sample)
    #BrowseSeqs(align_filter, highlight=1)
    writeXStringSet(align_filter, file="test_extract.fasta")
    list_seq<-read.dna("test_extract.fasta", format = "fasta",
                       as.character = FALSE, as.matrix = NULL)
    mat_dist<-dist.dna(list_seq, model = "N", variance = FALSE,
                       gamma = FALSE, pairwise.deletion = FALSE,
                       base.freq = NULL, as.matrix = TRUE)
    mat_dist<-fillMatrix(mat_dist)
    list_MATRIX[[i]]<-mat_dist
  }else list_MATRIX[[i]]<-"NULL"
}

list_TABLE<-list()
for (i in 1:22){
  matrice<-list_MATRIX[[i]]
  samplename<-str_split(colnames(matrice)[1],"_")
  samplename<-paste0(samplename[[1]][1],"_",samplename[[1]][2])
  matrice[lower.tri(matrice)]<-NA
  table<-melt(matrice, na.rm = TRUE)
  table$sample<-samplename
  table$Var1<-sapply(table$Var1,extractproto)
  table$Var2<-sapply(table$Var2,extractproto)
  list_TABLE[[i]]<-table
}

##### Less than 2 passing sequences for the sample 23 
sample<-samplelist[23]
order<- c("mNGS","CleanPlex","RVOP","ARTIC")
HM23<-matrix(10000,ncol = 4, nrow = 4, dimnames = list(order, order))
HM23[upper.tri(HM23)]<-NA
table23<-melt(HM23, na.rm = TRUE)
table23$sample<-sample
list_TABLE[[23]]<-table23

##### Less than 2 passing sequences for the sample 24
sample<-samplelist[24]
order<- c("mNGS","CleanPlex","RVOP","ARTIC")
HM24<-matrix(10000,ncol = 4, nrow = 4, dimnames = list(order, order))
HM24[upper.tri(HM24)]<-NA
table24<-melt(HM24, na.rm = TRUE)
table24<-melt(HM24, na.rm = TRUE)
table24$sample<-sample
list_TABLE[[24]]<-table24


table_heatmap<-rbind(list_TABLE[[1]],list_TABLE[[2]],list_TABLE[[3]],list_TABLE[[4]],list_TABLE[[5]],
            list_TABLE[[6]],list_TABLE[[7]],list_TABLE[[8]],list_TABLE[[9]],list_TABLE[[10]],
            list_TABLE[[11]],list_TABLE[[12]],list_TABLE[[13]],list_TABLE[[14]],list_TABLE[[15]],
            list_TABLE[[16]],list_TABLE[[17]],list_TABLE[[18]],list_TABLE[[19]],list_TABLE[[20]],
            list_TABLE[[21]],list_TABLE[[22]],list_TABLE[[23]],list_TABLE[[24]])

listsample<-unique(as.character(table_heatmap$sample))

order_facet<-listsample

table_heatmap$Var1<-factor(table_heatmap$Var1,level=c("mNGS","CleanPlex","RVOP","ARTIC"))
table_heatmap$Var2<-factor(table_heatmap$Var2,level=c("mNGS","CleanPlex","RVOP","ARTIC"))
table_heatmap$sample<-as.factor(table_heatmap$sample)
table_heatmap$sample<-factor(table_heatmap$sample, levels = order_facet)
table_filtrate<-subset(table_heatmap,value<10000)
table_filtrate$sample<-factor(table_filtrate$sample, levels = order_facet)

pdf("Heatmap_Facet.pdf")
ggplot(data = table_heatmap, aes(Var2, Var1, fill = value))+
  xlab("")+ylab("")+
  geom_tile(color = "white",show.legend = FALSE)+
  scale_fill_gradientn(colours = c("#33CCFF","#FFCC33","#CC0000","#666666"),
                       values = scales::rescale(c(0,0.1,5,9999,10000)),
                       limits=c(0,10000))+
  geom_text(data=table_filtrate,aes(Var2, Var1, label = value), color = "black", size = 2)+
  theme(axis.text.x = element_text(vjust = 1, 
                                   size = 6, hjust = 1,angle = 45),
        axis.text.y = element_text(vjust = 0.5, 
                                   size = 6, hjust = 1),
        panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.margin = unit(c(3,3,3,3), "cm"),
        strip.text.x = element_text(size = 8))+
  facet_wrap(sample~.,ncol = 4,nrow = 6)
dev.off()  