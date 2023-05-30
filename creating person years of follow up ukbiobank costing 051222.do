

clear all
cd "...\data\"

use ukbiobank_observational_150518a, clear


merge 1:1 n_eid using "...elective_nonelective_other_costs_140219.dta", force

drop if date_attend==. 

tab _merge

distinct n_eid



*gen scottish_assessment_centre=0
replace scottish_assessment_centre=1 if n_54_0_0==11004|n_54_0_0==11005

tab scottish _merge

tab n_4674_0_0 _merge



drop if scottish==1 & record_id==.

tab scottish _merge

tab n_4674_0_0 _merge



///////////////////////////////////////
//Creating person years of follow-up



*Convert person year into years

personage date_attend HES_censor,gen(person_year person_days length_of_year)

gen decimal_days=person_days/length_of_year

gen person_years=person_year+decimal_days


//Create a cost per person-year figure

replace total_cost=0 if record_id==.

replace elective_costs=0 if record_id==. 

replace nonelective_costs =0 if record_id==.

replace other_costs =0 if record_id==.



gen cost_person_year=total_cost/person_years

gen elective_cost_person_year=elective_costs/person_years
gen nonelective_cost_person_year=nonelective_costs/person_years
gen other_cost_person_year=other_costs/person_years


keep n_eid elective_cost_person_year nonelective_cost_person_year other_cost_person_year total_cost



save ukbiobank_bmi_elective_cost_200818.dta, replace


merge 1:1 n_eid using "...bmi_obs_analysis200818.dta"

rename _merge electivemerge

save "...bmi_obs_analysis200818.dta", replace


