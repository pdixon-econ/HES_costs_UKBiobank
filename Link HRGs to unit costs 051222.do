



import delimited "....csv", clear 

rename fce_hrg currencycode

*Comment - 21 February - need to recode classpat for some codes (mostly RP codes which can't be matched to RP codes)
*note that this has to be done post-Grouper as the other code creates data for the Grouper


recode classpat (3 4=1) if currency=="AA35E"
recode classpat (3 4=1) if currency=="AA51D"
recode classpat (3 4=1) if currency=="AA53D" 
recode classpat (3 4=1) if currency=="AA54B" 
recode classpat (3 4=1) if currency=="AA54C" 
recode classpat (3 4=1) if currency=="AB12Z" 
recode classpat (3 4=1) if currency=="AB13Z" 
recode classpat (3 4=1) if currency=="BZ24D" 
recode classpat (3 4=1) if currency=="BZ31A" 
recode classpat (3 4=1) if currency=="BZ33Z" 
recode classpat (3 4=1) if currency=="BZ40Z" 
recode classpat (3 4=1) if currency=="BZ41A" 
recode classpat (3 4=1) if currency=="BZ51A" 
recode classpat (3 4=1) if currency=="BZ51B" 
recode classpat (3 4=1) if currency=="BZ53B" 
recode classpat (3 4=1) if currency=="BZ61B" 
recode classpat (3 4=1) if currency=="BZ62B" 
recode classpat (3 4=1) if currency=="BZ63B" 
recode classpat (3 4=1) if currency=="BZ64A" 
recode classpat (3 4=1) if currency=="BZ64B" 
recode classpat (3 4=1) if currency=="BZ70Z" 
recode classpat (3 4=1) if currency=="BZ71A" 
recode classpat (3 4=1) if currency=="BZ74A" 
recode classpat (3 4=1) if currency=="BZ83B" 
recode classpat (3 4=1) if currency=="BZ84B" 
recode classpat (3 4=1) if currency=="BZ90Z" 
recode classpat (3 4=1) if currency=="BZ91A" 
recode classpat (3 4=1) if currency=="BZ91B" 
recode classpat (3 4=1) if currency=="BZ92B" 
recode classpat (3 4=1) if currency=="BZ94A" 
recode classpat (3 4=1) if currency=="BZ94B" 
recode classpat (3 4=1) if currency=="BZ95Z" 
recode classpat (3 4=1) if currency=="CA03A" 
recode classpat (3 4=1) if currency=="CA03B" 
recode classpat (3 4=1) if currency=="CA04A" 
recode classpat (3 4=1) if currency=="CA10A" 
recode classpat (3 4=1) if currency=="CA11A" 
recode classpat (3 4=1) if currency=="CA14Z" 
recode classpat (3 4=1) if currency=="CA15Z" 
recode classpat (3 4=1) if currency=="CA20Z" 
recode classpat (3 4=1) if currency=="CA21Z" 
recode classpat (3 4=1) if currency=="CA23Z" 
recode classpat (3 4=1) if currency=="CA26Z" 
recode classpat (3 4=1) if currency=="CA28Z" 
recode classpat (3 4=1) if currency=="CA29Z" 
recode classpat (3 4=1) if currency=="CA30A" 
recode classpat (3 4=1) if currency=="CA32A" 
recode classpat (3 4=1) if currency=="CA33Z" 
recode classpat (3 4=1) if currency=="CA50Z" 
recode classpat (3 4=1) if currency=="CA51A" 
recode classpat (3 4=1) if currency=="CA52A" 
recode classpat (3 4=1) if currency=="CA53A" 
recode classpat (3 4=1) if currency=="CA55A" 
recode classpat (3 4=1) if currency=="CA68A" 
recode classpat (3 4=1) if currency=="CA71A" 
recode classpat (3 4=1) if currency=="CA82B" 
recode classpat (3 4=1) if currency=="CA83B" 
recode classpat (3 4=1) if currency=="CA84B" 
recode classpat (3 4=1) if currency=="CA92B" 
recode classpat (3 4=1) if currency=="CA93A" 
recode classpat (3 4=1) if currency=="CA93B" 
recode classpat (3 4=1) if currency=="CA94Z" 
recode classpat (3 4=1) if currency=="CA95Z" 
recode classpat (3 4=1) if currency=="CA97Z" 
recode classpat (3 4=1) if currency=="CA98Z" 
recode classpat (3 4=1) if currency=="CB02C" 
recode classpat (3 4=1) if currency=="CD02A" 
recode classpat (3 4=1) if currency=="CD07A" 
recode classpat (3 4=1) if currency=="DZ10K" 
recode classpat (3 4=1) if currency=="DZ16K" 
recode classpat (3 4=1) if currency=="DZ19K" 
recode classpat (3 4=1) if currency=="DZ33Z" 
recode classpat (3 4=1) if currency=="DZ67Z" 
recode classpat (3 4=1) if currency=="DZ68Z" 
recode classpat (3 4=1) if currency=="ED25C" 
recode classpat (3 4=1) if currency=="ED30C" 
recode classpat (3 4=1) if currency=="ED31C" 
recode classpat (3 4=1) if currency=="EY11Z" 
recode classpat (3 4=1) if currency=="EY17B" 
recode classpat (3 4=1) if currency=="EY23C" 
recode classpat (3 4=1) if currency=="EY30A" 
recode classpat (3 4=1) if currency=="EY30B" 
recode classpat (3 4=1) if currency=="EY31A" 
recode classpat (3 4=1) if currency=="EY32B" 
recode classpat (3 4=1) if currency=="EY40C" 
recode classpat (3 4=1) if currency=="EY40D" 
recode classpat (3 4=1) if currency=="EY41C" 
recode classpat (3 4=1) if currency=="EY41D" 
recode classpat (3 4=1) if currency=="EY42B" 
recode classpat (3 4=1) if currency=="EY42C" 
recode classpat (3 4=1) if currency=="EY42D" 
recode classpat (3 4=1) if currency=="EY43C" 
recode classpat (3 4=1) if currency=="EY43D" 
recode classpat (3 4=1) if currency=="FD02D" 
recode classpat (3 4=1) if currency=="FD03E" 
recode classpat (3 4=1) if currency=="FD03G" 
recode classpat (3 4=1) if currency=="FD10D" 
recode classpat (3 4=1) if currency=="FE10B" 
recode classpat (3 4=1) if currency=="FE10D" 
recode classpat (3 4=1) if currency=="FE36Z" 
recode classpat (3 4=1) if currency=="FF21D" 
recode classpat (3 4=1) if currency=="FF31D" 
recode classpat (3 4=1) if currency=="FF32C" 
recode classpat (3 4=1) if currency=="FF33B" 
recode classpat (3 4=1) if currency=="FF34C" 
recode classpat (3 4=1) if currency=="FF40B" 
recode classpat (3 4=1) if currency=="FF60D" 
recode classpat (3 4=1) if currency=="FF61B" 
recode classpat (3 4=1) if currency=="FF62B" 
recode classpat (3 4=1) if currency=="GA07D" 
recode classpat (3 4=1) if currency=="GA07E" 
recode classpat (3 4=1) if currency=="GA10J" 
recode classpat (3 4=1) if currency=="GA10M" 
recode classpat (3 4=1) if currency=="GA10N" 
recode classpat (3 4=1) if currency=="GA13B" 
recode classpat (3 4=1) if currency=="GB06G" 
recode classpat (3 4=1) if currency=="GB10Z" 
recode classpat (3 4=1) if currency=="GB12Z" 
recode classpat (3 4=1) if currency=="HC20M" 
recode classpat (3 4=1) if currency=="HC30D" 
recode classpat (3 4=1) if currency=="HC30E" 
recode classpat (3 4=1) if currency=="HC62C" 
recode classpat (3 4=1) if currency=="HE41D" 
recode classpat (3 4=1) if currency=="HE42B" 
recode classpat (3 4=1) if currency=="HN12D" 
recode classpat (3 4=1) if currency=="HN12F" 
recode classpat (3 4=1) if currency=="HN13F" 
recode classpat (3 4=1) if currency=="HN22E" 
recode classpat (3 4=1) if currency=="HN24B" 
recode classpat (3 4=1) if currency=="HN25A" 
recode classpat (3 4=1) if currency=="HN32B" 
recode classpat (3 4=1) if currency=="HN32C" 
recode classpat (3 4=1) if currency=="HN33B" 
recode classpat (3 4=1) if currency=="HN33C" 
recode classpat (3 4=1) if currency=="HN52C" 
recode classpat (3 4=1) if currency=="HN53B" 
recode classpat (3 4=1) if currency=="HN53C" 
recode classpat (3 4=1) if currency=="HN54C" 
recode classpat (3 4=1) if currency=="HN65Z" 
recode classpat (3 4=1) if currency=="HT14C" 
recode classpat (3 4=1) if currency=="HT24C" 
recode classpat (3 4=1) if currency=="HT33D" 
recode classpat (3 4=1) if currency=="HT63D" 
recode classpat (3 4=1) if currency=="JA30Z" 
recode classpat (3 4=1) if currency=="JA38B" 
recode classpat (3 4=1) if currency=="JA38C" 
recode classpat (3 4=1) if currency=="JA45Z" 
recode classpat (3 4=1) if currency=="KA09D" 
recode classpat (3 4=1) if currency=="KA09E" 
recode classpat (3 4=1) if currency=="LA09L" 
recode classpat (3 4=1) if currency=="LB13F" 
recode classpat (3 4=1) if currency=="LB19F" 
recode classpat (3 4=1) if currency=="LB20D" 
recode classpat (3 4=1) if currency=="LB21A" 
recode classpat (3 4=1) if currency=="LB21B" 
recode classpat (3 4=1) if currency=="LB25F" 
recode classpat (3 4=1) if currency=="LB33Z" 
recode classpat (3 4=1) if currency=="LB35D" 
recode classpat (3 4=1) if currency=="LB38E" 
recode classpat (3 4=1) if currency=="LB43Z" 
recode classpat (3 4=1) if currency=="LB48Z" 
recode classpat (3 4=1) if currency=="LB51B" 
recode classpat (3 4=1) if currency=="LB53D" 
recode classpat (3 4=1) if currency=="LB54A" 
recode classpat (3 4=1) if currency=="LB57C" 
recode classpat (3 4=1) if currency=="LB57D" 
recode classpat (3 4=1) if currency=="LB58C" 
recode classpat (3 4=1) if currency=="LB59Z" 
recode classpat (3 4=1) if currency=="LB60E" 
recode classpat (3 4=1) if currency=="LB61F" 
recode classpat (3 4=1) if currency=="LB62D" 
recode classpat (3 4=1) if currency=="LB64D" 
recode classpat (3 4=1) if currency=="LB65D" 
recode classpat (3 4=1) if currency=="LB70D" 
recode classpat (3 4=1) if currency=="LB79Z" 
recode classpat (3 4=1) if currency=="MA02C" 
recode classpat (3 4=1) if currency=="MA03D" 
recode classpat (3 4=1) if currency=="MA33Z" 
recode classpat (3 4=1) if currency=="MA34Z" 
recode classpat (3 4=1) if currency=="MC20Z" 
recode classpat (3 4=1) if currency=="NZ21Z" 
recode classpat (3 4=1) if currency=="NZ22Z" 
recode classpat (3 4=1) if currency=="NZ27Z" 
recode classpat (3 4=1) if currency=="NZ72Z" 
recode classpat (3 4=1) if currency=="WH06Z" 
recode classpat (3 4=1) if currency=="WH07B" 
recode classpat (3 4=1) if currency=="WH53A" 
recode classpat (3 4=1) if currency=="WJ06C" 
recode classpat (3 4=1) if currency=="WJ06F" 
recode classpat (3 4=1) if currency=="YA10Z" 
recode classpat (3 4=1) if currency=="YF04C" 
recode classpat (3 4=1) if currency=="YQ14Z" 
recode classpat (3 4=1) if currency=="YQ15Z" 
recode classpat (3 4=1) if currency=="YQ23B" 
recode classpat (3 4=1) if currency=="YQ40Z" 
recode classpat (3 4=1) if currency=="YR30Z" 
recode classpat (3 4=1) if currency=="YR31Z" 
recode classpat (3 4=1) if currency=="YR32Z"

recode classpat (3 4=2) if currency=="JC44Z"

recode classpat (2=1) if currency=="DZ52Z"
recode classpat (2=1) if currency=="ED24C"
recode classpat (2=1) if currency=="GA16Z"
recode classpat (2=1) if currency=="YQ11C"




 //Comment 25 April 2018- the recoding above was done to avoid issues with currency codes appearing under Regular day or night attender not actually being present in the RD RN unit cost section etc
 
 
 //Distinguish between elective and non-elective admissions for purposes of costing, using conservative coding based on the HES Admitted Patient Care data dictionary
 
 gen elective=0
 replace elective=1 if admimeth=="11"|admimeth=="12"|admimeth=="13"|admimeth=="81"
 
 //Drop if episode not completed
 
drop if epistat==1


save "....dta", replace

/////////////////////////////////////////////////////////////////////////////////

/*Import the HRGs and combine across elective and non-elective,


*/

////////////////////////////////////////////////////////////////////////////////

*Import NES 

import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("NES")  clear


drop in 1/5

keep A C D

rename A currencycode

rename C nes_fce

rename D nes_unit_cost

destring nes_fce nes_unit_cost, replace

save  "....dta", replace


////////////////////////////////////////////////////////////////////////////////

import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("EL")  clear

drop in 1/5

keep A C D

rename A currencycode

rename C el_fce

rename D el_unit_cost

destring el_fce el_unit_cost, replace

save  "....dta", replace

/////

import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("NEL")  clear

drop in 1/5

keep A C D

rename A currencycode

rename C nel_fce

rename D nel_unit_cost

destring nel_f nel_u, replace

save  "....dta", replace



///////////////////////////////////////////////////////////////
*Merge the hrg datasets
///////////////////////////////////////////////////////////////

use "....dta", clear

cap drop _merge

merge m:1 currencycode using "....dta"

rename _merge el_nel_merge

label define elective_non 1 "NEL only" 2 "EL only" 3 "Both EL and NEL"

label values el_nel_merge elective_non



tab el_nel_merge 


merge m:1 currencycode using "....dta"

rename _merge el_nel_nes_merge


tab el_nel_merge el_nel_nes_merge,m

/*

                |         el_nel_nes_merge
   el_nel_merge | master on  using onl  matched ( |     Total
----------------+---------------------------------+----------
       NEL only |         1          0          7 |         8 
        EL only |        24          0        105 |       129 
Both EL and NEL |        37          0      2,288 |     2,325 
              . |         0         16          0 |        16 
----------------+---------------------------------+----------
          Total |        62         16      2,400 |     2,478 
 

this cross-tab reveals that there are 16 found only under NES
There are no NEL codes that feature only in NEL and that are not also in NES
Therefore reasonable to treat the costs from NES as a piece with the EL and NEL codes and calculate a weighted average
*Note will need to change the code below in case there are codes with NES only


*/




gen nel_nes_sum=nel_fce+nes_fce
gen nel_nes_share_nel=nel_fce/nel_nes_sum
gen nel_nes_share_nes=nes_fce/nel_nes_sum

gen nel_nes_unit_cost=(nel_unit_cost*nel_nes_share_nel)+(nes_unit_cost*nel_nes_share_nes)


gen el_nes_sum=el_fce+nes_fce
gen el_nes_share_el=el_fce/el_nes_sum
gen el_nes_share_nes=nes_fce/el_nes_sum

gen el_nes_unit_cost=(el_unit_cost*el_nes_share_el)+(nes_unit_cost*el_nes_share_nes)





....dta", replace

////////////////////////////////////////////////////////////////////////////////
*Get unit costs of consultant led and non-consultant led attendances


import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("CL")  clear

rename A currencycode

rename E number_attendances

rename F cl_unit_cost

drop if strpos(D, "Paediatric")!=0

drop in 1/5

keep currency number cl_

destring num, replace
destring cl, replace

egen total_attend=total(number),by(currency)

gen attend_share=number/total

gen weighted_unit_cost=attend_share*cl_

egen cl_weighted_unit_cost=total(weighted_unit_cost),by(currency)

duplicates drop currency, force


save  "Y....dta", replace




import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("NCL")  clear

rename A currencycode

rename E number_attendances

rename F ncl_unit_cost

drop if strpos(D, "Paediatric")!=0

drop in 1/5

keep currency number ncl_

destring num, replace
destring ncl, replace

egen ncl_total_attend=total(number),by(currency)

gen attend_share=number/ncl_total_attend

gen weighted_unit_cost=attend_share*ncl_unit_

egen ncl_weighted_unit_cost=total(weighted_unit_cost),by(currency)

duplicates drop currency, force


save  "....dta", replace

merge 1:1 currencycode using "....dta",

*Comment - everything is matched

gen total_attendances=ncl_total_attend+total_attend
gen ncl_total_share=ncl_total_attend/total_attendances
gen cl_total_share=total_attend/total_attendances

gen weighted_cl_ncl_cost=ncl_total_share*ncl_weighted_unit_cost + cl_total_share*cl_weighted_unit_cost

keep currency weighted_cl_ncl_cost


save "....dta", replace

append using "....dta"



save "....dta", replace


////////////////////////////////////////////////////////////////////////////////

/*Generate the zero cost HRG codes and add them to the file

"National cost collection guidance 2018"		
Table 10: Zero-cost HRGs HRG Description Rationale 
DZ13A Cystic fibrosis with CC score 1+ Costs should be reported against cystic fibrosis year-of-care currencies
DZ13B Cystic fibrosis with CC score 0 PD13A Paediatric cystic fibrosis with CC score 5+
LA97A Same-day dialysis admission or attendance, 19 years and over Costs should be reported against the LD HRGs
LA97B Same-day dialysis admission or attendance, 18 years and under PB03Z Healthy baby Costs should be reported as part of the maternity delivery episode
SB97Z Chemotherapy core HRGs Costs should be reported as the unbundled delivery code 
SC97Z Radiotherapy core HRG Costs should be reported under the unbundled delivery code
RD97Z Diagnostic imaging core HRG Costs should be reported under the unbundled radiology HRG 
RN97Z Nuclear medicine core HRG Costs should be reported under the unbundled HRG		
	
*/
////////////////////////////////////////////////////////////////////////////////

clear

set obs 8

gen str currencycode=""

replace currencycode="DZ13A" in 1
replace currencycode="DZ13B" in 2
replace currencycode="LA97A" in 3
replace currencycode="LA97B" in 4
replace currencycode="SB97Z" in 5
replace currencycode="SC97Z" in 6
replace currencycode="RD97Z" in 7
replace currencycode="RN97Z" in 8

gen unit_cost=0

save "Y....dta", replace

use "....dta", clear

append using "....dta"

cap rename _merge zero_merge

duplicates drop currencycode, force

save "....dta", replace


////////////////////////////////////////////////////////////////////////////////



use "....dta", clear

rename _merge old_merge


tab classpat
keep if classpat==1


merge m:1 currencycode    using "....dta"


rename _merge merge_unitcosts_fce  

tab merge_unitcosts_fce  


//Merge = 2 are codes in unit costs but which didn't happen to be used in this group, and therefore we can drop them


*tab currency if merge_unitcosts_fce==2

drop if merge_unit==2

tab currency if merge_unitcosts_fce==1


*keep eid provspno currencycode admidate epistart admidate startage sex merge_unitcosts unit_cost classpat


sort eid


gen apc_ok=0
replace apc_ok=1 if currencycode=="UZ01Z"

egen apc_cost_ok=total(apc_ok), by(eid)

drop apc_ok

//

su unit_cost

**Adding in NES merge here...

replace unit_cost=nel_unit_cost if el_nel_merge==1 & el_nel_nes_merge==1
replace unit_cost=el_unit_cost if el_nel_merge==2 & el_nel_nes_merge==1
replace unit_cost=nel_unit_cost if el_nel_nes_merge==1 & el_nel_merge==3 & elective==0
replace unit_cost=el_unit_cost if el_nel_nes_merge==1 & el_nel_merge==3 & elective==1

replace unit_cost=nel_nes_unit_cost if el_nel_merge==3 & elective==0 & el_nel_nes_merge==3
replace unit_cost=el_nes_unit_cost if el_nel_merge==3 & elective==1 & el_nel_nes_merge==3

replace unit_cost=nes_unit_cost if el_nel_nes_merge==2

replace unit_cost=nel_nes_unit_cost if el_nel_merge==1 & el_nel_nes_merge==3
replace unit_cost=el_nes_unit_cost if el_nel_merge==2 & el_nel_nes_merge==3

//Include the consultant led costs

replace unit_cost=weighted_cl_ncl_cost if currency=="WF01A"|currency=="WF02A"

//ADD in new code (February 2019) to look at elective v non elective


//New code

gen elective_unit_cost=0
gen nonelective_unit_cost=0

replace nonelective_unit_cost=nel_unit_cost if el_nel_merge==1 & el_nel_nes_merge==1
replace elective_unit_cost=el_unit_cost if el_nel_merge==2 & el_nel_nes_merge==1
replace nonelective_unit_cost=nel_unit_cost if el_nel_nes_merge==1 & el_nel_merge==3 & elective==0
replace elective_unit_cost=el_unit_cost if el_nel_nes_merge==1 & el_nel_merge==3 & elective==1

replace nonelective_unit_cost=nel_nes_unit_cost if el_nel_merge==3 & elective==0 & el_nel_nes_merge==3
replace elective_unit_cost=el_nes_unit_cost if el_nel_merge==3 & elective==1 & el_nel_nes_merge==3

replace nonelective_unit_cost=nes_unit_cost if el_nel_nes_merge==2

replace nonelective_unit_cost=nel_nes_unit_cost if el_nel_merge==1 & el_nel_nes_merge==3
replace elective_unit_cost=el_nes_unit_cost if el_nel_merge==2 & el_nel_nes_merge==3

//Put the extremely small number of CL into non-elective
replace nonelective_unit_cost=weighted_cl_ncl_cost if currency=="WF01A"|currency=="WF02A"

egen apc_cost=total(unit_cost), missing  by(eid) 


egen elective_cost=total(elective_unit_cost), missing  by(eid) 
egen nonelective_cost=total(nonelective_unit_cost), missing  by(eid) 

gen elective_share=elective_cost/apc_cost
gen nonelective_share=nonelective_cost/apc_cost



//Comment - all zero costs relate to zero cost HRGs or ungrouped UZ01Z codes

duplicates drop eid, force



tab currency if apc_cost==. & nel_unit_cost==. & el_unit_cost==. & nes_unit_cost==. & nel_nes_unit_cost==. & el_nes_unit_cost==.


save "...dta", replace

////////////////////////////////////////////////////////////////////////////////////////
*Day cases (classpat==2)


import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("DC")  clear

drop in 1/5

keep A D

rename A currencycode

rename D unit_cost

destring u, replace


append using "....dta"

append using "....dta",



save  "....dta", replace




*Merge unit costs to the grouper

use "....dta" , clear

cap drop _merge

tab classpat
keep if classpat==2


merge m:1 currencycode    using "....dta"


rename _merge merge_unitcosts_dc  


drop if merge==2  

tab merge 

tab currency if merge==1

//



gen dc_ok=0
replace dc_ok=1 if currencycode=="UZ01Z"

egen dc_cost_ok=total(dc_ok), by(eid)

drop dc_ok



egen dc_cost=total(unit_cost),  by(eid) 

duplicates drop eid, force

save "....dta", replace


////////////////////////////////////////////////////////////////////////////////
//Regular attenders

import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("RP")  clear

drop in 1/5

keep A D

rename A currencycode

rename D unit_cost

destring u, replace


append using "....dta"

append using "....dta",


save  "....dta", replace

//Combining with Grouper output

use "....dta" , clear

cap drop _merge

tab classpat
keep if classpat==3|classpat==4


merge m:1 currencycode    using "....dta"

rename _merge merge_unitcosts_rp 

//This merge is ok - only unmatched from master are the UZ01Z codes

tab merge

drop if merge==2






gen rp_ok=0
replace rp_ok=1 if currencycode=="UZ01Z"

egen rp_cost_ok=total(rp_ok), by(eid)

drop rp_ok

egen rp_cost=total(unit_cost), missing  by(eid) 

duplicates drop eid, force

save "....dta", replace

////////////////////////////////////////////////////////////////////////////////

*HANDLING EXCESS BED DAYS 

////////////////////////////////////////////////////////////////////////////////

import excel using "Y...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("EL_XS")  clear

drop in 1/5

keep A C D

rename A currencycode

rename C ebd_el

rename D el_xs_unit_cost

destring el_xs_u ebd, replace

save  "....dta", replace


///////


import excel using "...National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("NEL_XS")  clear

drop in 1/5

keep A C D

rename A currencycode

rename C ebd_nel

rename D nel_xs_unit_cost

destring nel_xs_u ebd, replace

save  "....dta", replace



merge 1:m currencycode using "....dta"

rename _merge el_nel_xs_merge

save  "....dta", replace



use "....dta", clear

cap drop _merge

drop if fceexcessbeddays==0


*rename fce_hrg currencycode

save "....dta", replace

use "....dta", clear

cap drop _merge

merge m:1 currencycode using "...s.dta"

tab _merge


*Comment - some variables not matched...using only (xs_merge=2) because these are codes not used by those in the dataset

 tab currency if _merge==1




/*


 tab currency if _merge==1

      FCE_HRG |      Freq.     Percent        Cum.
--------------+-----------------------------------
        CA40Z |          1       20.00       20.00
        DZ13A |          1       20.00       40.00
        WF01A |          1       20.00       60.00
        WF02A |          2       40.00      100.00
--------------+-----------------------------------
        Total |          5      100.00



Comment  - the codes above are not associated with excess bed days in 2016/17 reference costs, and are assumed to be errors and therefore dropped from further analysis:


*/

drop if _merge==1

drop if _merge==2



//Create xs_unit_cost

tab el_nel_xs_merge

gen xs_unit_cost=.

replace xs_unit_cost=nel_xs_unit if el_nel_xs_merge==1 
replace xs_unit_cost=el_xs_unit if el_nel_xs_merge==2

replace xs_unit_cost=el_xs_unit if el_nel_xs_merge==3 & elective==1
replace xs_unit_cost=nel_xs_unit if el_nel_xs_merge==3 & elective==0




//

rename _merge ebd_xs_merge

gen xs_apc=.
replace xs_apc=fceexcessbeddays*xs_unit_cost if fceexcessbeddays!=0 & fceexcessbeddays!=.
replace xs_apc=. if currencycode=="UZ01Z"


egen total_xs_apc=total(xs_apc), missing by(eid)


duplicates drop eid, force


save "....dta", replace 


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

*UNBUNDLED HRGS 


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


use "....dta", clear

cap drop _merge

keep eid provspno currencycode unbundledhrgs v* record_id

foreach var of varlist unbun-v228 {
split `var',p(*)

}

*Comment all of these variables have to be changed

rename unbundledhrgs1 unbun1
rename unbundledhrgs2 unbun1_multiple

rename v2111 unbun2
rename v2112 unbun2_multiple

rename v2121 unbun3
rename v2122 unbun3_multiple

rename v2131 unbun4
rename v2132 unbun4_multiple

rename v2141 unbun5
rename v2142 unbun5_multiple

rename v2151 unbun6
rename v2152 unbun6_multiple

rename v2161 unbun7
rename v2162 unbun7_multiple

rename v2171 unbun8
rename v2172 unbun8_multiple

rename v2181 unbun9
gen unbun9_multiple=1 

rename v2191 unbun10
rename v2192 unbun10_multiple

rename v2201 unbun11
rename v2202 unbun11_multiple

rename v2211 unbun12
rename v2212 unbun12_multiple

rename v2221 unbun13
gen unbun13_multiple=1 


rename v2231 unbun14
gen unbun14_multiple=1 


rename v2241 unbun15
gen unbun15_multiple=1 


rename v2251 unbun16
gen unbun16_multiple=1 


rename v2261 unbun17
gen unbun17_multiple=1 


rename v2271 unbun18
gen unbun18_multiple=1 


rename v2281 unbun19
gen unbun19_multiple=1 


foreach num of numlist 1/19 {


destring unbun`num'_multiple, replace

}

foreach num of numlist 1/19 {

replace unbun`num'_multiple=1 if unbun`num'!="" & unbun`num'_multiple==.

}



save "....dta", replace
use "....dta", clear




foreach num of numlist 1/19 {

import excel using "..._-_National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("Total HRGs")  clear

drop in 2820

drop in 1/6


keep A  D

rename A unbun`num'

rename D unbun_unit_cost`num'


destring unbun_unit_cost, replace

save "....dta", replace

}


foreach num of numlist 1/19 {

use "....dta", clear

keep if unbun`num'!=""

merge m:1 unbun`num' using "....dta"



gen unbundled_cost_`num'=unbun_unit_cost`num'*unbun`num'_multiple if _merge==3 & unbun`num'!=""

recode unbundled_cost_`num' (.=0) 

rename _merge unbundled_merge_`num'

egen total_unbun_cost_`num'=total(unbundled_cost_`num') if unbundled_merge_`num'==3,  by(eid) //May 3rd - Keep on eye on the merge issue as remarked in the notes below

duplicates drop eid, force

*One unbundled HRG from the top line of the file has crept in:

drop if unbun`num'=="AA22C"



save "....dta", replace

}

