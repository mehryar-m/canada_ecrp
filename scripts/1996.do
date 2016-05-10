// 1996 Script
/*
The following script is used to extract the desired variables from the 1996 
census
*/ 
clear
#delimit ; 
infix prov 1-2 cma 3-5 plob 28-29 ctzno 30-31 ctzn 32
      immstat 33 immage 36-37 ethn 42-43 dtch 44 germ 45
	  hungr 46 pols 47 ukrn 48 grek 49 ital 50 prtg 51 
	  span 52 jew 53 cdn 54 chin 55 filp 56 viet 57 leb 58
	  abor 59 balk 60 wasia 61 sasia 62 latin 63 afr 64 crb 65 
	  using indiv96.txt, clear;
	  


	 
	  