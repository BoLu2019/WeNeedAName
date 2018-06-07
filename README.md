# WeNeedAName :sweat_smile: (Bo Hui Lu, Maxwell Vale, Simon Tsui)

## Rubik's Cube Visualizer

### *Project Presentation to the User*

When the user runs the program, the Rubik's cube will appear on the screen in 3D view. The user can do several actions onto the cube.
1. View the cube from a different angle by moving the mouse around the screen to rotate the whole cube.
2. Rotate one of the cube's faces by calling one of the moves (Left, Right, Up, Down, Front, Back, and their inverses)

<br>

### *How the Project Works*

#### Creating the Cube
The cube is created by drawing a cube using the box() method and filling it black with a white stroke. Then, each face is actually a set of nine squares drawn using the rect() method. Each square is appropriately translated and rotated to go on the appropriate face. 

#### Rotating the Cube
In order to rotate the cube about its center, the cube is rotated with respect to the coordinates of the mouse. So, the cube will rotate depending on where the mouse is on the screen.

#### Turning the Sides of the Cube
The current state of the cube is maintained by a 3D array of dimensions 3x3x6 (width x length x face). Each face of the cube represents a 2D array (width x length) and the side of the cube is determined by the face (0-5). In the array, each position is given an integer from 0 to 5 (inclusive), which is used to determine the color of that square. So, when drawing the cube, the color of each rectangle corresponds to the its respective value in the array (0 = red, 1 = orange, 2 = green, 3 = blue, 4 = white, 5 = yellow). When turning a side of the cube, color values are swapped between faces, which simulates a turn of a certain side of the cube. 

**Key Presses**

r - cw turn of right face

l - cw turn of left face

u - cw turn of top face

d - cw turn of down face

f - cw turn of front face

b - cw turn of back face

_SHIFT + key turns that face ccw_


s - scramble the cube

<br>

### Versions

_v1 --> Cube1x1.pde_

In this preliminary version, we solidified the essentials and core functionality of the entire project. First, we learned how to utilize 3D in Processing, starting with the box() method. We then worked out how our cube would move around. So, we made the cube follow the mouse as it moves across the Processing window. Finally, we figured out how to color each side. At first, we were thinking of drawing individual boxes for each piece of the cube, but then we figured it would be much easier to just paint a 2D rect onto each face by translation and rotation. So, we figured out how to get a square on each side and made sure that it remained on the cube as the cube rotated.

_v2 --> Cube3x3.pde_

In this second version, we are implementing everything that is necessary to be able to call this a "Rubik's Cube Visualizer". So, we're pretty much adding all of the functionality of a 3x3 Rubik's Cube here. First, we used the same method of coloring the sides, but we did nine squares per side to mimic the 3x3 look (instead of a 1x1). Then, we went about creating a means of storing the current color of each square on the cube (54 to be exact). We ended up using a 3D Array to store all of the values. Then, we worked on probably the most defining aspect: turning the sides of the cube. Instead of the sides physically turning, we just swapped colors or specific rectangles in the array to mimic a turn of a side.

_v3 --> Cube3x3.pde

In the third version, we have succesfully implemented every basic move on a Rubik's cube (excluding any turns of middle layers). There is also now a scramble method that will do a random set of 25 moves to return a scrambled cube for the user to solve so that they do not have to scramble it themselves. We have yet to implement entire cube rotations (X,Y,Z), user input for the sides of a cube, and an auto solver.

</br>

### *Launch Instructions*

1. Open the latest version in Processing --> v3/Cube3x3.pde
2. Click the run button in the top right of the window to run the script. A new screen should appear with the Rubik's Cube on it!
3. Look around the cube by moving your mouse around that new screen.
4. You can now play around with the cube!
  * You can turn each side of the cube by pressing specific buttons on the keyboard (refer to **Key Presses** above)
  * You may also press the s key to scramble the cube if you wish to have a random cube combination to solve.


<br>

### *Tentative Add-Ons*

- [ ] A way to change the orientation of the cube with respect to the mouse. As of now, the red face is always the "front", green is always "left", etc. We want to add X, Y, and Z turns to be able to change how the cube is held, so to speak.

- [x] A Scramble Method

- [ ] A Timer
  
- [ ] User input for state of the cube

- [ ] Auto Solver
