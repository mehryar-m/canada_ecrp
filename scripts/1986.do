// 1986 script
/*
The following script is used to extract the desired information from 
1986

Note* since it this year's census did not have immigration status, 
Immigration age is used to identify immigrants

*/ 

clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
#delimit ;
infix prov 1-2 vismin 66 ethn 64-65 plob 85-86 ctzn 92 immigage 95-96
  using indiv86.txt, clear ;
  
gen year = 1986;
order year, first;


/* See variables.txt for descriptions
   See ethnic_doc.txt or codebook86.txt for orginin of ethn codes and
   See pob.txt for origin of pob codes
*/
gen immigstat = 0;
replace immigstat = 1 if immigage != 0;
drop immigage;

// Ethnic Origin
gen abor  = 1 if ethn == 20;
gen neuro = 1 if ethn == 1 | ethn == 5;
gen weuro = 1 if ethn == 3 | ethn == 2 | ethn == 4;
gen eeuro = 1 if ethn == 8 | ethn == 9 | ethn == 7 | ethn == 6;					
gen seuro = 1 if ethn == 11 | ethn == 12 | ethn == 10;
gen jew = 1 if ethn == 13;
gen oeuro = 1 if ethn == 14; 
gen wasia = 1 if ethn == 15;
gen easia = 1 if ethn == 17 | ethn == 18 | ethn == 16 | ethn == 19;
gen afrocrb = 1 if ethn == 21; 
gen lat = 0;
gen osing = 1 if ethn == 22;
gen can = 0;
gen fbmulti = 1 if ethn == 24 |
				   ethn == 25 |
				   ethn == 26 |
				   ethn == 27 |
				   ethn == 23;
gen omulti = 1 if ethn == 28;

foreach v of varlist abor neuro weuro eeuro seuro jew oeuro wasia easia afrocrb 
					 lat osing can fbmulti omulti {;
	replace `v' = 0 if missing(`v');
};

// Atlantic Provinces
gen at_eur = 0;
gen at_asian = 0;
gen at_osing = 0;

/*
// Place of Birth
gen canpop
gen uspob
gen nweuropob
gen eeuropob
gen oeuropob
gen sasianpob
gen wasiapob
gen afropob
gen latinpob
gen opob

// Atlantic Provinces
gen atotherpob
gen atotherasiapob
gen atothereuropob

*/
outsheet using 1986.csv, comma;
