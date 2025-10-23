use context dcic2024

#SKILL 4- Sample question: Design a data definition for Beverage that can be either coffee with number of shots of espresso, or tea with name and brew-time in minutes. Then, write a function is-strong that returns true if the beverage is a coffee with more than 2 shots, or a tea brewed for more than 5 minutes.

data Beverage:
  |coffee(shots :: Number)
  |tea( name :: String, brew-time :: Number)
end

fun is-strong(b :: Beverage) -> Boolean:
  doc: "returns if beverage is strong"
  cases(Beverage) b:
    |coffee(shots) => shots > 2
    |tea(name, time) => time > 5
  end
  
where:
  is-strong(coffee(6)) is true
  is-strong(tea("jasmine",5)) is false
  
  
end

#SKILL 3- Design a function list-of-squares that takes a list of numbers, and returns a list where each element is the square of N where N is the element from the list. You must use for each, rather than a built in list function or recursion.

fun list-of-squares(og-list :: List<Number>) -> List<Number> block:
  doc: "returns each element squared"
  
  var new-list = [list:]
  for each(n from og-list):
    new-list := new-list + [list:(n * n)]
  end
  new-list
  
where:
  list-of-squares([list: 1,2,3]) is [list: 1,4,9]
  list-of-squares([list: 0,5,8]) is [list: 0,25,64]
end

#SKILL 4- Design a data definition for Vehicle that can be either a car with make, model, and number of passengers, or a truck with make, model, and cargo capacity in tons. Then, write a function needs-commercial-license that returns true if the vehicle is a car with more than 8 passengers, or a truck with cargo capacity greater than 5 tons.

data Vehicle:
  | car( make :: String, model :: String, passengers :: Number)
  | truck(make :: String, model :: String, cargo-capacity :: Number)
end

fun needs-commercial-license(v :: Vehicle) -> Boolean:
  doc:"returns if vehicle is a car with >8 passengers, or truck with capacity >5 tons"
  
  cases(Vehicle)v:
    | car(make,model,passengers) => passengers > 8
    |truck(make,model,capacity) => capacity > 5
  end
  
  
where:
  needs-commercial-license(car("Toyota", "RAV4",5)) is false
  needs-commercial-license(truck("Ford", "F-150",6)) is true
end

#SKILL 3-Design a function list-of-doubles that takes a list of numbers, and returns a list where each element is double (2 × N) the value of the corresponding element from the input list. You must use for each, rather than a built-in list function or recursion.

fun list-of-doubles(og-list :: List<Number>) -> List<Number> block:
  doc: "returns each eleement in list doubled"
  
  var new-list = [list:]
  
  for each(n from og-list):
    new-list := new-list + [list: n * 2]
  end
  
  new-list
  
where:
  list-of-doubles([list: 1,2,3]) is [list:2,4,6]
  list-of-doubles([list: 10,0,7]) is [list:20,0,14]
end