//Name: Syed Zain Haider

//making all the do files 

clear all

cd "C:\Users\Syed Zain Haider\Desktop\Sproj\pslm2019"

use "secc1", clear
isid hhcode idc
merge 1:1 hhcode idc using "secc2"
keep if _m==3
drop _m

merge 1:1 hhcode idc using "sece"
keep if _m==3
drop _m

merge 1:1 hhcode idc using "roster"
keep if _m==3
drop _m

//gen year=2020
keep hhcode sc1q05 sc2q08 sc2q10 sc2q12_2 sc2q13_1 sc2q13_2 seaq04 seaq07 seaq06 seaq05 seaq08 idc province region district sb1q4 age sb1q2 sb1q7 seaq01 seaq03 seaq18 seaq10 seaq15 seaq17 seaq19 seaq21 sc2q11 

duplicates report hhcode
duplicates tag hhcode , gen (tag_dup)
drop tag_dup
duplicates drop hhcode, force
drop idc

rename sc1q05 Education 
rename sc2q08 Internet_Used_3months
rename sc2q12_2 where_they_used_internet
rename sc2q13_1 Purpose_ofusing_Internet
rename seaq04 Nature_of_Work
rename seaq05 Nature_ofworkdoneby_Enterprise 
rename seaq06 Employment_Status //for Zaid
rename seaq08 Income
rename sb1q4 Gender
rename sc2q10 Frequency
rename sb1q2 HH_Head
rename sb1q7 marital_status
rename seaq01 primary_occupation
rename seaq03 enterpriseorservices
rename seaq10 primary_earning
rename seaq15 secondary_earning
rename seaq17 other_earning
rename seaq18 other_work
rename seaq19 _kind_earning 
rename seaq21 pension
rename  sc2q11  inetrnet_used_last12Months


//-----------------------------------
clear all
cd "C:\Users\Syed Zain Haider\Desktop\Sproj\2016"


//Code:
use "sec_1b", clear
isid hhcode idc
merge 1:1 hhcode idc using "sec_2a"
keep if _m==3
drop _m

merge 1:1 hhcode idc using "sec_ict"
keep if _m==3
drop _m

merge 1:1 hhcode idc using "roster"
keep if _m==3
drop _m

//gen year=2017
keep hhcode province idc s2ac05 sictq06 sictq0701 sictq0801 s1bq04 s1bq05 s1bq06 s1bq07 s1bq10 s1aq04 region sictq05 age s1aq07 s1aq02 s1bq01 s1bq03 s1bq15 s1bq17 s1bq18 s1bq19 s1bq21 sictq04 

rename s2ac05 Education 

rename sictq06 inetrnet_used_last12Months
rename sictq04 Internet_Used_3months
rename sictq0701 where_they_used_internet
rename sictq0801 Purpose_ofusing_Internet
rename s1bq04 Nature_of_Work
rename s1bq05 Nature_ofworkdoneby_Enterprise 
rename s1bq06 Employment_Status
rename s1bq10 primary_earning
rename s1aq04 Gender
rename sictq05 Frequency
rename s1aq02 HH_Head
rename s1aq07 marital_status
rename s1bq01 primary_occupation
rename s1bq03 enterpriseorservices
rename s1bq15 secondary_earning
rename s1bq17 other_earning
rename s1bq18 other_work
rename s1bq19 _kind_earning 
rename s1bq21 pension

//-----------------------------------------

clear all
cd "C:\Users\Syed Zain Haider\Desktop\Sproj/2018"

//CODE:

use "sec_2ab", clear
isid hhcode idc
merge 1:1 hhcode idc using "sec 2c"
keep if _m==3
drop _m

merge 1:1 hhcode idc using "sec_1b (2)"
keep if _m==3
drop _m

merge 1:1 hhcode idc using "sec 1a"
keep if _m==3
drop _m

//gen year=2019
keep hhcode province idc s2bq05 s2cq08 s2cq09_1 s2cq10 s2cq11 s2cq13_1 s1bq06 s1bq10 s1bq04 s1bq05 s1aq04 region age s1aq02 s1aq07 s1bq01 s1bq03 s1bq15 s1bq17 s1bq18 s1bq19 s1bq21 s1bq23 

rename s2bq05 Education 
rename s2cq08 Internet_Used_3months
rename s2cq09_1 where_they_used_internet
rename s2cq13_1 Purpose_ofusing_Internet
rename s1bq04 Nature_of_Work
rename s1bq05 Nature_ofworkdoneby_Enterprise 
rename s1bq06 Employment_Status
rename s1bq10 primary_earning
rename s1aq04 Gender
rename s2cq10 Frequency
rename s1aq02 HH_Head
rename s1aq07 marital_status
rename s1bq01 primary_occupation
rename s1bq03 enterpriseorservices
rename s1bq15 secondary_earning
rename s1bq17 other_earning
rename s1bq18 other_work
rename s1bq19 _kind_earning 
rename s1bq21 pension
rename s2cq11 inetrnet_used_last12Months
drop s1bq23



//Appending all data
clear all
cd "C:\Users\Syed Zain Haider\Desktop\Sproj"
use "2019", clear
append using "2018" 
append using "2017"
gen gender=0
replace gender=1 if Gender==2 //1 for female
drop Gender

gen Region=0 //0 for Rural
replace Region=1 if region==2 // 1 for urban
drop region

order district, after(Frequency)

gen Internet_Usedin3months=0 // 0 for no
replace Internet_Usedin3months=1 if Internet_Used_3months==1
drop Internet_Used_3months
//drop Internet_user

