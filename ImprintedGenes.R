library(ggplot2)
library(GenomicRanges)

#obtain the list of imprinted genes from file. This one is from the university of san diego. 
#Is the simplest one, without info if is maternal o paterna. Start and end from UCSC
imprintedgenes1<-read.table(file="/Methylation_Analysis/genesmethylation/imprintedgenes1.txt", header=T)

gr_imprintedgenes1<-GRanges(seqnames = imprintedgenes1$mm10.knownGene.chrom,
                            ranges = IRanges(start = imprintedgenes1$mm10.knownGene.txStart, end=imprintedgenes1$mm10.knownGene.txEnd))
#paternally and maternal expresse genes. From http://www.mousebook.org/imprinting-gene-list?page=4
paternalexpresedgenes1<-read.table(file="/Methylation_Analysis/genesmethylation/paternalexpressedgenes1.txt", header=T)
maternalexpresedgenes1<-read.table(file="/Methylation_Analysis/genesmethylation/maternalexpresedgenes1.txt", header=T)

creategranges<-function(imprintedgenes){
  GR<-GRanges(seqnames = imprintedgenes$mm10.knownGene.chrom,
          ranges = IRanges(start = imprintedgenes$mm10.knownGene.txStart, end=imprintedgenes$mm10.knownGene.txEnd))
}

paternal_gr<-creategranges(paternalexpresedgenes1)
maternal_gr<-creategranges(maternalexpresedgenes1)

#obtaining my methylation values
dmlTest<-read.table(file="/data/cephfs/punim1048/RStudio/Results/dmlTest_Control-CORT.tsv", header=T)
gr_dml <- GRanges(seqnames = dmlTest$chr,
                  ranges = IRanges(start = dmlTest$pos, dmlTest$pos))


#obtain methylation values only for the genes I am interested in
overlaps<-findOverlaps(gr_imprintedgenes1, gr_dml, ignore.strand=TRUE)
overlapspaternal<-findOverlaps(paternal_gr, gr_dml, ignore.strand=TRUE)
overlapsmaternal<-findOverlaps(maternal_gr, gr_dml, ignore.strand=TRUE)

imprintedgenesmethylation1<-dmlTest[subjectHits(overlaps),]
paternalyexpressedmethylation<-dmlTest[subjectHits(overlapspaternal),]
maternalyexpressedmethylation<-dmlTest[subjectHits(overlapsmaternal),]

#represent methylation density

represent<-function(overlapdata){
  mydf<-data.frame(sample=factor(rep(c("Control", "CORT"), each=nrow(overlapdata))), methylationfrec=c(overlapdata$mu1, overlapdata$mu2))
  ggplot(mydf, aes(x=methylationfrec, color=sample)) + geom_density()
}

represent(imprintedgenesmethylation1)

represent(paternalyexpressedmethylation)
represent(paternalyexpressedmethylation)
