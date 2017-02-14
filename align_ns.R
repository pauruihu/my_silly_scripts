library(ape)
library(pegas)
library(phangorn)

fas <- read.dna("alignment.aln", "fasta", as.character = TRUE) #change alignment name
c <- c("n")
len_refer <- as.numeric(length(fas[[1]])) #change 1 to the position number of the reference in your alignment
for (i in 1:length(fas)){
  if (length(fas[[i]]) < len_refer){
    long <- len_refer - length(fas[[i]])
    b <- rep(x = c, times = long)
    fas[[i]] <- c(fas[[i]],b)
  } 
}


write.dna(x = fas, file = "alignment2.fas", format = "fasta") #change output name
