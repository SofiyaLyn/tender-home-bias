use "data/derived/ted-columns.dta", clear

count
*count cross-country tenders
count if iso_country_code != win_country_code

