use context dcic2024

data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end

payment-cash= cash
payment-credit= credit("1111-2222-3333-4444","12/34")
payment-check = checking("1231231231", "111",5)

fun display-payment(p :: PaymentMethod) -> String:
      doc:"describe payment method"
  
  cases(PaymentMethod) p:
    |cash => "Cash Payment"
    |credit(card-num,exp) => "Credit Payment"
    |checking(bank-acc,routing,check-num) => "Check Payment"
end
      
  
where:
      display-payment(payment-cash) is "Cash Payment"
  display-payment(payment-credit) is "Credit Payment"
      display-payment(payment-check) is "Check Payment"
end

#Define a Vehicle data type with three variants: bike (no fields), car (with make and year fields), and truck (with make, year, and capacity fields). Create one example of each variant.

data VehicleMethod:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: Number)
end

vehicle-bike = bike
vehicle-car = car("Toyota RAV4", 2024)
vehicle-truck = truck( "Ford", 2024, 13500)

#Write a function vehicle-age that takes a Vehicle and the current year, and returns the age in years. For bikes, return 0.

fun vehicle-age( v :: VehicleMethod, yr :: Number) -> Number:
  doc: "returns the age in years"
  
  cases(VehicleMethod) v:
    | bike => 0
    | car(make, year) =>   yr - year
    | truck(make,year,capacity) =>   yr - year
  end

  
where:
      vehicle-age( vehicle-bike, 2025) is 0
      vehicle-age( vehicle-car, 2025) is 1
  vehicle-age(vehicle-truck, 2030) is 6
      
  
end

#Define a Grade data type with variants: letter (with a string field for A/B/C/D/F), percent (with a number field), and pass-fail (with a boolean field). Create examples of each.

data GradeMethod:
  | letter( letter-grade :: String)
  | percent(percent-grade :: Number)
  | pass-fail( p-or-f :: Boolean)
end

grade-letter = letter( "A")
grade-percent = percent(66)
grade-pass-fail = pass-fail(true)

#Write a function grade-to-gpa that converts any Grade to a 4.0 scale number. Use: A=4.0, B=3.0, C=2.0, D=1.0, F=0.0; percentages: 90+=4.0, 80-89=3.0, 70-79=2.0, 60-69=1.0, <60=0.0; pass-fail: pass=4.0, fail=0.0.

fun grade-to-gpa(g :: GradeMethod) -> Number:
  doc: "converts any Grade to a 4.0 scale number"
  
  cases(GradeMethod) g:
    |letter(l) => 
      if (l == "A"):
        4.0
      else if (l == "B"):
          3.0
      else if (l == "C"):
            2.0
      else if (l == "D"):
              1.0
      else if (l == "F"):
                0.0
        
          end
    |percent(p) => 
      if (p >= 90):
        4.0
      else if (p >= 80):
          3.0
      else if (p >= 70):
            2.0
      else if (p >= 60):
              1.0
      else if (p <= 50):
                0.0
     
          end
      
    |pass-fail(a) => 
      if (a):
        4.0
          else:
        0.0
      end
  end
  
where:
  
  grade-to-gpa(grade-letter) is   4.0 
  grade-to-gpa(grade-percent) is   1.0
  grade-to-gpa(grade-pass-fail) is   4.0 
end
        
    
  