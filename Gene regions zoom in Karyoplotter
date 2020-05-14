Reads files from nanopolish methylation frec output 

library(BiocManager)
library(dplyr)
library(GenomicRanges)
library(karyoploteR)
library(GenomicRanges)

Control <- read.table(file ="/Users/coralinacollarfernandez/Documents/TSV/barcode01_mmi_fa_metfrec.tsv", header = T) 

CORT <- read.table(file ="/Users/coralinacollarfernandez/Documents/TSV/barcode06_1_metfrec.tsv", header = T) 

names <- c("chromosome", "start", "end", "num_motifs_in_group", "called_sites", "called_sites_methylated", "methylated_frequency", "group_sequence")


addchr<-function(CORT){
  CORT$chromosome <- paste(rep("chr",nrow(CORT)), CORT$chromosome, sep = "")
  }
  
numerize<-function(CORT){
  CORT$start<-as.numeric(paste(CORT$start))
  CORT$end<-as.numeric(paste(CORT$end))
  CORT$methylated_frequency<-as.numeric(paste(CORT$methylated_frequency))
  CORT$called_sites<-as.numeric((paste(CORT$called_sites)))
  CORT$called_sites_methylated<-as.numeric((paste(CORT$called_sites_methylated)))
}

creategr<-function(CORT){
  gr2 <- GRanges(seqnames = CORT$chromosome,
               ranges = IRanges(start = CORT$start, end= CORT$end))
}
