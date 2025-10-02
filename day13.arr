use context dcic2024
import math as M
import statistics as S
include csv

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

#Create a list for the number of drinks, and compute the total drinks sold across all days using M.sum.

num-drinks= cafe-data.get-column("drinks-sold")
total-drinks =M.sum(num-drinks)

#Using the cafe data from the intro, extract the "day" column and determine which day appears first alphabetically using M.min.
days = cafe-data.get-column("day")
alph-days = M.min(days)
#Create a list for the number of drinks, and compute the total drinks sold across all days using M.sum.
#Create a new table of student quiz scores:
quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end
#Extract each quiz column and calculate the class average for each quiz using S.mean. Which quiz had the highest average?

avg-1= S.mean(quiz-scores.get-column("quiz1"))
avg-2= S.mean(quiz-scores.get-column("quiz2"))
avg-3= S.mean(quiz-scores.get-column("quiz3"))
all-avg= [list: avg-1, avg-2, avg-3]
highest-avg=M.max(all-avg)

#Create a list directly using the syntax [list: 12, 8, 15, 22, 5, 18] and use functions from the math library to find the minimum, maximum, and sum. What's the range (difference between max and min)?

#STEP 1:Load the employees dataset from https://data.boston.gov/dataset/employee-earnings-report using the CSV URL (as in Day 9). 
#STEP 2:Transform the "REGULAR" column to numbers using the string-to-number-unsafe helper from Day 9, 
#STEP 3:extract it as a list and calculate the average regular salary across all employees.


fun string-to-number-unsafe(s :: String) -> Number:
  doc: "Converts the given string to a number, returning 0 if not well formatted"
  string-to-number(string-replace(s, ",", "")).or-else(0)
where:
  string-to-number-unsafe("1234") is 1234
  string-to-number-unsafe("-1.3") is -1.3
  string-to-number-unsafe("hello") is 0
end

employee-data= load-table: name :: String, dep-name :: String, title :: String, regular :: Number, retro :: Number, other :: Number, overtime :: Number, injured :: Number, detail :: Number, quinn-education :: Number, total-gross :: Number, postal :: String
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end

new-employee-data=transform-column(employee-data,"regular",string-to-number-unsafe)

avg-reg= S.mean(new-employee-data.get-column("regular"))
rounded-avg-reg = num-round(avg-reg)