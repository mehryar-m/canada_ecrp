// 2006 Script
/*
The following script is used to extract the desired variables from the 2006 
census
*/ 

clear
#delimit ; 
infix prov 195-196 cma 28-30 ctzn 25 ctznoc 26-27
	  genstat 65 immigstat 103 plob 184-185 ethn 61-62
	  using indiv06.txt ; 