gen Internet_Usedin12months=0
replace Internet_Usedin12months=1 if inetrnet_used_last12Months==1
drop inetrnet_used_last12Months


gen Education_Level=1
replace Education_Level=1 if Education==1
replace Education_Level=2 if Education==2
replace Education_Level=3 if Education==3
replace Education_Level=4 if Education==4
replace Education_Level=5 if Education==5
replace Education_Level=6 if Education==6
replace Education_Level=7 if Education==7
replace Education_Level=8 if Education==8
replace Education_Level=9 if Education==9
replace Education_Level=10 if Education==10
replace Education_Level=11 if Education==11
replace Education_Level=12 if Education==12
replace Education_Level=13 if Education==13
replace Education_Level=14 if Education==14
replace Education_Level=15 if Education==15
replace Education_Level=16 if Education==16
replace Education_Level=17 if Education==17
replace Education_Level=18 if Education==18
replace Education_Level=19 if Education==19
replace Education_Level=20 if Education==20
replace Education_Level=21 if Education==21
replace Education_Level=22 if Education==22
replace Education_Level=23 if Education==23
replace Education_Level=24 if Education==24
replace Education_Level=25 if Education==25
replace Education_Level=26 if Education==26
replace Education_Level=27 if Education==27
replace Education_Level=28 if Education==28

drop Education

gen annual_Income=1 //1 for annual income
egen merge_income = concat(seaq07 s1bq07), p(" ")
replace annual_Income=0 if (merge_income==". 1" | merge_income=="1 .")
drop seaq07 s1bq07 merge_income

gen Employment_status=1
replace Employment_status=2 if Employment_Status==2
replace Employment_status=3 if Employment_Status==3
replace Employment_status=4 if Employment_Status==4
replace Employment_status=5 if Employment_Status==5
replace Employment_status=6 if Employment_Status==6
replace Employment_status=7 if Employment_Status==7
replace Employment_status=8 if Employment_Status==8
replace Employment_status=9 if Employment_Status==9


keep if gender==1 //we comment out this if we want data set for general population
gen Finished_primary_school=0
gen Finished__secondary=0
gen Finished_senior_secondary=0
gen Finished_degree=0

replace Finished_primary_school=1 if (Education_Level<=5 | Education_Level==25 | Education_Level==26 | Education_Level==27) 
replace Finished__secondary=1 if (Education_Level<=8)
replace Finished_senior_secondary=1 if (Education_Level<=12)
replace Finished_degree=1 if (Education_Level>13 & Education_Level<=24)

gen Married=0
gen Divorced=0
gen Widowed=0

replace Married=1 if marital_status==2
replace Divorced=1 if marital_status==4
replace Widowed=1 if marital_status==3

gen Household_HEAD=0
replace Household_HEAD=1 if HH_Head==1

gen Primary_Occupation=1 //yes=1
replace Primary_Occupation=0 if primary_occupation==2
drop primary_occupation


gen Enterpriseorservices=3 if (enterpriseorservices==3)
replace Enterpriseorservices=2 if enterpriseorservices==2
replace Enterpriseorservices=1 if enterpriseorservices==1


gen Other_work=1 //1 is yes
replace Other_work=0 if other_work==2
drop other_work



gen EmployedORnot=0
replace EmployedORnot=1 if (Enterpriseorservices==1| Enterpriseorservices==2| Primary_Occupation==1| Other_work==1) //finding total employment



replace EmployedORnot=. if (Enterpriseorservices==. & Primary_Occupation==0 & Other_work==0)

gen where_internet_was_used=.
replace where_internet_was_used=1 if where_they_used_internet==1
replace where_internet_was_used=2 if where_they_used_internet==2
replace where_internet_was_used=3 if where_they_used_internet==3
replace where_internet_was_used=4 if where_they_used_internet==4
replace where_internet_was_used=5 if where_they_used_internet==5
replace where_internet_was_used=6 if where_they_used_internet==6
replace where_internet_was_used=7 if where_they_used_internet==7
replace where_internet_was_used=8 if where_they_used_internet==8
replace where_internet_was_used=9 if where_they_used_internet==9
drop where_they_used_internet

gen long_Income = floor(Income)
gen long_prim = floor(primary_earning)
gen long_sec=floor(secondary_earning)
gen long_oth=floor(other_earning)
gen long_kind=floor(_kind_earning)
gen long_pen=floor(pension)


drop Income
drop primary_earning
drop secondary_earning
drop other_earning
drop _kind_earning
drop pension

egen Total_income = rowtotal(long_Income  long_kind  long_oth long_pen  long_prim  long_sec) //finding total income
replace Total_income=. if (long_Income==. &   long_kind==. & long_oth==. & long_pen==. & long_prim==. & long_sec==.)




gen age_squared=age*age
gen women_age=0
replace women_age=1 if (age>35) //1 if age > 35

gen women_education=0
replace women_education=1 if (Education_Level>=10 & Education_Level<=24)

keep if Total_income!=.



/*
mvreg Total_income EmployedORnot = Internet_Usedin12months age gender Region Finished_primary_school Finished__secondary Finished_senior_secondary Finished_degree Married Divorced Widowed Household_HEAD 

outreg2 using "C:\Users\Syed Zain Haider\Desktop\Sproj", replace word


my table
eststo summstats: estpost summarize EmployedORnot age Finished_primary_school Finished__secondary Finished_senior_secondary Finished_degree HH_Head Married Divorced Widowed Region 
eststo summstats
esttab summstats using table10.rtf, replace cell("mean sd") 

*/


