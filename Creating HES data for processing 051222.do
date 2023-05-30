

import delimited ".....tsv", clear

/*

First need to extra compulsory variables from the main Biobank dataset: id, age, and sex, and a code indicating whether data were taken from HES, SMR, etc and date variables to determine start age

*/
clear
set maxvar 10000
cd "....data\"

infile using "ukb11032.dct" in 1/100000, using("ukb11032.raw")

keep n_eid n_21022_0_0 n_31_0_0 n_41253_0_0 n_41253_0_1 n_41253_0_2 n_41253_0_3 n_41253_0_4 n_41253_0_5 n_54_0_0 n_21022_0_0 n_40007_0_0 n_34_0_0  n_52_0_0 s_53_0_0 n_21022_0_0 

save id_age_sex_100000.dta, replace


//

clear
set maxvar 10000
infile using "ukb11032.dct" in 100001/200000, using("ukb11032.raw")

keep n_eid n_21022_0_0 n_31_0_0 n_41253_0_0 n_41253_0_1 n_41253_0_2 n_41253_0_3 n_41253_0_4 n_41253_0_5 n_54_0_0 n_21022_0_0 n_40007_0_0 n_34_0_0  n_52_0_0 s_53_0_0 n_21022_0_0 

save id_age_sex_200000.dta, replace


clear
set maxvar 10000
infile using "ukb11032.dct" in 200001/300000, using("ukb11032.raw")

keep n_eid n_21022_0_0 n_31_0_0 n_41253_0_0 n_41253_0_1 n_41253_0_2 n_41253_0_3 n_41253_0_4 n_41253_0_5 n_54_0_0 n_21022_0_0 n_40007_0_0 n_34_0_0  n_52_0_0 s_53_0_0 n_21022_0_0 

save id_age_sex_300000.dta, replace


clear
set maxvar 10000
infile using "ukb11032.dct" in 300001/400000, using("ukb11032.raw")

keep n_eid n_21022_0_0 n_31_0_0 n_41253_0_0 n_41253_0_1 n_41253_0_2 n_41253_0_3 n_41253_0_4 n_41253_0_5 n_54_0_0 n_21022_0_0 n_40007_0_0 n_34_0_0  n_52_0_0 s_53_0_0 n_21022_0_0 

save id_age_sex_400000.dta, replace

clear
set maxvar 10000
infile using "ukb11032.dct" in 400001/500000, using("ukb11032.raw")

keep n_eid n_21022_0_0 n_31_0_0 n_41253_0_0 n_41253_0_1 n_41253_0_2 n_41253_0_3 n_41253_0_4 n_41253_0_5 n_54_0_0 n_21022_0_0 n_40007_0_0 n_34_0_0  n_52_0_0 s_53_0_0  n_21022_0_0 

save id_age_sex_500000.dta, replace

clear
set maxvar 10000
infile using "ukb11032.dct" in 500001/502618, using("ukb11032.raw")

keep n_eid n_21022_0_0 n_31_0_0 n_41253_0_0 n_41253_0_1 n_41253_0_2 n_41253_0_3 n_41253_0_4 n_41253_0_5 n_54_0_0 n_21022_0_0 n_40007_0_0 n_34_0_0  n_52_0_0 s_53_0_0  n_21022_0_0 

save id_age_sex_502617.dta, replace

////////Now append the newly created datasets to a single file 

use id_age_sex_100000.dta, clear

