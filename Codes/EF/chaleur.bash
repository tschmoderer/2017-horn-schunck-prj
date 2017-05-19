 #!/bin/bash
 
clear
rm *.png
 
FreeFem++ meshing.edp
FreeFem++ heat.edp &


convert  -loop 0 *.png res.gif

rm *.png
