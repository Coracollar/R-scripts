library(GenomicRanges)
library(karyoploteR)

zoom.mup <- toGRanges(data.frame("chr4", 59929793, 62169375))

kp <- plotKaryotype("mm10", chromosomes="chr4", zoom=zoom.mup)
kpDataBackground(kp)
