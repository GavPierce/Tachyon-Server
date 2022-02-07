#!/bin/bash
array[0]="Pro Tip: Jumping the ship on someone in space kills them!"
array[1]="Pro Tip: Hacking another ship is an act of war..."
array[2]="Pro Tip: Don't shoot your partners in combat..."
size=${#array[@]}
index=$(($RANDOM % $size))
screen -S 22577 -p 0 -X stuff "Saving...^M"
screen -S 22577 -p 0 -X stuff "/save^M"
screen -S 22577 -p 0 -X stuff "${array[$index]}^M"
sleep 3
screen -S 22577 -p 0 -X stuff "Saved!^M"
