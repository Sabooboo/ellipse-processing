# ellipse-processing
This script uses a cute algorithm to count dots inside an ellipse of whichever size and show a visual representation of how that looks.
## How it works
Say you specify an ellipse of `length` 400 and `width` 400 (a circle with `diameter` = 400). This script generates a rectangle with the same length and width around that circle and fills it with dots.


At any given point, the script figures out the angle relative to the midpoint of the ellipse, and with that information it calculates the radius of the ellipse of that point. If the distance of that point (a²+b²=c² wow) is greater than the radius of the ellipse at that angle, the dot is not inside the ellipse. 

With this in mind, you can specify any length and width less than 500, and any distance between the dots, and this will paint the ones that fall inside or on the border of the ellipse green.

## How me run program?
1. Clone this repository
2. Download [Processing][processing-url]
3. Open ellipse.pde in processing

## Development
bon't dother

[//]: # (variables)
  [processing-url]: <https://processing.org/download>
