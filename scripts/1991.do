// 1991 script
/*
The following script is used to extract the desired variables from the 1991 
census
*/ 

clear
#delimit ; 
infix prov 1-2 cma 3-5  plob 31-32 ctzn 33 immstat 34 
	  immigage 37-38 ethn 39-40 abor 43 dtch 44 germ 69 
	  hngr 46 pols 47 ukrn 48 grek 49 ital 50 prtg 51 span 52
	  jew 53 cdn 54 chin 55 filp 56 viet 57 blck 58 aborGen 59 // General abor
	  balk 60 arab 61 wasia 62 sasi 63 latin 64 using indiv91.txt,clear;
	  
