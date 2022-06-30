# Lemmings-using-Verilog

Firstly let us design the movement mechanics. The game is 2D so the motion can only be along a particular axis in a plane. Let us focus on the horizontal motion of the lemmings for the time being.  Now a lemming can walk either left or right. While walking right if it faces an obstacle it will turn left, and in the same way while walking left if it faces an obstacle it will turn right. Now we will consider that lemmings walk left when they are first dropped in.



We will now design a moore machine to implement this above logic.  

https://github.com/Smartmayukh/Lemmings-using-Verilog/blob/main/Design_Part1.v

The verilog simulation output looks like this 

![image](https://user-images.githubusercontent.com/64318469/176694556-2f1c4712-7c6d-4753-beeb-a42dab20493f.png)

Now in the lemmings game , there is a mechanics of falling, just like in the real world. If the ground surface is removed from the feet of the lemmings it will fall and scream out "aaah!!!!" . When it finds the ground again after falling for a certain time it will again start walking again. Lemmings do not change directions if they are bump into left right obstacles midflight. We will represent no ground as logic 0 and logic 1 for when ground reappears again. The left and right motion will be same as before. We will also represent the "aaah!!!!" scream of the falling lemming as an output state.

https://github.com/Smartmayukh/Lemmings-using-Verilog/blob/main/Design_Part2.v

The verilog simulation output looks like this 

![image](https://user-images.githubusercontent.com/64318469/176694916-a8b2ee52-3203-4812-8bfd-c00d147169a7.png)

Now apart from movement mechanics, Lemmings also can do certain special tasks. One of them is digging. Now its pretty evident that a Lemming can dig only when it is on ground and not in a falling state. Various interesting scenarios may arise when we introduce this new mechanics. The lemmings can fall after digging a hole , then after sometime may find flat land and again start digging or walking. A lemming that was walking left, can start digging, falls and again starts walking left. There can be many scenarios possible for combination of all the states. 



So now we will incorporate this digging mechanics into our Lemmings code

https://github.com/Smartmayukh/Lemmings-using-Verilog/blob/main/Design_Part3.v

The verilog simulation output looks like this 

![image](https://user-images.githubusercontent.com/64318469/176695330-f321aca6-1b8b-4b23-a21e-7842ec2f6bf9.png)


Now, Lemmings cannot survive jump for large heights. Here we will consider that the lemming will be alive if they reach the ground by the 20 clock cycle or else they will splatter.Thus we are introducing a new state called "splat" which defines this phenomenon of explosion of the lemming when it falls from a large height. 


