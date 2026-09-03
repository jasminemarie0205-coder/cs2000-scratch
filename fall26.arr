use context dcic2024


#LAB 1

#| TIPS FOR STUDENTS
   - assign each body part to a definition
   ex: MY-DEFINITION = image-file("name-of-file.png")
   
   
|#


#| REMINDERS FOR ME
   -RECTANGLE - rectangle(width, height, mode, color)
   -SQUARE - square(side-length, mode, color)
   -CIRCLE - circle(radius, mode, color)
   
   ______________________
   
   -OVERLAY - overlay(front, back)
   
   ex: overlay(rectangle(30, 60, "solid", "orange"), ellipse(60, 30, "solid", "purple"))
   
   ______________________
   
   -OVERLAY-ALIGN - overlay-align(x-place, y-place, front, back)
   
   ex: overlay-align("left", "bottom", square(30, "solid", "bisque"), square(50, "solid", "dark-green"))
   ______________________
   
   -OVERLAY-XY - overlay-xy(front, dx, dy, back)
   -X: Positive = right, negative = left
   -Y: Negative = down, positive = up
   
   ex: overlay-xy(circle(30,"solid","yellow"),-20,-25,circle(50,"solid","white"))
  ______________________   
   
   -BESIDE-ALIGN - beside-align(y-place,left-pic, right-pic)
   
   ex: beside-align("top",
  square(30, "solid", "bisque"), square(50, "solid", "dark-green"))
   
   ______________________
   
   -ABOVE-ALIGN - above-align(x-place,top-pic, bottom-pic)
   
   ex: above-align("left",
  square(30, "solid", "bisque"), square(50, "solid", "dark-green"))
   
   |#