foreach num of numlist 200000 300000 400000 500000 502617 {
append using id_age_sex_`num'
}




label define m_0009 1 "Male" 0 "Female"
label define m_0263 12 "Patient Episode Data for Wales (PEDW) in-patient Data" 10 "Scottish Morbidity Register 1A (SMR 1a)" 6 "English HES Data" 9 "Scottish Morbidity Register 1B (SMR 1B)"

label values n_31_0_0 m_0009
label values n_41253_0_0 m_0263
label values n_41253_0_1 m_0263
label values n_41253_0_2 m_0263
label values n_41253_0_3 m_0263
label values n_41253_0_4 m_0263
label values n_41253_0_5 m_0263

rename n_31_0_0 sex

*rename n_21022_0_0 age

rename n_eid eid //to facilitate merge with HES data

/////////////////////////////////////////////////////////////////////////////////////////////////////////




/*
)


Coding of centres in n_54_0_0

10003	Stockport (pilot)
11001	Manchester
11002	Oxford
11003	Cardiff
11004	Glasgow
11005	Edinburgh
11006	Stoke
11007	Reading
11008	Bury
11009	Newcastle
11010	Leeds
11011	Bristol
11012	Barts
11013	Nottingham
11014	Sheffield
11015	Leicester
11016	Liverpool
11017	Middlesborough
11018	Hounslow
11019	Barking
11020	Croydon
11021	Birmingham
11022	Swansea
11023	Wrexham


*/
//
gen scottish_assessment_centre=0
replace scottish_assessment_centre=1 if n_54_0_0==11004|n_54_0_0==11005




/*

...see as a start: http://biobank.ctsu.ox.ac.uk/crystal/field.cgi?id=41253

30	ASCEND RCP In Patient Data
6	English HES Data
24	HES (Genomics England)
8	HES Critical Care Data
20	HPS HES Data
3	IC Cancer Registry 2012-
23	IC Cancers (2016 Onwards)
16	Migration data set
17	Migration data set (Scottish)
13	National Cancer Intelligence Network (NCIN) return
11	PEDW GP Data
21	PEDW HES 2015
12	PEDW In-Patient Data
2	Post 2012 IC Death Data
1	Pre 2012 IC Death Data
14	Registry Return Data (aka "was flagged")
10	UKB SMR 01A (HES)
9	UKB SMR 01B (HES)
7	SMR Death Data
15	SMR01B-V2
22	Scots Cancer PT_ID (2012 Onwards)
4	Scots Cancer Registry (Fixed Width) 2012-
5	Scots Death Certificates (Hand Coded)
50	THRIVE Specific Death Cert (Pre 2012)
18	UK HES In Patient (2015 format)
40	UK RR
41	UK TR
19	UKB SMR 99B (Death) - 2015
28	SMR01B-V3
60	HES Critical Care (2015)
65	SMR06 (2016)
70	UK HES Inpatients (2017 format)

*/




tab n_41253_0_0  


foreach num of numlist 0/5 {

gen England_Wales_HES_`num'=0

replace England_Wales_HES_`num'=1 if n_41253_0_`num'==6|n_41253_0_`num'==18|n_41253_0_`num'==21|n_41253_0_`num'==12

replace England_Wales_HES_`num'=. if n_41253_0_`num'==.
}








//
*Save this dataset //Re_run and tidy the file before going much further

save id_age_sex_040418.dta, replace


//////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
*OPENING THE DIAGNOSIS DATASET
////////////////////////////////////////////////////////////////////////////////


import delimited ".....tsv", clear

//Save as a Stata version file to facilitate subsequent merging

save ".....dta", replace

sort eid rec arr

//Following code makes sure that arr_index is consecutive within record_ids, and corrects if not
//This is important as arr_index is important for subsequent code

gen flag_arr=1 if record==record[_n-1] & arr==arr[_n-1]

recode arr (0=1) (1=0) if flag_arr==1 //Not clear which method of the observations should be coded as zero/one so this recoding is arbitrary

drop flag_arr

//Main data manipulation follows

sort eid rec arr

egen max_arr_index=max(arr_index), by (record_id) //Useful as a rough check on data manipulations

gen diag_max_arr=max_arr_index+1

drop max_arr_index






foreach num of numlist 0/18 {

gen diag`num'="" if diag_max==`num'

}
sort eid rec arr

replace diag0=diag_icd10 if arr==0 

//Code below puts, for reach record, all diagnosis codes on the the arr_index=0 line

foreach num of numlist 1/18 {

replace diag`num'=diag_icd10[_n+`num'] if arr_index[_n+`num']==`num'

}

drop diag_icd10

rename diag_icd10_nb notes_diag_data

sort eid rec arr

keep if arr==0 //Keep only records with list of all diagnoses per record

//Check no duplications of record_id 

distinct record

//Final sort before saving

sort eid rec arr

foreach num of numlist 0/18 {
foreach i of numlist 2/20 {
cap rename diag`num' diag_`i'
}
}


save  ".....dta", replace




////////////////////////////////////////////////////////////////////////////////
*OPENING THE OPERATIONS DATASET
////////////////////////////////////////////////////////////////////////////////


import delimited ".....tsv", clear

//Save as Stata format to facilitate 

save ".....dta", replace

sort eid record arr

//Following code makes sure that arr_index is consecutive within record_ids, and corrects if not
//This is important as arr_index is important for subsequent code

gen flag_arr=1 if record==record[_n-1] & arr==arr[_n-1]

recode arr (0=1) (1=0) if flag_arr==1 //Not clear which method of the observations should be coded as zero/one so this recording is arbitrary but probably not material

drop flag_arr

//Main data manipulation follows:



egen max_arr_index=max(arr_index), by (record_id) //Useful as a rough check on data manipulations

gen oper_max_arr=max_arr_index+1

drop max_arr_index

*gen oper_0=oper4 

rename oper4 operations

foreach num of numlist 1/23 {

gen oper`num'="" if oper_max==`num'

}
sort eid rec arr



