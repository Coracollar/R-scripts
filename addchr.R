#add chr to the chromosome number in file

addchr<-function(query){
  query$chromosome <- paste(rep("chr",nrow(C3_Interval_bed)), query$chromosome, sep = "")
}
