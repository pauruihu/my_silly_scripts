# my_silly_scripts

I'm going to upload the little scripts I made to practice and also that I applied to my bacterial data (when I couldn't find a "professional" solution online).

So I want to point out that I'm sure there are better ways to do it, but I leave my (silly) scripts just in case they would be helpful for someone. Watch out! There could be errors!

And, of course, if you have knowledge about scripting, any suggestion or comments will be grateful. 

##align_finish_ns.sh

Is an script to complete an alignment with n's. It would be needed if you transform a VCF file to fasta because on this step n's are put at the begining and between known positions but not at the end of the sequence. 

If you want to concatenate some samples mapped against the same reference, this could be a problem as in an alignment all the sequences must have the same length, so you can use this bash script to avoid the problem.

##align_ns.R
Does the same as align_finish_ns.sh but in R. It's not recomended for a long alignment because it is stored in memory and works too slow. 
As an example, in my data it couldn't finish in 12h and the bash script ended in almost 5 minutes.
