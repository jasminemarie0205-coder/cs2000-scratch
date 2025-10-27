use context dcic2024
include csv
include data-source
import lists as L

photos = load-table: location :: String, subject :: String, date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

subject-count=count(photos, "subject") 
value-count= count(subject-count, "value")
subject-sum= sum(value-count, "count")

#oct 6 exercises

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

#get unique discount codes

unique-codes = L.distinct(discount-codes)
#keep only valid codes
#valid codes are codes that are not one

fun is-valid-code(code :: String) -> Boolean:
  doc: "determines when code is not 'none'"
  c = string-to-lower(code)
  if (c == "none"):
    false
  else:
    true
  end
    where:
  is-valid-code("none") is false
  is-valid-code("VIP") is true
  is-valid-code("NONE") is false
  end

valid-codes = unique-codes.filter(is-valid-code)

#convert everything to upper
final-codes= valid-codes.map(string-to-upper)

#exercise 2
survey-answers=[list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

#unique-answers= L.distinct(survey-answers)
survey-lower= L.map(string-to-lower, survey-answers)
unique-answers= L.distinct(survey-lower)

fun is-definitive(code :: String) -> Boolean:
  doc: "returns if input is definitive"
  if (code == "maybe"):
    false
  else:
    true
  end
    
where:
  is-definitive("maybe") is false
  is-definitive("yes") is true
  is-definitive("no") is true
end

definitive-answers=unique-answers.filter(is-definitive)