//Check on the unmerged data


foreach num of numlist 1/3 {

use  "...dta", clear

tab unbundled_merge_`num'

list unbun`num' if unbundled_merge_`num'==1

}

*Comment - the above shows that only unmerged codes are UZ01Z codes and so are not costed
	


use "....dta", clear

foreach num of numlist 2/19 {

cap drop _merge

append using "....dta", 

*drop _merge




}


sort eid



egen rowmin_cost=rowmin(total_unbun_cost_1-total_unbun_cost_19)

by eid: egen total_unbun_cost=total(rowmin_cost)

drop rowmin_cost

duplicates drop eid, force

keep eid total_unbun_cost record_id


save "....dta", replace

*Note that zeroes in the total cost are due to UZ01Z codes for the unbundled HRGs




////////////////////////////////////////////////////////////////////////////////







import excel using "..._-_National_schedule_of_reference_costs_-_the_main_schedule.xlsx", sheet("Total HRGs")  clear



drop in 2820

drop in 1/6


keep A  D

rename A currencycode

rename D maternity_unit_cost


destring maternity_u, replace

set obs 2814

replace currencycode="DZ13B" in 2814
replace maternity_unit_cost=0 in 2814

save "....dta", replace




//Combining with unit costs


use "....dta" , clear

cap drop _merge

