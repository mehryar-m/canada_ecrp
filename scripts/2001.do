// 2001 Script
/*
The following script is used to extract the desired variables from the 2001 
census
*/ 

clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
/* note that 
ethn is for non-atlantic provinces ethna for atlantic
plob is for non-atlantic provinces ploba for atlantic
*/ 			

#delimit ;
infix prov 1-2 vismin 61  ctzn 54 immstat 55 
	  ploba 44-45  plob 46-47 ethna 65-66 ethn 67-68
	  using indiv01.txt, clear;  

gen year = 2001;
order year, first;


/* See variables.txt for descriptions
   See ethnic_doc.txt or codebook86.txt for orginin of ethn codes and
   See pob.txt for origin of pob codes
*/
gen immigstat = 0;
replace immigstat = 1 if immstat == 2;
drop immstat;

// Ethnic Origin
gen abor  = 1 if ethn == 36 | ethna == 11;
gen neuro = 1 if ethn == 2 | ethn == 22 | ethn == 3 | ethn == 4 | ethn == 25
				 | ethna == 1;
gen weuro = 1 if ethn == 5 | ethn == 7 | ethn == 6 | ethn == 23
				 | ethna == 2;
gen eeuro = 1 if ethn == 9 | ethn == 8 | ethn == 27 | ethn == 24 | ethn == 10;
					
gen seuro = 1 if ethn == 11 | ethn == 12 | ethn == 26;
gen jew = 1 if ethn == 14;
gen oeuro = 1 if ethn == 28 | ethna == 3;
gen wasia = 1 if ethn == 31 | ethn == 30 | ethn == 16 | ethna == 5 | ethna == 6;
gen easia = 1 if ethn == 18 | ethn == 19 | ethn == 33 | ethn == 20| ethn == 21
				|ethn == 17 | ethn == 32 | ethna == 8 | ethna == 7;
gen afrocrb = 1 if ethn == 29 | ethn == 35 | ethn == 15 | ethna == 3 |
				   ethna == 10; 
gen lat = 1 if ethn == 34 | ethna == 9 ;
gen osing = 1 if ethn == 29 | ethna == 14;
gen can = 1 if ethn == 1 | ethn == 37 | ethna == 13 | ethna == 12;
gen fbmulti = 1 if ethn  == 39 |
				   ethn  == 40 |
				   ethn  == 42 |
				   ethn  == 43 |
				   ethna == 15 |
				   ethna == 16 |
				   ethna == 17 |
				   ethna == 18 |
				   ethna == 19 |
				   ethna == 20 |
				   ethna == 21 |
				   ethna == 22 |
				   ethna == 23 |
				   ethna == 25 |
				   ethna == 26 |
				   ethna == 27;
				   
gen omulti = 1 if ethn == 46 | ethn == 41 | ethn == 45 | ethna == 28
				| ethna == 24;

#delimit ;
// Atlantic Provinces
gen at_eur   = 1 if   ethna == 3;
gen at_asian = 1 if   ethna == 6 | ethna == 7 | ethna == 8;
gen at_osing = 1 if   ethna == 14;


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
outsheet using 2001.csv, comma;
