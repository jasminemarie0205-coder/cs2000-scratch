use context dcic2024

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

#1 Normalize the data -- in particular, the temperature column needs to be all numbers! While the precipitation column seems to have problems (a negative number) since our task doesn't have anything to do with precipitation, we don't need to deal with that.

#2 Create a new column with the three different bins -- cold, mild, or hot.

#3 Chart that new column.


fun normalize-temp(v) -> Number:
  doc: "given a number or a string that represents a number, converts to a number"
  if is-string(v): 
    string-to-number(v).or-else(0)
  else: 
    v
  end
where:
  normalize-temp(10) is 10
  normalize-temp("13") is 13
end

fixed-data = transform-column(weather-data, "temperature", normalize-temp)

fun bucket-temp(t :: Number) -> String:
  doc: "numbers < 40 turn into 'cold', >=40 and < 60 to 'mild' and >=60 to 'hot'"
  if t < 40:
    "cold"
  else if t < 60:
    "mild"
  else:
    "hot"
  end
where:
  bucket-temp(-10) is "cold"
  bucket-temp(0) is "cold"
  bucket-temp(39.9) is "cold"
  bucket-temp(40) is "mild"
  bucket-temp(58) is "mild"
  bucket-temp(60) is "hot"
  bucket-temp(100) is "hot"
end

with-buckets = build-column(fixed-data, "temp-category", lam(r :: Row) -> String: bucket-temp(r["temperature"]) end)

freq-bar-chart(with-buckets, "temp-category")

#Normalize the data so theres no negatives in the precip. column- make function for this and create a new table 

#Create a function that tests what category each row in the precip. column fits in (dry, drizzly, wet)

#Create a new column with the categories

#Chart the new column

fun normalize-precip(p) -> Number:
  doc: "Makes sure all numbers are positive"
  
  if (p < 0):
    p * -1
    
  else:
    p
  end
    
    where:
  normalize-precip(-2) is 2
    normalize-precip(0) is 0
    
  end