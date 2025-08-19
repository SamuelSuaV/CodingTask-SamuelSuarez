* 				   [[Research Assistantship Coding Task]]
*					 			 Analysis

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
 
 log using "$script/log_analysis.txt" , replace text
  
 * Load processed data
  
 use "$processed_data/build_dofile.dta"
  
 * Set year as the time variable
  
 tsset country_id year, yearly
  
  
 // TS plots
  
 * country id's can be found using: label list country_id
 * graphed country id's 176 25 42 65 69 (USA BRAZIL COLOMBIA FRANCE GERMANY)
  
  
 * Log GDP
 
 twoway ///
    (line log_cgdpo_capita year if country_id == 176, lcolor(blue)) ///
    (line log_cgdpo_capita year if country_id == 25, lcolor(red)) ///
    (line log_cgdpo_capita year if country_id == 42, lcolor(green)) ///
    (line log_cgdpo_capita year if country_id == 65, lcolor(orange)) ///
    (line log_cgdpo_capita year if country_id == 69, lcolor(purple)), ///
    title("Evolution of log output side GDP per capita") ///
	subtitle("For USA, Brazil, Colombia, France and Germany (1990-2019)") ///
    legend(order(1 "USA" 2 "Brazil" 3 "Colombia" 4 "France" 5 "Germany")) ///
	ytitle("Log output side GDP per capita") ///
	note("GDP per capita measured at current PPPs in 2017 USD")
	
 graph save "$output/log_gdp_capita_graph.gph", replace
 
 
 * Log TFP
 
  twoway ///
    (line log_ctfp year if country_id == 176, lcolor(blue)) ///
    (line log_ctfp year if country_id == 25, lcolor(red)) ///
    (line log_ctfp year if country_id == 42, lcolor(green)) ///
    (line log_ctfp year if country_id == 65, lcolor(orange)) ///
    (line log_ctfp year if country_id == 69, lcolor(purple)), ///
    title("Evolution of log total factor productivity") ///
	subtitle("For USA, Brazil, Colombia, France and Germany (1990-2019)") ///
    legend(order(1 "USA" 2 "Brazil" 3 "Colombia" 4 "France" 5 "Germany")) ///
	ytitle("Log total factor productivity") ///
	note("TFP measured at current PPPs (USA = 1)")
	
 graph save "$output/log_tfp_graph.gph", replace

 
  * Labor share
  
   twoway ///
    (line labsh year if country_id == 176, lcolor(blue)) ///
    (line labsh year if country_id == 25, lcolor(red)) ///
    (line labsh year if country_id == 42, lcolor(green)) ///
    (line labsh year if country_id == 65, lcolor(orange)) ///
    (line labsh year if country_id == 69, lcolor(purple)), ///
    title("Evolution of the labor share") ///
	subtitle("For USA, Brazil, Colombia, France and Germany (1990-2019)") ///
    legend(order(1 "USA" 2 "Brazil" 3 "Colombia" 4 "France" 5 "Germany")) ///
	ytitle("Labor share") ///
	note("Labor share measured at current national prices")
	
 graph save "$output/log_tfp_graph.gph", replace
 
 // Cumulative growth plots
  
 * Cumulative GDP growth
 
 twoway ///
    (area cum_gr_cgdpo_capita year if country_id == 176, fcolor(blue%10) ///
    lcolor(blue)) ///
    (area cum_gr_cgdpo_capita year if country_id == 25, fcolor(red%10) ///
    lcolor(red)) ///
    (area cum_gr_cgdpo_capita year if country_id == 42, fcolor(green%10) ///
    lcolor(green)) ///
    (area cum_gr_cgdpo_capita year if country_id == 65, fcolor(orange%10) ///
    lcolor(orange)) ///
    (area cum_gr_cgdpo_capita year if country_id == 69, fcolor(purple%10) ///
    lcolor(purple)), ///
    title("Evolution of cumulative output side GDP growth since 1990") ///
    subtitle("For USA, Brazil, Colombia, France and Germany (until 2019)") ///
    legend(order(1 "USA" 2 "Brazil" 3 "Colombia" 4 "France" 5 "Germany")) ///
    ytitle("Cumulative GDP per capita growth") ///
    note("GDP per capita measured at current PPPs")
	
  graph save "$output/cumgrowth_gdp_capita_graph.gph", replace
  
  
   * Cumulative TFP growth
 
 twoway ///
    (area cum_gr_ctfp year if country_id == 176, fcolor(blue%20) ///
	lcolor(blue)) ///
    (area cum_gr_ctfp year if country_id == 25, fcolor(red%20) ///
	lcolor(red)) ///
    (area cum_gr_ctfp year if country_id == 42, fcolor(green%20) ///
	lcolor(green)) ///
    (area cum_gr_ctfp year if country_id == 65, fcolor(orange%20) ///
	lcolor(orange)) ///
    (area cum_gr_ctfp year if country_id == 69, fcolor(purple%20) ///
	lcolor(purple)), ///
    title("Evolution of cumulative total factor productivity growth since 1990") ///
    subtitle("For USA, Brazil, Colombia, France and Germany (until 2019)") ///
    legend(order(1 "USA" 2 "Brazil" 3 "Colombia" 4 "France" 5 "Germany")) ///
    ytitle("Cumulative total factor productivity growth") ///
    note("TFP measured at current PPPs (USA = 1))")
	
  graph save "$output/cumgrowth_tfp_graph.gph", replace
  
  * Cumulative labor share growth 
  
 twoway ///
    (area cum_gr_labsh year if country_id == 176, fcolor(blue%20) ///
	lcolor(blue)) ///
    (area cum_gr_labsh year if country_id == 25, fcolor(red%20) ///
	lcolor(red)) ///
    (area cum_gr_labsh year if country_id == 42, fcolor(green%20) ///
	lcolor(green)) ///
    (area cum_gr_labsh year if country_id == 65, fcolor(orange%20) ///
	lcolor(orange)) ///
    (area cum_gr_labsh year if country_id == 69, fcolor(purple%20) ///
	lcolor(purple)), ///
    title("Evolution of cumulative labor share growth since 1990") ///
    subtitle("For USA, Brazil, Colombia, France and Germany (until 2019)") ///
    legend(order(1 "USA" 2 "Brazil" 3 "Colombia" 4 "France" 5 "Germany")) ///
    ytitle("Cumulative labor share growth") ///
    note("Labor share measured at current national prices")
	
 graph save "$output/cumgrowth_labsh_graph.gph", replace
  
 // Scatter plots
  
 preserve 
  
 * Cumulative GDP vs TFP growth
  
   keep if year == 2019 // We eliminate points outside of 2019, to measure
					  // cumulative growth only by this year
					  
					  
   centile cum_gr_cgdpo_capita, centile(1 99)
   keep if cum_gr_cgdpo_capita >= r(c_1) & cum_gr_cgdpo_capita <= r(c_2)
										// We eliminate the 1% tail ends of
										// the distribution to avoid outliers
											
   centile cum_gr_ctfp, centile(1 99) // TFP outliers
   keep if cum_gr_ctfp >= r(c_1) & cum_gr_ctfp <= r(c_2)
   
	twoway ///
		(scatter cum_gr_cgdpo_capita cum_gr_ctfp ///
			if !inlist(country, "United States", "Brazil", "Colombia", "France", "Germany"), ///
			mcolor(black%20)) /// All other countries in black
		(scatter cum_gr_cgdpo_capita cum_gr_ctfp ///
			if inlist(country, "United States"), mcolor(blue) ///
			mlabel(country) mlabcolor(blue)) /// Label for USA
		(scatter cum_gr_cgdpo_capita cum_gr_ctfp ///
			if inlist(country, "Brazil"), mcolor(red) ///
			mlabel(country) mlabcolor(red)) /// Label for Brazil
		(scatter cum_gr_cgdpo_capita cum_gr_ctfp ///
			if inlist(country, "Colombia"), mcolor(green) ///
			mlabel(country) mlabcolor(green) mlabposition(6)) /// Label for Colombia
		(scatter cum_gr_cgdpo_capita cum_gr_ctfp ///
			if inlist(country, "France"), mcolor(orange) ///
			mlabel(country) mlabcolor(orange)) /// Label for France
		(scatter cum_gr_cgdpo_capita cum_gr_ctfp ///
			if inlist(country, "Germany"), mcolor(purple) ///
			mlabel(country) mlabcolor(purple)), /// Label for Germany
		title("Relationship between  TFP and cumulative GDP growth" ///
		  "from 1990 to 2019") ///
		xtitle("Total factor productivity (current PPPs, USA = 1)") ///
		ytitle("Cumulative GDP per capita growth") ///
		legend(off) ///
		note("Cumulative growth from 1990 to 2019")
		
  graph save "$output/cumgrowthgdp_ctfp_graph.gph", replace
  
 restore
  
 preserve
		
		
 * Cumulative labor share growth vs GDP per capita
	
  keep if year == 2019
	
  centile cum_gr_labsh, centile(1 99) // Cum. Labsh growth outliers
  keep if cum_gr_labsh >= r(c_1) & cum_gr_labsh <= r(c_2)									
											
  centile cum_gr_cgdpo_capita, centile(1 99) // TFP outliers
  keep if cum_gr_cgdpo_capita >= r(c_1) & cum_gr_cgdpo_capita <= r(c_2) 
   
	
	twoway ///
		(scatter cum_gr_labsh cum_gr_cgdpo_capita ///
			if !inlist(country, "United States", "Brazil", "Colombia", "France", "Germany"), ///
			mcolor(black%20)) /// All other countries in black
		(scatter cum_gr_labsh cum_gr_cgdpo_capita ///
			if inlist(country, "United States"), mcolor(blue) mlabposition(9) ///
			mlabel(country) mlabcolor(blue)) /// Label for USA
		(scatter cum_gr_labsh cum_gr_cgdpo_capita ///
			if inlist(country, "Brazil"), mcolor(red) ///
			mlabel(country) mlabcolor(red)) /// Label for Brazil
		(scatter cum_gr_labsh cum_gr_cgdpo_capita ///
			if inlist(country, "Colombia"), mcolor(green) ///
			mlabel(country) mlabcolor(green)) /// Label for Colombia
		(scatter cum_gr_labsh cum_gr_cgdpo_capita ///
			if inlist(country, "France"), mcolor(orange) ///
			mlabel(country) mlabcolor(orange)) /// Label for France
		(scatter cum_gr_labsh cum_gr_cgdpo_capita ///
			if inlist(country, "Germany"), mcolor(purple) ///
			mlabel(country) mlabcolor(purple)), /// Label for Germany
		title("Relationship between cumulative labor share and" ///
			  "GDP per capita growth from 1990 to 2019") ///
		xtitle("Cumulative GDP per capita growth") ///
		ytitle("Cumulative labor share growth (current national prices)") ///
		legend(off) ///
		note("Cumulative growth from 1990 to 2019")

		
	  graph save "$output/cumgrowthlabsh_gdp_graph.gph", replace
		
 restore

  
  