#!/bin/bash
timestamp() {
date +"%m-%d-%y"
}
screen -S tachyonServer -p 0 -X stuff "Doing Daily Backup...^M"
cp -r ~/Tachyon-Server/server/DataBase/ ~/backup/
sleep 2
mv ~/backup/DataBase/ ~/backup/$(timestamp)
sleep 1
screen -S tachyonServer -p 0 -X stuff "Backup Finished!^M"
