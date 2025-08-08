* 				   [[Research Assistantshipn Coding Task]]
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
 
 
 * Keep useful data
 
 keep if  year >= 1990 // by year
 keep country year cgdpo pop ctfp labsh // by variable
 
 
 * Create GDP/Capita variable
 
 gen  cgdpo_capita = cgdpo/(pop*1000000) // measured in millions like cgdpo
 
 * Logarithmic GDP per capiuta and TFP
 
 gen log_cgdpo_capita = log(cgdpo_capita)
 gen log_tfp = log(ctfp)
 
 * Choose year variable to represent time
 
 tsset year
 
 * New variables
 
 gen fd_log_cgdpo_capita = log_cgdpo_capita - L.log_cgdpo_capita
 
 //holña
 