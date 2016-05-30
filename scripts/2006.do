// 2006 Script
/*
The following script is used to extract the desired variables from the 2006 
census
*/ 

clear
cd "/Users/mehryarmaalem/OneDrive/Work/DG/data_files"
#delimit ; 
infix prov 195-196 vismin 250-251 ctzn 25 
	  immstat 103 plob 184-185 ethn 61-62
	  using indiv06.txt ; 

gen year = 2006;
order year, first;


/* See variables.txt for descriptions
   See ethnic_doc.txt or codebook86.txt for orginin of ethn codes and
   See pob.txt for origin of pob codes
*/
gen immigstat = 0;
replace immigstat = 1 if immstat == 2;
drop immstat;

// Ethnic Origin
gen abor  = 1 if ethn == 3;
gen neuro = 1 if ethn == 5|ethn == 9| ethn == 20 | ethn == 8
				| ethn == 17 | ethn == 19 | ethn == 18 | ethn == 16 | ethn == 6
				| ethn == 7;
gen weuro = 1 if ethn == 4 | ethn == 13 | ethn == 14 | ethn == 15;
gen eeuro = 1 if ethn == 25 | ethn == 23 | ethn == 22 | ethn == 21 |
				 ethn == 24 | ethn == 26;					
gen seuro = 1 if ethn == 28 | ethn == 29 | ethn == 30 | ethn == 27 | ethn == 31;
gen jew = 1 if ethn == 32;
gen oeuro = 0; /*if ethn == 15;*/ 
gen wasia = 1 if ethn == 36 | ethn == 35 | ethn == 34;
gen easia = 1 if ethn == 43 | ethn == 37 | ethn == 38 | ethn == 39| ethn == 40
				| ethn == 41 | ethn == 42;
gen afrocrb = 1 if ethn == 33 | ethn == 11 | ethn == 10; 
gen lat = 1 if ethn == 12;
gen osing = 1 if ethn == 44; // Not that this now contains other european
gen can = 1 if ethn == 2 | ethn == 1;
gen fbmulti = 1 if ethn == 45 |
				   ethn == 46 |
				   ethn == 48 |
				   ethn == 49 ;
				   
gen omulti = 1 if ethn == 47 | ethn == 55 | ethn == 51;

#delimit ;
// Atlantic Provinces NA for 2006

gen at_eur   = 0 ;
gen at_asian = 0 ;
gen at_osing = 0 ;


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
outsheet using 2006.csv, comma;


	 
	  