foreach num of numlist 1/23 {

replace oper`num'=operations[_n+`num'] if arr_index[_n+`num']==`num'

}

rename operations oper0
rename oper4_nb notes_to_oper0

order eid oper_max oper*








sort eid rec arr

keep if arr==0

sort eid rec arr

foreach num of numlist 0/23 {
foreach i of numlist 2/24 {

cap rename oper`num' oper_`i'

}
}

drop oper23

save  ".....dta", replace

////////////////////////////////////////////////////////////////////////////////


*NOW OPEN MAIN HES DATASET 

////////////////////////////////////////////////////////////////////////////////


import delimited  "....7.tsv" , clear


sort eid

//Need to save data in stata format for joining/merging

save "....7.dta", replace

use ".....dta", clear



////////////////////////////////////////////////////////////////////////////////
*Merge in the other HES data 

//Merge in diagnosis dataset

merge m:1 record using ".....dta"

sort eid record

drop _merge

//Merge in operations dataset

merge m:1 record using ".....dta"

sort eid record

drop _merge


save ".....dta", replace

use ".....dta", clear

//Merge in age/sex data from main Biobank file

merge m:1 eid using ".....dta"

save ".....dta", replace


use "....dta", clear

///////////////////////////////////////////////////////////////////////////////
*DROP DATES BEFORE 1 APRIL 2006 


*Need to destring epistart and epiend and admidate

gen date_epistart=date(epistart, "YMD", 2050)
format date_epistart %td
drop epistart
rename date_epistart epistart


gen date_epiend=date(epiend, "YMD", 2050)
format date_epiend %td
drop epiend
rename date_epiend epiend


gen date_admidate=date(admidate, "YMD", 2050)
format date_admidate %td
drop admidate
rename date_admidate admidate


//Retain only data post April 2016, based on either epistart or admidate if epistart missing
gen finyear_2006_string="1April2006"

gen finyear_2006=date(finyear_2006_string,"DMY")

drop finyear_2006_string

format finyear %td

drop if epistart<finyear_2006 

drop if admidate<finyear_2006 & epistart==.  //This code drops observations with early admission date (e.g. in the 1980s) and missing epistart data
/////////////////////

////////////////////////////////////////////////////////////////////////////////
*Restrict HES data to refer to period ON or AFTER the baseline apppointment 
////////////////////////////////////////////////////////////////////////////////


*Get the relevant variable

drop if epistart<date_attend


////////////////////////////////////////////////////////////////////////////////
/*
Allow for censoring: 

Email from Biobank, 17 April 2018: "“Yes, his assumption is correct. Any death/ admission/ cancer registration 
after the censoring date has occurred, but a lack of death/ admission/ cancer registration after the censoring date doesn’t mean a participant hasn’t experienced one of them.”
*/
///////////////////////////////////////////////////////////////////////////////

gen string_HES_censor_date="31Mar2015"
gen HES_censor_date=date(string_HES_censor_date, "DMY")
format HES_censor_date %td
drop string_HES_censor

drop if epistart>HES_censor_date & epistart!=.

