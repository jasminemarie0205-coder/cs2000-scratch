use context dcic2024
#PROBLEM 1
fun tick(num-sec :: Number) -> Number:
 doc: "returns next sec as output"
  num-sec + 1

where:
 tick(0) is 1
  tick(10) is 11
  tick(50) is 51
end


#PROBLEM 2
clock-base= circle(30,"outline","white")
  
clock-hand = line(0,50,"red")

fun seconds-to-image(sec :: Number) -> Image:
  doc: "returns image representing seconds on circle"
  
  overlay-align("center","center",rotate((sec * -6),clock-hand) ,clock-base)
  
where:
  seconds-to-image(50) is overlay-align("center","center",rotate((50 * -6),clock-hand) ,clock-base)
  
end

#PROBLEM 3
fun print-conference-badge(name :: String, gender :: String, email :: String, nuid :: String) -> Image:
 doc: "prints a conference attendee badge"
  badge-base = overlay-align("center","center",circle(150,"solid","white"),circle(170,"solid","red"))

  
  name-text = text-font(name, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  
  gender-text = text-font(gender, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  email-text = text-font(email, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  nuid-text = text-font(nuid, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  
 overlay-align("center","center",(above(name-text,above(gender-text, above(email-text, nuid-text)))),badge-base)
end
#PROBLEM 4
#NUID is not a necessary piece of information that needs to be shared on the badge, because it is not something that everyone at the conference needs to know. One's NUID can remain private, especially if they are already providing their school email address. Name and gender can help with how people refer to someone during the conference, and email helps people communicate with one another if they need to

#PROBLEM 5
fun print-conference-badge-updated(name :: String, gender :: String, email :: String) -> Image:
 doc: "prints a conference attendee badge"
  badge-base = overlay-align("center","center",circle(150,"solid","white"),circle(170,"solid","red"))

  
  name-text = text-font(name, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  
  gender-text = text-font(gender, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  email-text = text-font(email, 20, "black", "Gill Sans", "swiss", "normal", "normal", false)
  
  
  overlay-align("center","center",above(name-text,above(gender-text, email-text)),badge-base)
end

    