# Lemmings-using-Verilog

Firstly let us design the movement mechanics. The game is 2D so the motion can only be along a particular axis in a plane. Let us focus on the horizontal motion of the lemmings for the time being.  Now a lemming can walk either left or right. While walking right if it faces an obstacle it will turn left, and in the same way while walking left if it faces an obstacle it will turn right. Now we will consider that lemmings walk left when they are first dropped in.



We will now design a moore machine to implement this above logic.  

