use context dcic2024

#VARIABLES
# var my-var = value
#my-var := new-value

#BLOCK
#-specify multiple expressions

#FOR LOOP
#repeated actions over a list
#for each( ___ from list)

#PATTERN
#var my-var = initial value
#for each( ___ from list):
# *LOGIC FOR YOUR OPERATOR
#my-var :=
#end
#my-var

#EX:
fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end

#Design your own product function that takes a list of numbers and returns their product (multiply all of them together).

fun my-product(num-list :: List<Number>) -> Number block:
  var product = 1
  for each(n from num-list):
    product := product * n
  end 
  product
where:
  my-product([list: 0, 1, 2, 3]) is 0
end

#Design a function my-length that takes a list of any value and returns the number of elements in the list.

fun my-length( num-list :: List<Number>) -> Number block:
  var num-elements = 0
  for each(n from num-list):
    num-elements := num-elements + 1
  end
  num-elements 
where:
  my-length([list: 0, 1, 2, 3]) is 4
end

#Design a function all-short-words that takes a list of strings and returns true if every word has 4 or fewer characters, false otherwise.

fun all-short-words( string-list :: List<String>) -> Boolean block:
  var all-true = true
  for each(s from string-list):
    if (string-length(s) > 4):
 all-true := false
    else:
      all-true:= all-true
    end
    
  end
  all-true
where:
  all-short-words( [list: "cat","dog","pig"]) is true
  all-short-words( [list: "hi","hello","hey"]) is false
end

#Design a function concat-all that takes a list of strings and concatenates them all together into one string (with no separator between them).

fun concat-all( string-list :: List<String>) -> String block:
  var one-string = ""
  for each(s from string-list):
    one-string := one-string + s
    end
one-string
where:
concat-all( [list: "cat","dog","pig"]) is "catdogpig"
concat-all( [list: "hi","hello","hey"]) is "hihellohey"
end
