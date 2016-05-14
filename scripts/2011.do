// 2011 Script
/*
The following script is used to extract the desired variables from the 2011 
national household survey
*/ 
clear
#delimit 
infix prov 198-199 cma 39-41 immigage 4-5 genstat 78
	  plob 187-188 ctzn 36 ctzoth 37-38 immigstat 110
	  ethn 49 ethnder 74-75 using indiv11.txt, clear;
