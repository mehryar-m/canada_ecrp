// 1986 script
/*
The following script is used to extract the desired information from 
1986
*/ 

clear
gen year = 1986
#delimit ;
infix prov 1-2 ethn 64-65 plob 85-86 ctzn 92 immigage 93-94 
  using indiv86.txt, clear ;

