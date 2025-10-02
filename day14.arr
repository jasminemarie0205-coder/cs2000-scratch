use context dcic2024
include csv
include data-source

photos = load-table: location :: String, subject :: String, date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

subject-count=count(photos, "subject") 
value-count= count(subject-count, "value")
subject-sum= sum(value-count, "count")