// 1981 Script
/*
The following script is used to extract the desired variables from the 1981 
census
*/ 
clear 
#delimit ; 
infix prov 1-2 cma 3-5 ethn 86-87 plob 88-89 ctzn 95 immigage 98	
	using indiv81.txt ;
gen year = 1981
