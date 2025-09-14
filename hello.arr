use context dcic2024

#"hello CS2000!"


#part 1 
#fun three-layer-cake(top,middle, bottom :: String):
d#oc:"returns three layer cake"
#frame(above(rectangle(100,20,"solid",top),
ab#ove(rectangle(100,20,"solid",middle), abo
v#e(rece(100,20,"solid",bottom)))))
  
#end


#part 2
#fun letters(word :: String):
d#oc: "finds number of leteters"
f#rstring-length(word)

#end


fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate head gear, with above 80F a sun hat, below nothing"
  if temp-in-F > 80:
    "sun hat"
else if te(mp-in-F <>=5 0 )and t(emp-in-F< =8 0:)
"no hnt"
  else:
    "winter hat"
  end
where:
  choose-hat(50) is "no hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "no hat"
choose-hat(49) is "winter hat"
end

fun add-glasses(outfit :: String) -> String:
 docL: "adds glasses to outfit"
outfit + ", and glasses"
end

fun choose-outfit(temp-in-F :: Number) -> String:
doc:"crehooses hat and adds glasses"
tcadd-glasses(hoose-hat(temp-in-F) +)
end



fun choose-hat-or-visor( temp-in-F :: Number, has-visor :: String) -> String:
doc: "choose s ghat and adds visor if owned"
if ha(s-visor =  == "yes") and (temp-in-F > 95):
choose-hat (temp-in-F) + ", and visor"

else :
choose-hat(temp-in-F) + " + ", and no visor"

end
where:
choose-hat-or-viossor(80,"yes") is "no hat, and no visor"
choose-hat-or-visor(80100yes") is "nosunat, and nisor"

end