//Drop episodes with any non-English/non-Wales episodes 
foreach var of varlist England_Wales_HES_0-England_Wales_HES_5 {

drop if `var'==0

}

///////////////////////////////////////////////////////////////////////////////////

*Check for duplicate entries in this dataset	
///////////////////////////////////////////////////////////////////////////////

*Open original datasets and check on scale of issue there to make sure not caused by merging or whatever


sort  epistart epiorder epiend


*Identify and drop duplicates
		
gsort eid epistart epiorder epiend  admidate disdate  tretspef mainspef oper4 oper_2-oper_24 diag_icd10 diag_2-diag_20
count
duplicates tag eid epistart epiorder epiend  admidate disdate  tretspef mainspef oper4 oper_2-oper_24 diag_icd10 diag_2-diag_20, gen(dup)
		
tab dup
		
duplicates drop eid epistart epiorder epiend  admidate disdate  tretspef mainspef oper4 oper_2-oper_24 diag_icd10 diag_2-diag_20, force
		
*check no duplicates remain
duplicates tag eid epistart epiorder epiend  admidate disdate  tretspef mainspef oper4 oper_2-oper_24 diag_icd10 diag_2-diag_20, gen(dup2)

tab dup2
drop dup dup2


////////////////////////////////////////////////////////////////////////////////
*Calculate start age for Grouper
////////////////////////////////////////////////////////////////////////////////

personage final_dob epistart, gen(initial_startage)

distinct eid if initial_startage==. & _m==3
*Code above indicates that there are 102 instances where matched code
*Replace with an age based on admidate if available, otherwise use the age at recruitment variable, or use most recent age if that is available

replace epistart=admidate if admidate!=. & epistart==. &initial_start==. & _m==3


personage final_dob epistart, gen(revised_startage)

replace revised_startage=age_at_recruitment if admidate==. &	epistart==. &	initial_startage==.
		

gen startage=.
replace startage=initial_startage if initial_startage!=.
replace startage=revised_startage if initial_startage==.

///////////////////////////////////////
*Renaming diagnosis variables to make it easier to match to grouper requirements when creating the record definition file 

rename diag_icd10 diag_1
rename diag_icd10_nb  notes_to_diag10


*Renaming the operations variables present in the main dataset
rename oper4 oper_1 



////////////////////////////////////////////////////////////////////////////////
*Generate variables needed for the grouper 

*CRITICALCARE DAYS
gen criticalcaredays =0

*REHABILITATIONDAYS

gen rehabilitationdays=0 


*SPCDAYS

gen spcdays=0




//Remove some unneed variables

drop oper_max diag_max

//replace missing epiorder variables to avoid Grouper issues 

recode epiorder (.=99)

recode epiorder (0=1)

//PROVSPNO and PROCODET - 18 January 2018 following advice from NHS Digital
/*
"As you are only interested in the episode level derivations a simple solution will be to give all records an arbitrary provider code and a unique spell number.  As stated in the User Manual the provider code is not validated, so using XXX for the PROCODET will suffice.  
For the PROVSPNO values you could number them incrementally from 1.  
This will force the grouper to consider them all single episode spells."

*/

sort eid


gen procodet="XXX"
gen provspno=_n





//Order variables for processing by grouper - maybe delete or rename some of the awkward diagnosis/operations variables to make it simple for the creation of the RDF

order  procodet provspno epiorder startage sex classpat admisorc admimeth disdest dismeth epidur mainspef neocare tretspef diag_* oper_* criticalcaredays rehab spcdays eid 


//Recoding of tretspef - note that "&" is the code for not known by Grouper still rejects it


replace tretspef ="300" if tretspef=="620"|tretspef=="810"|tretspef=="820"|tretspef=="900"|tretspef=="990"|tretspef==""
replace tretspef ="300" if tretspef=="&"



//Recode mainspef]
//510 is an outpatient code 

replace mainspef="300" if mainspef==""|mainspef=="&"|mainspef=="191"||mainspef=="620"
replace mainspef="501" if mainspef=="510"|mainspef=="520"

//Recode classpat - comment grouper doesn't like code 9 despite being in data dictionary  so have recoded to ordinary admission

replace classpat="1" if classpat==""

//Recode neocare

replace neocare=8 if neocare==.

//Recode admisorc 
replace admisorc = "52" if admisorc=="56"
replace admisorc = "53" if admisorc=="55"|admisorc=="57"
replace admisorc="99" if admisorc=="89"|admisorc=="86"|admisorc==""


//Recode admimeth 

////////////////////////////////////////////////////////////////////////////////
*Account for the post-2013/14 coding for certain admimeth variables - see data dictionary entry on admimeth for more details

gen string_admimeth_newvar_date="1Apr2013"
gen admimeth_newvar_date=date(string_admimeth_newvar_date, "DMY")
format admimeth_newvar_date %td
drop string_admimeth_newvar_date

replace admimeth="13" if admimeth=="14"|admimeth=="15"
replace admimeth="29" if admimeth=="28"
replace admimeth="24" if admimeth=="25" & epistart<admimeth_newvar_date 
replace admimeth="24" if admimeth=="27"
replace admimeth="28" if admimeth=="25"|admimeth=="29" //comment - admimeth=25 already recoded in previous line
replace admimeth="99" if epistart<admimeth_newvar_date & admimeth=="2A"|admimeth=="2B"|admimeth=="2D"|admimeth==""

//Recoding of discharge method

replace dismeth=9 if dismeth==.



//Recoding of discharge destination 

replace disdest="53" if disdest=="57"
replace disdest="52" if disdest=="56"
replace disdest="51" if disdest=="55"
replace disdest="29" if disdest=="39"
replace disdest="99" if disdest==""
replace disdest="85" if disdest=="86"

*Some recording to allow epidur to be calculated epidur

replace epistart=epiend if epistart==. & epiend!=. &epiend==admidate
replace epistart=admidate if epistart==. & epiend!=. &epiend>admidate


*Wrong order of dates - first create some running variabless

gen running_start_date=epistart
gen running_end_date=epiend

replace epistart=running_end_date if epistart!=. & epiend!=. & epistart>epiend &epiend!=. & epiend>=admidate

replace epiend=epistart if epistart!=. & admidate!=. & epistart==admidate & epiend<admidate 


replace epidur=epiend-epistart if epidur==. & epiend!=. & epistart!=. & epiend>=epistart


replace epidur=0 if epidur==. & diag_1!="" & epiend==. & epistart!=. 


//


sort eid




//Tidying diagnosis

foreach num of numlist 1/20 {
gen length_diag_`num' = strlen(diag_`num')

}



