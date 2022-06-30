# Lemmings-using-Verilog

Firstly let us design the movement mechanics. The game is 2D so the motion can only be along a particular axis in a plane. Let us focus on the horizontal motion of the lemmings for the time being.  Now a lemming can walk either left or right. While walking right if it faces an obstacle it will turn left, and in the same way while walking left if it faces an obstacle it will turn right. Now we will consider that lemmings walk left when they are first dropped in.



We will now design a moore machine to implement this above logic.  

https://github.com/Smartmayukh/Lemmings-using-Verilog/blob/main/Design_Part1.v

The verilog simulation output looks like this 

![image](https://user-images.githubusercontent.com/64318469/176694556-2f1c4712-7c6d-4753-beeb-a42dab20493f.png)

Now in the lemmings game , there is a mechanics of falling, just like in the real world. If the ground surface is removed from the feet of the lemmings it will fall and scream out "aaah!!!!" . When it finds the ground again after falling for a certain time it will again start walking again. Lemmings do not change directions if they are bump into left right obstacles midflight. We will represent no ground as logic 0 and logic 1 for when ground reappears again. The left and right motion will be same as before. We will also represent the "aaah!!!!" scream of the falling lemming as an output state.

