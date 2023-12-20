# Flower Odyssey
![FlowerOdysseyLoading](https://github.com/GamesEnginesTeam/GamesEnginesAssignment/assets/98469510/15be004b-86ae-4b2d-b768-849cfaf055f8)

Name: Keith Rumbaua, Ho Chung, Daniel Mendes

Student Number: C20463336, C20348256, C20489272

Class Group: TU858

#  Description of the project 

Flower Odyssey is a platforming puzzle game in which you have to grow flowers in order to proceed to the next level. The levels usually have a special way of approaching them, such as swinging to flowers, or wall running in order to reach the next flower.

# Instructions for use

Instructions for the Pico:

A to jump

B to crouch

Right trigger to shoot water out

left joystick to move

right joystick to turn

x or left trigger to perform a special action (usually)

# How it works

First, Download the zip and open it, or use git to obtain this project.

Then export this project for your chosen vr device (make sure you have the openXRVendors addon installed)

After that, configure your controller if you need to using the openXR action map (although pretty much all controls should be mapped to every controller)

Finally, run the project by remote debug (not by clicking the play button, or the run current scene button.)

# List of classes/assets in the project

| Class/asset | Source |
|-----------|-----------|
| Flower.tres.gd | Self written |
| fps_controller.gd | Self written |
| goal.gd | Self written |
| Lava.gd | Self written |
| goal.gd | Self written |
| MainGame.gd | Self written |
| WateringCan.gd | Self written |
| water_drop.gd | Self written |

The rest of the assets were from the following places:
[this site](https://soundimage.org/) for the audio and [this video](https://www.youtube.com/watch?v=-EQ6eHeBrhM) for the sad violin song
Images from Google
Rest of the assets are from free asset sites, created by us in blender, or created directly within godot

# References
* [Godot XR Tools Documentation](https://godotvr.github.io/godot-xr-tools/docs/home/) - useful for figuring out what each tool does
* [VR Staging Tutorial](https://www.youtube.com/watch?v=j0-rvbN6cDA) - Really useful for setting up your VR game, and it is very recent (2 days ago as of writing this readme)
* [Custom Signals](https://www.youtube.com/watch?v=qkLBzm5D3Rs) - How to make your own custom signals in Godot 4. This was used to communicate with the goal and the flowers by the incrementFlowerCount() custom signal
* Other sources of help came from blogs and posts online such as stack overflow, or reddit.

# What we are most proud of in the assignment

We are most proud of how much we accomplished in the little time we had, and also how much VR and Game development we learned over the course of this assignment. We are also proud of how much we learned in Godot, and it is now possible for us to make a game from start to finish in Godot.

# What we learned

We learned Signals, GDScript, How to make particles in Godot, VR game development, How to load levels and create goals, How to code features for your game, and the workflow in Godot (exporting from blender into Godot, setting up VR with Android studio, debugging, and breakpoints to fix code problems).

This is a short demonstration of some of our project:

![YouTube](https://www.youtube.com/watch?v=NMpMNUSamnQ)