foreach num of numlist 1/20 {

replace diag_`num' ="C800" if diag_`num'=="C80"
replace diag_`num'="A090" if diag_`num'=="A09"
replace diag_`num'="A499" if diag_`num'=="A38"
replace diag_`num'="A928" if diag_`num'=="A90"
replace diag_`num'="A090" if diag_`num'=="A09"
replace diag_`num'="C800" if diag_`num'=="C80"
replace diag_`num'="C833" if diag_`num'=="C834"
replace diag_`num'="C839" if diag_`num'=="C836"
replace diag_`num'="C844" if diag_`num'=="C843"
replace diag_`num'="C857" if diag_`num'=="C850"
replace diag_`num'="C857" if diag_`num'=="C850"
replace diag_`num'="C947" if diag_`num'=="C912"
replace diag_`num'="C947" if diag_`num'=="C945"
replace diag_`num'="C969" if diag_`num'=="C961"
replace diag_`num'="C967" if diag_`num'=="C963"
replace diag_`num'="D097" if diag_`num'=="D099"
replace diag_`num'="D367" if diag_`num'=="D369"
replace diag_`num'="D464" if diag_`num'=="D463"
replace diag_`num'="D473" if diag_`num'=="D752"
replace diag_`num'="D473" if diag_`num'=="D752"
replace diag_`num'="C965" if diag_`num'=="D760"
replace diag_`num'="F109" if diag_`num'=="F10"
replace diag_`num'="F328" if diag_`num'=="F32"
replace diag_`num'="G908" if diag_`num'=="G903"
replace diag_`num'="H549" if diag_`num'=="H547"
replace diag_`num'="K648" if diag_`num'=="I48"
replace diag_`num'="K648" if diag_`num'=="I840"
replace diag_`num'="K648" if diag_`num'=="I846"
replace diag_`num'="K648" if diag_`num'=="I841"
replace diag_`num'="K648" if diag_`num'=="I842"
replace diag_`num'="K648" if diag_`num'=="I843"
replace diag_`num'="K648" if diag_`num'=="I844"
replace diag_`num'="K648" if diag_`num'=="I845"
replace diag_`num'="K648" if diag_`num'=="I846"
replace diag_`num'="K648" if diag_`num'=="I847"
replace diag_`num'="K648" if diag_`num'=="I848"
replace diag_`num'="K649" if diag_`num'=="I849"
replace diag_`num'="N189" if diag_`num'=="N180"  
replace diag_`num'="K850" if diag_`num'=="K85"  
replace diag_`num'="K518" if diag_`num'=="K511"
replace diag_`num'="K297" if diag_`num'=="K29"
replace diag_`num'="K358" if diag_`num'=="K350"
replace diag_`num'="K358" if diag_`num'=="K351"
replace diag_`num'="K358" if diag_`num'=="K359"
replace diag_`num'="K858" if diag_`num'=="K85"
replace diag_`num'="L149" if diag_`num'=="L142"
replace diag_`num'="L418" if diag_`num'=="L412"
replace diag_`num'="L899" if diag_`num'=="L89"
replace diag_`num'="L899" if diag_`num'=="L896"
replace diag_`num'="L896" if diag_`num'=="L899"
replace diag_`num'="L899" if diag_`num'=="L896"
replace diag_`num'="M638" if diag_`num'=="M723"
replace diag_`num'="M638" if diag_`num'=="M725"    
replace diag_`num'="M728" if diag_`num'=="M725"
replace diag_`num'="N189" if diag_`num'=="N180" 
replace diag_`num'="N189" if diag_`num'=="N188"
replace diag_`num'="O601" if diag_`num'=="O60"
replace diag_`num'="P238" if diag_`num'=="P231"
replace diag_`num'="R508" if diag_`num'=="R500"
replace diag_`num'="R508" if diag_`num'=="R501"
replace diag_`num'="T021" if diag_`num'=="T08"
replace diag_`num'="T008" if diag_`num'=="T009"
replace diag_`num'="T021" if diag_`num'=="T088"
replace diag_`num'="T093" if diag_`num'=="T08X"
}


//X code:

