// 2001 Script
/*
The following script is used to extract the desired variables from the 2001 
census
*/ 

clear
#delimit 
infix prov 1-2 cma 3-5 ethn 65-66 ethna 67-68 immstat 55 immigage 59-60 
	  plobp 44-45  ploba 46-47 ctzn 54 ctznop 54 ctzna 52-53 abor 69 
	  afr 70 balk 71cdn 72 chin 73 crb 74 dtch 75 filp 76 germ 77 
	  grek 78 hungr 79 ital 80 jew 81 leb 82 latin 83 pols 84 
	  prtg 85 sasia 86 span 87 ukrn 88 viet 89 wasia 90
	  using indiv01.txt, clear;  

