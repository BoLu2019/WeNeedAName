# WeNeedAName (Bo Hui Lu, Maxwell Vale, Simon Tsui)

## Rubik's Cube Visualizer

### *Project Presentation to the User*

</br>

When the user runs the program, the Rubik's cube will appear on the screen in 3D view. The user can do several actions onto the cube.
1. View the cube from a different angle by moving the mouse around the screen to rotate the whole cube.
2. Rotate one of the cube's faces by calling one of the moves (Left, Right, Up, Down, Front, Back, and their inverses)


### *How the Project Works*

</br>

#### Creating the Cube
The cube is created by drawing a cube using the box() method and filling it black with a white stroke. Then, each face is actually a set of nine squares drawn using the rect() method. Each square is appropriately translated and rotated to go on the appropriate face. 

#### Rotating the Cube
In order to rotate the cube about its center, the cube is rotated with respect to the coordinates of the mouse. So, the cube will rotate depending on where the mouse is on the screen.

#### Turning the Sides of the Cube
The current state of the cube is maintained by a 3D array of dimensions 3x3x6 (width x length x face). Each face of the cube represents a 2D array (width x length) and the side of the cube is determined by the face (0-5). In the array, each position is given an integer from 0 to 5 (inclusive), which is used to determine the color of that square. So, when drawing the cube, the color of each rectangle corresponds to the its respective value in the array (0 = red, 1 = orange, 2 = green, 3 = blue, 4 = white, 5 = yellow). When turning a side of the cube, color values are swapped between faces, which simulates a turn of a certain side of the cube. 


### *Launch Instructions*

</br>
Simply run Cube.pde in Processing!


### *Tentative Add-Ons*

<br>
* A way to change the orientation of the cube with respect to the mouse. As of now, the red face is always the "front", green is always "left", etc. We want to add X, Y, and Z turns to be able to change how the cube is held, so to speak.
* A Scramble Method + Timer
  * We want the user to be able to solve a scrambled cube and solve it while having a timer on the side. Right now, the cube starts in a solved position and is left up to the user to turn.
* User input for state of the cube
  * Give user the choice to input the colors of each side of the cube
  * Possibly also input a solve method that will solve a cube in a scrambled state
