// 1986 script
/*
The following script is used to extract the desired information from 
1986
*/ 

clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
#delimit ;
infix prov 1-2 ethn 64-65 plob 85-86 ctzn 92 immigage 93-94 
  using indiv86.txt, clear ;
gen year = 1986

// See variables.txt for descriptions

gen abor
gen neuro
gen weuro
gen eeuro
gen seuro
gen jew 
gen oeuro
gen wasia
gen easia
gen agrocrb
gen lat
gen osing
gen can
gen fbmulti
gen omulti

// Atlantic Provinces
gen at_eur
gen at_asian
gen at_osing