foreach num of numlist 1/20 {

replace diag_`num' = diag_`num' + "X" if diag_`num'=="B07"| ///
diag_`num'=="A46"| /// 
diag_`num'=="A78"| /// 
diag_`num'=="A86"| ///
diag_`num'=="A89"| ///
diag_`num'=="A94"| /// 
diag_`num'=="B09"| /// 
diag_`num'=="B24"| /// 
diag_`num'=="B49"| ///
diag_`num'=="B54"| ///  
diag_`num'=="B59"| /// 
diag_`num'=="B80"| /// 
diag_`num'=="B86"| /// 
diag_`num'=="B89"| /// 
diag_`num'=="B91"| /// 
diag_`num'=="B99"| /// 
diag_`num'=="C01"| /// 
diag_`num'=="C07"| /// 
diag_`num'=="C12"| /// 
diag_`num'=="C19"| /// 
diag_`num'=="C20"| /// 
diag_`num'=="C23"| ///
diag_`num'=="C33"| /// 
diag_`num'=="C37"| ///  
diag_`num'=="C52"| /// 
diag_`num'=="C55"| /// 
diag_`num'=="C56"| /// 
diag_`num'=="C61"| /// 
diag_`num'=="C64"| ///
diag_`num'=="C65"| ///  
diag_`num'=="C66"| /// 
diag_`num'=="C73"| /// 
diag_`num'=="C97"| /// 
diag_`num'=="D24"| /// 
diag_`num'=="D27"| /// 
diag_`num'=="D34"| /// 
diag_`num'=="D45"| /// 
diag_`num'=="D62"| ///
diag_`num'=="D65"| ///  
diag_`num'=="D66"| /// 
diag_`num'=="D67"| /// 
diag_`num'=="D70"| ///
diag_`num'=="D71"| ///  
diag_`num'=="E02"| /// 
diag_`num'=="E15"| ///
diag_`num'=="E41"| ///
diag_`num'=="E43"| /// 
diag_`num'=="E45"| ///   
diag_`num'=="E46"| /// 
diag_`num'=="E52"| /// 
diag_`num'=="E54"| /// 
diag_`num'=="E58"| ///
diag_`num'=="E60"| ///  
diag_`num'=="E65"| /// 
diag_`num'=="E86"| /// 
diag_`num'=="F03"| ///
diag_`num'=="F09"| ///
diag_`num'=="F21"| /// 
diag_`num'=="F28"| /// 
diag_`num'=="F29"| /// 
diag_`num'=="F39"| /// 
diag_`num'=="F54"| /// 
diag_`num'=="F55"| /// 
diag_`num'=="F61"| /// 
diag_`num'=="F69"| /// 
diag_`num'=="F82"| /// 
diag_`num'=="F89"| ///
diag_`num'=="F99"| /// 
diag_`num'=="G01"| /// 
diag_`num'=="G07"| /// 
diag_`num'=="G08"| /// 
diag_`num'=="G09"| /// 
diag_`num'=="G10"| /// 
diag_`num'=="G14"| /// 
diag_`num'=="G20"| /// 
diag_`num'=="G35"| /// 
diag_`num'=="G64"| /// 
diag_`num'=="G92"| /// 
diag_`num'=="G98"| /// 
diag_`num'=="H46"| /// 
diag_`num'=="H55"| /// 
diag_`num'=="H71"| /// 
diag_`num'=="I00"| /// 
diag_`num'=="I10"| ///
diag_`num'=="I38"| /// 
diag_`num'=="I64"| /// 
diag_`num'=="I81"| /// 
diag_`num'=="I99"| ///
diag_`num'=="J00"| ///
diag_`num'=="J09"| /// 
diag_`num'=="J13"| ///
diag_`num'=="J14"| /// 
diag_`num'=="J22"| ///
diag_`num'=="J36"| ///
diag_`num'=="J40"| ///
diag_`num'=="J42"| ///
diag_`num'=="J46"| ///
diag_`num'=="J47"| /// 
diag_`num'=="J60"| ///
diag_`num'=="J61"| ///
diag_`num'=="J64"| ///
diag_`num'=="J80"| ///
diag_`num'=="J81"| ///
diag_`num'=="J82"| ///
diag_`num'=="J90"| ///
diag_`num'=="J91"| ///
diag_`num'=="K20"| ///
diag_`num'=="K30"| ///
diag_`num'=="K36"| ///
diag_`num'=="K37"| ///
diag_`num'=="L14"| ///
diag_`num'=="L26"| ///
diag_`num'=="L42"| ///
diag_`num'=="L52"| ///
diag_`num'=="L80"| ///
diag_`num'=="L82"| ///
diag_`num'=="L83"| ///
diag_`num'=="L84"| ///
diag_`num'=="L88"| ///
diag_`num'=="L97"| ///
diag_`num'=="M45"| ///
diag_`num'=="N10"| ///
diag_`num'=="N12"| ///
diag_`num'=="N19"| ///
diag_`num'=="N23"| ///
diag_`num'=="N26"| ///
diag_`num'=="N40"| ///
diag_`num'=="N44"| /// 
diag_`num'=="N46"| ///
diag_`num'=="N47"| ///
diag_`num'=="N61"| ///
diag_`num'=="N62"| ///
diag_`num'=="N63"| ///
diag_`num'=="N72"| ///
diag_`num'=="N86"| ///
diag_`num'=="N96"| ///
diag_`num'=="O11"| ///
diag_`num'=="O13"| ///
diag_`num'=="O16"| ///
diag_`num'=="O40"| /// 
diag_`num'=="O48"| ///
diag_`num'=="O85"| /// 
diag_`num'=="O94"| /// 
diag_`num'=="R02"| ///
diag_`num'=="R05"| ///
diag_`num'=="R11"| ///
diag_`num'=="R12"| ///
diag_`num'=="R13"| ///
diag_`num'=="R14"| ///
diag_`num'=="R15"| ///
diag_`num'=="R17"| ///
diag_`num'=="R18"| ///
diag_`num'=="R21"| ///
diag_`num'=="R31"| ///
diag_`num'=="R32"| ///
diag_`num'=="R33"| ///
diag_`num'=="R34"| ///
diag_`num'=="R35"| ///
diag_`num'=="R36"| /// 
diag_`num'=="R42"| ///
diag_`num'=="R51"| ///
diag_`num'=="R53"| ///
diag_`num'=="R54"| ///
diag_`num'=="R55"| ///
diag_`num'=="R58"| ///
diag_`num'=="R64"| ///
diag_`num'=="R71"| ///
diag_`num'=="R72"| ///
diag_`num'=="R80"| ///
diag_`num'=="R81"| ///
diag_`num'=="R91"| ///
diag_`num'=="R92"| ///
diag_`num'=="R99"| ///
diag_`num'=="S16"| ///
diag_`num'=="S47"| ///
diag_`num'=="T10"| ///
diag_`num'=="T16"| ///
diag_`num'=="T55"| ///
diag_`num'=="T58"| ///
diag_`num'=="T66"| ///
diag_`num'=="T68"| ///
diag_`num'=="T71"| ///
diag_`num'=="T96"| ///
diag_`num'=="T97"| ///
diag_`num'=="V98"| ///
diag_`num'=="V99"| ///
diag_`num'=="Y66"| ///
diag_`num'=="Y69"| ///
diag_`num'=="Y86"| ///
diag_`num'=="Y95"| ///
diag_`num'=="Y96"| ///
diag_`num'=="Y97"| ///
diag_`num'=="Z21"| ///
diag_`num'=="Z33" /// 

}


*Cut length of long strings down to 4 characters

foreach num of numlist 1/20 {

gen shorter_diag_`num' = substr(diag_`num', 1, 4)