tab classpat
keep if classpat==5|classpat==8


merge m:1 currencycode    using "....dta"

rename _merge merge_unitcosts_maternity 

tab merge
tab currencycode if merge==1

drop if merge==2


//


gen mat_ok=0
replace mat_ok=1 if currencycode=="UZ01Z"

egen mat_cost_ok=total(mat_ok), by(eid)

drop mat_ok


egen mat_cost=total(maternity_unit_cost), missing by(eid) 



duplicates drop eid, force

sort eid


save "....dta", replace

*Note the sole zero cost entries in the mat_cost variable are due to a zero-cost HRG



////////////////////////////////////////////////////////////////////////////////

*CREATING A MASTER COST FILE

////////////////////////////////////////////////////////////////////////////////

cd "..."

use "....dta", clear

cap drop _merge

merge 1:1 eid using dc_costs.dta

rename _merge merge_apc_dc

merge 1:1 eid using rp_costs.dta

rename _merge merge_apc_dc_rp

merge 1:1 eid using per_patient_ebd_costs.dta

rename _merge merge_apc_dc_rp_ebd

merge 1:1 eid using total_costs_unbundled_hrgs.dta 

rename _merge merge_apc_dc_rp_ebd_unbun

merge 1:1 eid using mat_costs.dta

rename _merge merge_apc_dc_rp_ebd_unbun_mat



