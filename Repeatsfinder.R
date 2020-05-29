library(GenomicRanges)
library(karyoploteR)
library(stringr)




#mm10 - Dec 2011 - RepeatMasker open-4.0.5 - Repeat Library 20140131
Repbase<-read.table(file="/data/cephfs/punim1048/LINEandmore/RepeatmaskerGenomes/mm10.fa.out", header=F)
USCCtable<-read.table(file="/data/cephfs/punim1048/LINEandmore/RepeatmaskerGenomes/repeatmaskertrackUCSC.wholetable", header=T)
USCCbed<-read.table(file="/data/cephfs/punim1048/LINEandmore/RepeatmaskerGenomes/repeatmaskertrackUCSC.bed", header=F)
dfam<-read.table(file="/data/cephfs/punim1048/LINEandmore/RepeatmaskerGenomes/mm10_dfam.hits", header=F)
dmlTest<-read.table(file="/data/cephfs/punim1048/RStudio/Results/dmlTest_Control-CORT.tsv", header=T)
#compare tracks with genomeoverlap



UCSCheader<-c("bin",	"swScore",	"milliDiv",	"milliDel",	"milliIns",	"genoName",	"genoStart",	"genoEnd",	"genoLeft",	"strand",	"repName",	"repClass",	"repFamily",	"repStart",	"repEnd",	"repLeft",	"id")
names<-c("SW score", "perc div.", "perc ins.", "query sequence","chr", "query start", "query end", " query (left)", "C/+", "matching repeat", "repeat class/family", "repeat start", "repeat end", "repeat (left)", "ID" )
colnames(Repbase) <- names
colnames(USCCtable)<-UCSCheader


#things to analyse
> levels(USCCtable$V12)
[1] "DNA"            "DNA?"           "LINE"           "LINE?"          "Low_complexity"
[6] "LTR"            "LTR?"           "Other"          "RC"             "RC?"           
[11] "RNA"            "rRNA"           "Satellite"      "scRNA"          "Simple_repeat" 
[16] "SINE"           "SINE?"          "snRNA"          "srpRNA"         "tRNA"          
[21] "Unknown"


#contains LINE
LINE<-USCCtable[str_detect(USCCtable$repClass,"LINE"),]
LINE<-Repbase[str_detect(repeatsfasta$V14,"LINE"),]
ERVs<-USCCtable[str_detect(USCCtable$repFamily,"ERV"),]
LTRs<-USCCtable[str_detect(USCCtable$repClass,"LTR"),]
IAPrepbase<-Repbase[str_detect(Repbase$`matching repeat`,"IAP"),]
IAP<-USCCtable[str_detect(USCCtable$repName,"IAP"),]
#notese que ERV1 y ERV1? entran aqui, si quiero solo los que son ERV1 fijo pongo == en vez de string detect
ERV1<-USCCtable[str_detect(USCCtable$repFamily,"ERV1"),]
L1<-USCCtable[str_detect(USCCtable$repFamily,"L1"),]
#all ERVK are IAP?
ERVK<-USCCtable[str_detect(USCCtable$repFamily,"ERVK"),]
#There are 323,502 ERVK and only 28,733 are IAP
#exact match
LINE<-repeatsfasta[repeatsfasta$`repeat class/family`=="LINE",]
LINE<-repeatsfasta["LINE" %in% repeatsfasta$`repeat class/family`,]
