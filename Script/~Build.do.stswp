* 				   [[Research Assistantship Coding Task]]
*					 				Build

* Author: Samuel Suárez

 cls
 clear all
 set more off
 cap log close
 

 * Main Path
 
 cd "/Users/samuel/Library/CloudStorage/OneDrive-Universidaddelosandes/Research Assistanceship/CodingTask-SamuelSuarez"
 
 * Derived Paths
 
 global data "Data"
 global raw_data "$data/raw"
 global processed_data "$data/processed"
 
 global output "Output"
 
 global script "Script"
 
 
 * Log-file
 
  log using "$script/log_build.txt" , replace text
  
  
 * Load raw data
 
 use "$raw_data/pwt1001.dta"
 
 
 * Keep requiered data
 
 keep if  year >= 1990 // by year
 keep country year cgdpo pop ctfp labsh // by variable
 
 
 * Create GDP/Capita variable
 
 gen  cgdpo_capita = cgdpo/(pop) // measured in units unlike cgdpo
 
 * Logarithmic GDP per capiuta and TFP
 
 gen log_cgdpo_capita = log(cgdpo_capita)
 gen log_ctfp = log(ctfp)
 
 * Panel data setup
 
 encode country, gen(country_id) // this variable is an id for the xtset command
 xtset country_id year // used id since xtset only allows for number type data
 
 * Creation of new variables
 
	* GDP
 gen fd_log_cgdpo_capita = log_cgdpo_capita - L.log_cgdpo_capita // first diff log
 gen gwth_cgdpo_capita = (cgdpo_capita - L.cgdpo_capita)*100/L.cgdpo_capita // growth rate
 
 gen cgdpo_capita_1990 = . // empty var for storing 1990 gdp
 replace cgdpo_capita_1990 = cgdpo_capita if year == 1990 // copies 1990 gdp into a new variable
 bysort country (year): /// loop for each country in ascending year order
	replace cgdpo_capita_1990 = cgdpo_capita_1990[_n-1] if missing(cgdpo_capita_1990)
	// fills column for a country with 1990 GDP data, using the data point from 1990
 gen cum_gr_cgdpo_capita = (cgdpo_capita - cgdpo_capita_1990)*100 / cgdpo_capita_1990 
 // uses 1990 gdp row to calculate cumulative growth
 drop cgdpo_capita_1990 // removes now useless variable
   
	* TFP
 xtset country_id year // solves error where stata forgets the panel data format
 
 gen fd_log_ctfp = log_ctfp - L.log_ctfp // first diff log
 gen gwth_ctfp = (ctfp - L.ctfp) * 100 / L.ctfp // growth rate

 gen ctfp_1990 = . // empty var for storing 1990 ctfp
 replace ctfp_1990 = ctfp if year == 1990 // copies 1990 ctfp into a new variable
 bysort country (year): /// loop for each country in ascending year order
     replace ctfp_1990 = ctfp_1990[_n-1] if missing(ctfp_1990) // fills column for a country with 1990 ctfp data
 gen cum_gr_ctfp = (ctfp - ctfp_1990) * 100 / ctfp_1990 // uses 1990 ctfp row to calculate cumulative growth
 drop ctfp_1990 // removes now useless variable 
 
	* Labor share
 xtset country_id year // solves error where stata forgets the panel data format
 
 gen gwth_labsh = (labsh - L.labsh) * 100 / L.labsh // growth rate

 gen labsh_1990 = . // empty var for storing 1990 labsh
 replace labsh_1990 = labsh if year == 1990 // copies 1990 labsh into a new variable
 bysort country (year): /// loop for each country in ascending year order
    replace labsh_1990 = labsh_1990[_n-1] if missing(labsh_1990) // fills column for a country with 1990 labsh data
 gen cum_gr_labsh = (labsh - labsh_1990) * 100 / labsh_1990 // uses 1990 labsh row to calculate cumulative growth
 drop labsh_1990 // removes now useless variable
 
 * Save dataset
  save "$processed_data/build_dofile.dta", replace
 

 