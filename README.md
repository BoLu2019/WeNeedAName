# WeNeedAName (Bo Hui Lu, Maxwell Vale, Simon Tsui)

## Rubix Cube Visualizer

*Project Presentation to the User*
</br>
When the user runs the program, the rubix cube will appear on the screen in 3D view. The user can do several actions onto the cube.
1. View the cube from a different angle by dragging the mouse around the screen to rotate the whole cube.
2. Rotate one of the cube's faces by calling one of the moves (Left, Right, Up, Down, Front, Back, and their inverses)
3. 

*How the Project Works*
</br>
The cube is maintained by a 3D array of dimensions 3x3x6 (width, length, face). The array is read through to paint the cube its proper colors. To rotate the cube entirely, we call the rotateX and rotateY methods which moves everything on the screen by a set amount. The moves change the colors first in the 3D array and the changes are displayed on the cube display.


*Launch Instructions*
</br>
processing Cube.pde

