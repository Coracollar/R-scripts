library(GenomicRanges)

#obtain my data to analyse
dmlTest<-read.table(file="/data/cephfs/punim1048/RStudio/Results/dmlTest_Control-CORT.tsv", header=T)

bed<-read.table(file="/data/cephfs/punim1048/GRCm38_genome/ncRNAs/Mus_musculus.GRCm38.bed", header=F)
#	chrom	Chromosome (e.g. chr3, chrY, chr2_random) or scaffold (e.g. scaffold10671) name
#	chromStart	Start coordinate on the chromosome or scaffold for the sequence considered (the first base on the chromosome is numbered 0)
#	chromEnd	End coordinate on the chromosome or scaffold for the sequence considered. This position is non-inclusive, unlike chromStart.
#	name	Name of the line in the BED file
#	score	Score between 0 and 1000
#	strand	DNA strand orientation (positive ["+"] or negative ["-"])
#	thickStart	Starting coordinate from which the annotation is displayed in a thicker way on a graphical representation (e.g.: the start codon of a gene)
#thickEnd	End coordinates from which the annotation is no longer displayed in a thicker way on a graphical representation (e.g.: the stop codon of a gene)
#	itemRgb	RGB value in the form R,G,B (e.g. 255,0,0) determining the display color of the annotation contained in the BED file
#	blockCount	Number of blocks (e.g. exons) on the line of the BED file
#	blockSizes	List of values separated by commas corresponding to the size of the blocks (the number of values must correspond to that of the "blockCount")
#	blockStarts List of values separated by commas corresponding to the starting coordinates of the blocks, coordinates calculated relative to those present in the chromStart column (the number of values must correspond to that of the "blockCount")
bedheader<-c("chromosome", "start", "end", "name", "score", "strand", "thickStart", "thickEnd", "itemRgb", "blockCount", "blockSizes","blockStarts"  )
colnames(bed)<-bedheader

UCSCtable<-read.table(file="/data/cephfs/punim1048/GRCm38_genome/annotation/allgenes.txt", header=T, sep="\t")

#create GRanges

gr_dml <- GRanges(seqnames = dmlTest$chr,
                  ranges = IRanges(start = dmlTest$pos, end=dmlTest$pos))


creategrangesbed<-function(query){
  query$start<-as.numeric(paste(query$start))
  query$end<-as.numeric(paste(query$end))
  GR_repeats <- GRanges(seqnames = query$chromosome,
                        ranges = IRanges(start = query$start, end=query$end ))
}

creategrangesUCSCtable<-function(query){
  query$txStart<-as.numeric(paste(query$txStart))
  query$txEnd<-as.numeric(paste(query$txEnd))
  GR_repeats <- GRanges(seqnames = query$chrom,
                        ranges = IRanges(start = query$txStart, end=query$txEnd ))
}

GR_bed<-creategrangesbed(bed)

GR_UCSCtable<-creategrangesUCSCtable(UCSCtable)

#find overlaps






