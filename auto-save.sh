#!/bin/bash
array[0]="Pro Tip: Jumping the ship on someone in space kills them!"
array[1]="Pro Tip: Hacking another ship is an act of war..."
array[2]="Pro Tip: Don't shoot your partners in combat..."
array[3]="Pro Tip: Don't shoot your freinds ship..."
array[4]="Pro Tip: Don't blow up the Falcon!"
array[5]="Pro Tip: Never touch reset server!!!"
array[6]="Pro Tip: Don't forget where you parked your ship."
size=${#array[@]}
index=$(($RANDOM % $size))
screen -S tachyonServer -p 0 -X stuff "Saving...^M"
screen -S tachyonServer -p 0 -X stuff "/save^M"
screen -S tachyonServer -p 0 -X stuff "${array[$index]}^M"
sleep 3
screen -S tachyonServer -p 0 -X stuff "Saved!^M"
