*1.Day_5_Application_Assignment_Master.do

/*
	Master program for Day 5 Application Assignment
	
	(1) Assemble data on several environmental and economic indicators (global panel)
	(2) Create figures
	(3) Run regressions 
*/ 


set more off

* Lucie's directory
if "`c(username)'" == "lucietalikoff" {
	di "lucietalikoff"
	global Day5 "/Users/lucietalikoff/Documents/UVA 2026 Bootcamp/Group-Data-Brief_Day05"
}
// if the username of the person logged into the computer is lucietalikoff, stata will type lucietalikoff in the display (acts as a visual confirmation of whose user path was loaded), and then use this specific subfolder called Group-Data-Brief_Day05 under the folder UVA 2026 Bootcamp that belongs to lucietalikoff whenever "$Day5" is typed 

* Other users' directories 
if "`c(username)'" == "USERNAME" {
	di "USERNAME" 
	global Day5 "USER DIRECTORY"
}
// if someone other than lucietalikoff is running this, they can put in their username and working directory and then every time they are running this, it will type their username in the display (again acting as a visual confirmation of whose user path was loaded), and then use their specific folder that belongs to them whenever "$Day5" is typed

	global RawData "$Day5/data/raw"
	global ProcessedData "$Day5/data/processed"
	global Figures "$Day5/output/figures" 
	global Statistics "$Day5/output/statistics"
	global Tables "$Day5/output/tables"
	global Programs "$Day5/code/programs/Stata Scripts"
// when you type RawData, it will use your subfolder called raw inside the folder called data that is in your folder called Group-Data-Brief_Day05 that is inside your folder called UVA 2026 Bootcamp 

	cd "$Day5"
// working directory set as what your global HAZARDS_VULNERABILITY set it as, aka Levinson RA for lucietalikoff

* Set Stata version to be backwards compatible 
	version 18

* Data assembly
	do "$Programs/2.Day_5_Application_Assignment_Data.do" 
// this goes to the subfolder of Levinson RA (or otherwise) that is called Programs and it pulls and runs the do-file called "Hazards_Vulnerability_Data.do" 

* Correlations 
	do "$Programs/3.Day_5_Application_Assignment_Correlations.do"

* Figures 
	do "$Programs/4.Day_5_Application_Assignment_Figures.do"

* Tables
	do "$Programs/5.Day_5_Application_Assignment_Tables.do" 