save "....dta", replace

//Check that all eid appear in this dataset:

distinct eid

use "....dta", clear

distinct eid

use "....dta", clear

//Create a marker for data ok


gen cost_ok=1

foreach var of varlist apc_cost_ok dc_cost_ok rp_cost_ok {

replace cost_ok=0 if `var'>0 &`var'<.

}


*Create an overall cost figure


egen total_cost=rowtotal(apc_cost dc_cost rp_cost total_xs_apc total_unbun_cost mat_cost)

replace total_cost=. if cost_ok==0

//Comment 14 Feb 2019 - consider keeping all *cost variables

keep eid epistart currencycode cost_ok total_cost record_id epistat *cost *share

gen apc_share=apc_cost/total_cost

rename eid n_eid

save "....dta", replace

use "....dta", clear

//Work out shares for elective and non elective


gen elective_total_share=elective_share*apc_share

gen nonelective_total_share=nonelective_share*apc_share

//Comment - if we crudely apply this are we at risk of describing patients as having elective when they only have non elective
//And so we should create the cost figures

gen elective_costs=total_cost*elective_total_share
gen nonelective_costs=total_cost*nonelective_total_share

egen total_el_nel_cost=rowtotal(elective_costs nonelective_costs)

gen other_costs=total_cost-total_el_nel_cost

//Recode negative other costs - arises because of rounding issue

replace other_costs=0 if other_costs<0



*keep n_eid elective_costs nonelective_costs other_costs other_costs_share elective_total_share nonelective_total_share apc_cost total_cost

save "....dta", replace







