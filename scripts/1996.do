// 1996 Script
/*
The following script is used to extract the desired variables from the 1996 
census
*/ 
clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
#delimit ; 
infix prov 1-2 vismin 38 plob 28-29 ctzn 32
      immstat 33 ethn 42-43
	  using indiv96.txt, clear;
	  
gen year = 1996;
order year, first;


/* See variables.txt for descriptions
   See ethnic_doc.txt or codebook86.txt for orginin of ethn codes and
   See pob.txt for origin of pob codes
*/
gen immigstat = 0;
replace immigstat = 1 if immstat == 2;
drop immstat;

// Ethnic Origin
gen abor  = 1 if ethn == 27;
gen neuro = 1 if ethn == 1;
gen weuro = 1 if ethn == 2 | ethn == 3 | ethn == 4 | ethn == 5;
gen eeuro = 1 if ethn == 8 | ethn == 9 | ethn == 7 | ethn == 6;					
gen seuro = 1 if ethn == 11 | ethn == 12 | ethn == 10 | ethn == 13;
gen jew = 1 if ethn == 14;
gen oeuro = 1 if ethn == 15; 
gen wasia = 1 if ethn == 19 | ethn == 18 | ethn == 17;
gen easia = 1 if ethn == 21 | ethn == 22 | ethn == 24 | ethn == 20| ethn == 23;
gen afrocrb = 1 if ethn == 16 | ethn == 26 | ethn == 46; 
gen lat = 1 if ethn == 25;
gen osing = 1 if ethn == 29;
gen can = 1 if ethn == 28;
gen fbmulti = 1 if ethn == 30 |
				   ethn == 31 |
				   ethn == 32 |
				   ethn == 33 |
				   ethn == 34 |
				   ethn == 35 |
				   ethn == 36 |
				   ethn == 37 |
				   ethn == 38 |
				   ethn == 40 |
				   ethn == 41 |
				   ethn == 42;
				   
gen omulti = 1 if ethn == 39 | ethn == 43;

#delimit ;
// Atlantic Provinces
gen at_eur   = 1 if   ethn == 44;
gen at_asian = 1 if   ethn == 45;
gen at_osing = 1 if   ethn == 47;


foreach v of varlist abor neuro weuro eeuro seuro jew oeuro wasia easia afrocrb 
		lat osing can fbmulti omulti at_eur at_asian at_osing {;
	replace `v' = 0 if missing(`v');
};
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
outsheet using 1996.csv, comma;


	 
	  
