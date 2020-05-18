library(stringr)
library(GenomicRanges)


UCSCtable<-read.table(file="/data/cephfs/punim1048/LINEandmore/RepeatmaskerGenomes/repeatmaskertrackUCSC.wholetable", header=T)

dmlTest<-read.table(file="/data/cephfs/punim1048/RStudio/Results/dmlTest_Control-CORT.tsv", header=T)

UCSCheader<-c("bin",	"swScore",	"milliDiv",	"milliDel",	"milliIns",	"genoName",	"genoStart",	"genoEnd",	"genoLeft",	"strand",	"repName",	"repClass",	"repFamily",	"repStart",	"repEnd",	"repLeft",	"id")

Repbaseheader<-c("SW score", "perc div.", "perc ins.", "query sequence","chr", "query start", "query end", " query (left)", "C/+", "matching repeat", "repeat class/family", "repeat start", "repeat end", "repeat (left)", "ID" )

LINE<-UCSCtable[str_detect(USCCtable$repClass,"LINE"),]

L1<-UCSCtable[USCCtable$repFamily==L1,]

gr_dml <- GRanges(seqnames = dmlTest$chr,
                  ranges = IRanges(start = dmlTest$pos, dmlTest$pos))
                  
creategranges<-function(query, subject){
  query$genoStart<-as.numeric(paste(query$genoStart))
  query$genoEnd<-as.numeric(paste(query$genoEnd))
  GR_repeats <- GRanges(seqnames = query$genoName,
                        ranges = IRanges(start = query$genoStart, end=query$genoEnd ))
}

GR_line<-creategranges(LINE)


overlapingLINE<-dmlTest[queryHits(findOverlaps(GR_line, gr_dml, ignore.strand=TRUE)),]

