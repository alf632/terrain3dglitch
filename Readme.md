This is a Showcase for an Issue with terrain3D.get_intersection.

To replicate:
 - Run Project with Godot 4.3
 - alt + leftClick on Unit to select
 - alt + rightClick to send unit to somewhere on the map

Observations:
 - the first rightClick after start will result in an invalid position
 - the fist rightClick after moving the mouse results in a false position. It seems like the Ray from camera is intersected too early.
 - the second and successive rightClicks on the same mapLocation results in a more correct position.

Explanation:
There are two visual representations of the clickPosition:
 - a green circle animation that represents the exact position of the click (sometimes underground and thus invisible)
 - gray boxes that represent a calculated path from the unit to the click positition. Their y axis is fixed to the terrain height at it's x and y coordinates.

Relevant Files:
These Files are directly involved in processing the click and following actions. They communicate via the MatchSignals.terrain_targeted signal.
 - The Raycasting and signal emitting is happening in res://source/match/maps/3Dmap/3Dmap.gd
 - The Circle animation is triggered in res://source/match/handlers/MouseClickAnimationsHandler.gd
 - The Path calulation is triggered in res://source/match/units/traits/NavMovement.gd
