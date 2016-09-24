// 1991 script
/*
The following script is used to extract the desired variables from the 1991 
census
*/ 

clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
#delimit ; 
infix prov 1-2 vismin 41  plob 31-32 ctzn 33 immstat 34 
	   ethn 39-40 own using indiv91.txt,clear;
	  
gen year = 1991;
order year, first;


/* See variables.txt for descriptions
   See ethnic_doc.txt or codebook86.txt for orginin of ethn codes and
   See pob.txt for origin of pob codes
*/
gen immigstat = 0;
replace immigstat = 1 if immstat == 2;
drop immstat;

// Ethnic Origin
gen abor  = 1 if ethn == 25;
gen neuro = 1 if ethn == 1;
gen weuro = 1 if ethn == 2 | ethn == 3 | ethn == 4 | ethn == 5;
gen eeuro = 1 if ethn == 8 | ethn == 9 | ethn == 7 | ethn == 6;					
gen seuro = 1 if ethn == 11 | ethn == 12 | ethn == 10 | ethn == 13;
gen jew = 1 if ethn == 14;
gen oeuro = 1 if ethn == 15; 
gen wasia = 1 if ethn == 16 | ethn == 17;
gen easia = 1 if ethn == 18 | ethn == 19 | ethn == 20 | ethn == 21 | ethn == 22;
gen afrocrb = 1 if ethn == 24; 
gen lat = 1 if ethn == 23;
gen osing = 1 if ethn == 27;
gen can = 1 if ethn == 26;
gen fbmulti = 1 if ethn == 29 |
				   ethn == 30 |
				   ethn == 31 |
				   ethn == 32 |
				   ethn == 28;
gen omulti = 1 if ethn == 33;

#delimit ;
// Atlantic Provinces
gen at_eur   = 1 if   ethn == 34;
gen at_asian = 1 if   ethn == 35;
gen at_osing = 1 if   ethn == 36;


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
outsheet using 1991.csv, comma;
