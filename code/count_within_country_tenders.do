use "data/derived/ted-columns.dta", clear

count
*count cross-country tenders
count if iso_country_code == win_country_code
count if iso_country_code != win_country_code

* a shorter way of creating a dummy
generate same_country = (iso_country_code == win_country_code)



tabulate same_country
* award_values is very skewed with huge outliers, model log() instead

generate ln_award_value_euro = ln(award_value_euro)
regress ln_award_value_euro same_country, robust
* robust - so the variance is not heterosterostic

histogram ln_award_value_euro, by(same_country)
graph export "figure/value_histogram.pdf"

/*display exp(-1.245)
.28794091

. display 1 - 0.288
.712
/*
if you are in the same country, your value is 72% lower
. 

