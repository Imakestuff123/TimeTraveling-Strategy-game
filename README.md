# TimeTraveling-Strategy-game

This is a game that I made for fun. It's supposed to be a time based strategy game. In this game, you'll be allocated a specific amount of "frames" every one of your turns. During these turns, you can use these frames to do actions like move, melee attack, special movement techniques, speical attacks, and use your gun. But, your usage of these frames will determine the passing of time. For example, if an enemy bullet moves one space every 5 frames, and you use an action that costs 10 frames, the enemy bullet will move two spaces. Your goal is to use this power to your advantage to accomplish goals throughout levels. I'm planning to have the enmemy turn phase play out in a general turn based strategy manner, where all enemy units make their moves and attacks. But, when it switches to the player's turn, everything will freeze, and it'll be up to them to use their time manipulation ability to get themselves out of the situation that they've been put in. This project is still in very early development. I haven't worked on it in a bit, but I may come back to working on it in later time.

## Instructions

Open the project using Gamemaker Studio 2, or run the exe file.

## Prerequisites

Gamemaker Studio 2, or a windows computer

## Authors

Fletcher Li

## License

Mit License

## Acknowledgements

- Atlus - I used one of the sprites from Shin Megami tensei devil survivor

## Controls

Right now this project is still in the very early phases, but there are still controls

You use wasd to move the isometric camera, and the mousewheel to zoom into the map and out of the map

Your frames are displayed in the top right, and you can select actions to do by clicking the soldier with the gun.
You can select the action you wish to do by pressing the respective number that is displayed next to it, and clicking the new tiles that are highlighted. 

If you want to reset the amount of frames you have, just press q.

Sometimes, specific options like tech and attack will have a number that appears next to it when selected. This number specifies that type of attack or action within that subcatagory. You can change it by pressing tab. 

There is a target enemy on 126 on the map for you to test your attacks on. The blue squares on top of you and your enemy stand for shiled, while the red stands for health

List of actions
1-0 - Move - You can move a tile for 10 frames, the places where you can moved to are highlighted in yellow
2-0 - Punch - You can punch an adjacent nearby enemy. It does one point of health and costs 5 frames.
2-1 - Kick - You kick an enemy doing 1 point of health of damage. If there is no wall behind them when you kick them, it will move them back one tile. If there is a wall or a collision of some sort, you will do an extra point of health damage
3-0 - Shoot - You shoot a bullet from your gun, it costs 5 frames. On the bottem left you can see your ammo count, and how much ammo a clip can hold. Under the bullet icon, you will see your gun's cooldown in frames. This gun's cooldown is 15 frames, meaning that you will have to do actions that add up to 15 frames or more to shoot again. Also, if you want to reload click the r button on the bottem left, this costs 5 frames
Bullets will move one tile in the direction they are facing every 5 frames
4-0 - You wait in place for 5 frames
All techniques / tech actions have a cooldown. You can tell when they're on cooldown when their number doesn't appear to the right of the tech option when selected
5-0 - Slide - you do a quick slide to an adjacent tile which costs 5 frames instead of the usual 10 when you use move
5-1 - Jump - You can jump over a wall if there is one next to you in any direction. It costs 20 frames.
5-2 - Dash - You dash 3 tiles in a straight line. You cannot do this if there is something in your way. It costs 20 frames
6-0 - Open / Close doors - You can open or close a door 1 tile in any direction. It costs 5 frames
6-1 - (Currently work in progress) Pick up item - You can pick up an item on the ground.



