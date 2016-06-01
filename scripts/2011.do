// 2011 Script
/*
The following script is used to extract the desired variables from the 2011 
national household survey
*/ 
clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
#delimit ;
infix prov 198-199 vismin 254-255
	  plob 187-188 ctzn 36 immstat 110 ethn 74-75 using indiv11.txt, clear;

gen year = 2011;
order year, first;


/* See variables.txt for descriptions
   See ethnic_doc.txt or codebook86.txt for orginin of ethn codes and
   See pob.txt for origin of pob codes
*/
gen immigstat = 0;
replace immigstat = 1 if immstat == 2;
drop immstat;ko

// Ethnic Origin
gen abor  = 1 if ethn == 1;
gen neuro = 1 if ethn == 5|ethn == 6| ethn == 7 | ethn == 16| ethn == 9;
gen weuro = 1 if ethn == 10 | ethn == 12 | ethn == 11 | ethn == 13;
gen eeuro = 1 if ethn == 18 | ethn == 20 | ethn == 17 | ethn == 21 |
				 ethn == 19;					
gen seuro = 1 if ethn == 23 | ethn == 22 | ethn == 26 | ethn == 24 | ethn == 25;
gen jew = 0; /*ethn == 32; is now in other euroean*/
gen oeuro = 0 if ethn == 27; 
gen wasia = 1 if ethn == 32;
gen easia = 1 if ethn == 35 | ethn == 36 | ethn == 37 | ethn == 34| ethn == 33;
gen afrocrb = 1 if ethn == 31 | ethn == 29 | ethn == 28; 
gen lat = 1 if ethn == 30;
gen osing = 1 if ethn == 38; // This is only ocean
gen can = 1 if ethn == 2;
gen fbmulti = 1 if ethn == 40 |
				   ethn == 42 |
				   ethn == 50 |
				   ethn == 39 |
				   ethn == 41 |
				   ethn == 45 | 
				   ethn == 44 | 
				   ethn == 51 | 
				   ethn == 47 |
				   ethn == 43 |
				   ethn == 49;
				   
gen omulti = 1 if ethn == 48 | ethn == 52 | ethn == 4;

#delimit ;
// Atlantic Provinces NA for 2006

gen at_eur   = 0;
gen at_asian = 0;
gen at_osing = 0;
*/

foreach v of varlist abor neuro weuro eeuro seuro jew oeuro wasia easia afrocrb 
		lat osing can fbmulti omulti {;
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
outsheet using 2011.csv, comma;
