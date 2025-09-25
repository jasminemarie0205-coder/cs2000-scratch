use context dcic2024
include csv
include data-source

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-high-value(r :: Row) -> Boolean:
  doc: "returns whether the amount column is >= 5"
  r["amount"] >= 5.0
where:
  is-high-value(orders.row-n(2)) is true
  is-high-value(orders.row-n(3)) is false
end

fun is-morning(r :: Row) -> Boolean:
doc:"returns whether time column in a row is morning time"
r["time"] <= "12:00"

where:
  is-morning(orders.row-n(2)) is true
  is-morning(orders.row-n(4)) is false
  is-morning(orders.row-n(5)) is false
    
  end
morning-table = filter-with(orders,is-morning)

late-to-early=order-by(orders,"time",false)

new-table=load-table: Location :: String, Subject :: String, Date :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv",default-options)
end

fun is-forest(r :: Row) -> Boolean:
  doc:"returns whether row has subject forest"
  r["Subject"] == "Forest"
  
where:
  is-forest(new-table.row-n(12)) is true
  is-forest(new-table.row-n(0)) is false
  
end

forest-table = filter-with(new-table, is-forest)
forest-table-2 = order-by(forest-table,"Date", true)


 items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

fun calc-dist(r :: Row) -> Number:
doc: "calculates distance using coordinates"
  
  num-to-rational(num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"])))


where:
  calc-dist(items.row-n(7)) is-roughly num-sqrt(num-sqr(17) + num-sqr(49))
  
end


fun sub-2(n :: Number) -> Number:
  doc: "subtracts 2"
  n - 2


where:
  sub-2(7) is 5
  sub-2(10) is 8
end

fun closer-10(n :: Number) -> Number:
  doc: "reduces x and y coordinates by 10%"
  n * 0.9
  
where:
  closer-10(1) is 0.9
  closer-10(10) is 9
end

new-items1=transform-column(items,"x-coordinate", closer-10)
new-items2=transform-column(new-items1,"y-coordinate", closer-10)

new-items3=build-column(new-items2, "distance", calc-dist)
order-by(new-items3, "distance",true)



fun 



