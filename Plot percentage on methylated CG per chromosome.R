library(ggplot)

#function to calculate it per chromosome falta



CG_total <-sum(as.numeric(paste(c3_chr19$called_sites)))
GC_methylated<-sum(as.numeric(paste(c3_chr19$called_sites_methylated)))

CG_c3_19<-(GC_methylated/CG_total*100)

c3<-c(CG_c3_1,CG_c3_2, CG_c3_3, CG_c3_4, CG_c3_5, CG_c3_6, CG_c3_7, CG_c3_8, CG_c3_9, CG_c3_10, CG_c3_11, CG_c3_12, CG_c3_13, CG_c3_14, CG_c3_15, CG_c3_16, CG_c3_17, CG_c3_18,CG_c3_19, CG_c3_X, CG_c3_Y, CG_c3_MT)
cort13<-c(CG_cort13_chr1,CG_cort13_chr2, CG_cort13_chr3, CG_cort13_chr4, CG_cort13_chr5, CG_cort13_chr6, CG_cort13_chr7, CG_cort13_chr8, CG_cort13_chr9, CG_cort13_chr10, CG_cort13_chr11, CG_cort13_chr12, CG_cort13_chr13, CG_cort13_chr14, CG_cort13_chr15, CG_cort13_chr16, CG_cort13_chr17, CG_cort13_chr18, CG_cort13_chr19, CG_cort13_chrX, CG_cort13_chrY, CG_cort13_chrMT)
chr<-c("chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chrX", "chrY", "chrMT")

graph<- data.frame(c3, cort13, chr )


library(ggplot2)
ggplot() + geom_point(aes(x=chr,y=c3),color='red') + 
  geom_point(aes(x=chr,y=cort13),color='blue') + 
  ylab('% CG metylated')+xlab('Chromosome') + scale_color_manual(values = c("Control" = 'red','CORT' = 'blue')) + 
  scale_shape_manual(values = c('Control' = 16, 'CORT' = 16))


ggplot() +
  geom_point(aes(x = chr,y = c3, colour = 'Control'),data=graph) +
  geom_point(aes(x = chr,y = cort13, colour = 'CORT'),data=graph) +
  ylab(label = '% CG metylated') +
  xlab(label = 'Chromosome')
  
labs(title="Control3", x="Methylation level", y="Genomic CG %" )

gg2<-ggplot(CGmethdf, aes(x=methylation_level, y=GenomicCGpercet_CORT13)) + 
  geom_bar(stat="identity", width=5, fill="tomato3") + 
  labs(title="CORT13", x="Methylation level", y="Genomic CG %" )

plot(gg)
