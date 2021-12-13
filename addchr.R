#add chr to the chromosome number in file

addchr<-function(query){
  query$chromosome <- paste(rep("chr",nrow(query)), query$chromosome, sep = "")
}