replace diag_`num'=shorter_diag_`num' if length_diag_`num'>4 & length_diag_`num'!=.

}

foreach num of numlist 1/24 {

replace oper_`num'="" if oper_`num'=="X998"|oper_`num'=="X999"|oper_`num'=="X64"

}

*Tidying of oper codes

foreach num of numlist 1/24 {

replace oper_`num'="A368" if oper_`num'=="A369"
replace oper_`num'="A578" if oper_`num'=="A579"
replace oper_`num'="A818" if oper_`num'=="A819"
replace oper_`num'="B348" if oper_`num'=="B349"
replace oper_`num'="B348" if oper_`num'=="B349"
replace oper_`num'="B348" if oper_`num'=="B359"
replace oper_`num'="B378" if oper_`num'=="B379"
replace oper_`num'="C228" if oper_`num'=="C229"
replace oper_`num'="C248" if oper_`num'=="C249"
replace oper_`num'="C268" if oper_`num'=="C269"
replace oper_`num'="C298" if oper_`num'=="C299"
replace oper_`num'="C378" if oper_`num'=="C379"
replace oper_`num'="C438" if oper_`num'=="C439"
replace oper_`num'="C548" if oper_`num'=="C549"
replace oper_`num'="C678" if oper_`num'=="C679"
replace oper_`num'="C758" if oper_`num'=="C759"
replace oper_`num'="C808" if oper_`num'=="C809"
replace oper_`num'="C848" if oper_`num'=="C849"
replace oper_`num'="C868" if oper_`num'=="C869"
replace oper_`num'="D068" if oper_`num'=="D069"
replace oper_`num'="A368" if oper_`num'=="A369"
replace oper_`num'="D268" if oper_`num'=="D269"
replace oper_`num'="E038" if oper_`num'=="E039"
replace oper_`num'="E088" if oper_`num'=="E089"
replace oper_`num'="E108" if oper_`num'=="E109"
replace oper_`num'="E148" if oper_`num'=="E149"
replace oper_`num'="E168" if oper_`num'=="E169"
replace oper_`num'="E178" if oper_`num'=="E179"
replace oper_`num'="E388" if oper_`num'=="E389"
replace oper_`num'="E598" if oper_`num'=="E599"
replace oper_`num'="F068" if oper_`num'=="F069"
replace oper_`num'="F168" if oper_`num'=="F169"
replace oper_`num'="F208" if oper_`num'=="F208"
replace oper_`num'="F268" if oper_`num'=="F269"
replace oper_`num'="F328" if oper_`num'=="F329"
replace oper_`num'="F488" if oper_`num'=="F489"
replace oper_`num'="G218" if oper_`num'=="G219"
replace oper_`num'="G468" if oper_`num'=="G469"
replace oper_`num'="G528" if oper_`num'=="G529"
replace oper_`num'="H038" if oper_`num'=="H039"
replace oper_`num'="H368" if oper_`num'=="H369"
replace oper_`num'="H468" if oper_`num'=="H469"
replace oper_`num'="H538" if oper_`num'=="H539"
replace oper_`num'="H558" if oper_`num'=="H559"
replace oper_`num'="H568" if oper_`num'=="H569"
replace oper_`num'="A368" if oper_`num'=="A369"
replace oper_`num'="K228" if oper_`num'=="K229"
replace oper_`num'="K628" if oper_`num'=="K629"
replace oper_`num'="L878" if oper_`num'=="L879"
replace oper_`num'="L918" if oper_`num'=="L919"
replace oper_`num'="M158" if oper_`num'=="M159"
replace oper_`num'="M168" if oper_`num'=="M169"
replace oper_`num'="M498" if oper_`num'=="M499"
replace oper_`num'="M548" if oper_`num'=="M549"
replace oper_`num'="M708" if oper_`num'=="M709"
replace oper_`num'="M718" if oper_`num'=="M719"
replace oper_`num'="M758" if oper_`num'=="M759"
replace oper_`num'="M798" if oper_`num'=="M799"
replace oper_`num'="N198" if oper_`num'=="N119"
replace oper_`num'="O138" if oper_`num'=="O13"
replace oper_`num'="O058" if oper_`num'=="O059"
replace oper_`num'="O208" if oper_`num'=="O209"
replace oper_`num'="P098" if oper_`num'=="P099"
replace oper_`num'="A368" if oper_`num'=="A369"
replace oper_`num'="S608" if oper_`num'=="S609"
replace oper_`num'="S628" if oper_`num'=="S629"
replace oper_`num'="S668" if oper_`num'=="S669"
replace oper_`num'="T098" if oper_`num'=="T099"
replace oper_`num'="T298" if oper_`num'=="T299"
replace oper_`num'="T318" if oper_`num'=="T319"
replace oper_`num'="T378" if oper_`num'=="T379"
replace oper_`num'="T568" if oper_`num'=="T569"
replace oper_`num'="T728" if oper_`num'=="T729"
replace oper_`num'="T748" if oper_`num'=="T749"
replace oper_`num'="T918" if oper_`num'=="T919"
replace oper_`num'="U058" if oper_`num'=="U059"
replace oper_`num'="U078" if oper_`num'=="U079"
replace oper_`num'="U118" if oper_`num'=="U119"
replace oper_`num'="U128" if oper_`num'=="U129"
replace oper_`num'="U138" if oper_`num'=="U139"
replace oper_`num'="U158" if oper_`num'=="U159"
replace oper_`num'="U188" if oper_`num'=="U189"
replace oper_`num'="U218" if oper_`num'=="U219"
replace oper_`num'="U238" if oper_`num'=="U239"
replace oper_`num'="U268" if oper_`num'=="U269"
replace oper_`num'="U288" if oper_`num'=="U289"
replace oper_`num'="U358" if oper_`num'=="U359"
replace oper_`num'="U408" if oper_`num'=="U409"
replace oper_`num'="V548" if oper_`num'=="V549"
replace oper_`num'="V688" if oper_`num'=="V679"

replace oper_`num'="W698" if oper_`num'=="W699"
replace oper_`num'="W818" if oper_`num'=="W819"
replace oper_`num'="X598" if oper_`num'=="X599"
replace oper_`num'="X708" if oper_`num'=="X709"
replace oper_`num'="X718" if oper_`num'=="X719"
replace oper_`num'="U178" if oper_`num'=="U179"

}



/*Comment there are a v small number of remaining codes (<100), primarily in the oper_n variables that give Grouping errors
These codes are a mix of incomplete codes, ICD10 codes entered under procedure variables, "unspecified"-type procedures etc. These have been left as is in the absence of obvious replacements. 
*/

  


//

///////////////////////////////////////////////////////////////////////////////
*Change the coding of the sex variable to be acceptable to Grouper

label drop  m_0009
recode sex (0=1) (1=2)

///////////////////////////////////////////////////////////////////////////////


*/		
		///////////////////////////////////////////////////////////////////////////////
*Export to create new datasets for analysis by Grouper
///////////////////////////////////////////////////////////////////////////////

sort eid


//Comment - the 2017/18 REference Costs Grouper was released in March 2018, but corresponding unit costs won't be released til later in year - use 2016/17 code til then but update once available

save "....dta", replace

//Export only values for which HES data was reported ie _m==3

export delimited if _m==3 using "...", replace








