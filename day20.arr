use context dcic2024

#data List<A>:
#  | empty
#  | link(first :: A, rest :: List<A>)
#end

fun add-till-zero(l :: List<Number>) -> Number:
  doc:"adds the numbers in the list until we hit a zero"
 
  cases(List)l:
    |empty => 0
    |link(f,r) =>
      if (f == 0):
        0
        else:
        f + add-till-zero(r)
  end
  end
  
  
where:
  add-till-zero([list: 5, 7, 0, 3]) is [list: 5, 7, 0, 3].first + add-till-zero([list: 5, 7, 0, 3].rest)
  
  
  add-till-zero([list:    7, 0, 3]) is 7 + add-till-zero([list: 7, 0, 3].rest)
  
  
  add-till-zero([list:       0, 3]) is 0
  
  
   add-till-zero([list:])            is 0
  
  #break down your left hand side to create more test cases
  
  #rewrite the right hand side of the test case using recursion
end


#Design a function strings-less-than that, given a list of strings as input, returns a list of strings that only includes those in the input whose length was less than a constant LEN-LIMIT.

len-limit =6

fun strings-less-than(l :: List<String>) -> List<String>:
  
  cases(List)l:
    | empty =>   [list:]
    |link(f,r)=>
      if (string-length(f) >= len-limit):
        [list:]
      else:
        [list:f] + strings-less-than(r)
      end
  end
  
where:
 
  strings-less-than([list: "hi", "hello","bonjour"]) is link([list: "hi", "hello","bonjour"].first, strings-less-than([list: "hi", "hello","bonjour"].rest))
  
  strings-less-than([list: "hello","bonjour"]) is link([list:"hello","bonjour"].first, strings-less-than([list: "hello","bonjour"].rest))
  
  
  strings-less-than([list: "bonjour"]) is [list:]
     
      
  strings-less-than([list:]) is [list:]
end