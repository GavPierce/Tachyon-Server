#!/bin/bash
timestamp() {
date +"%m-%d-%y"
}
screen -S tachyonServer -p 0 -X stuff "-SERVER RESTART AND BACKUP IN 10 MIN! ^M"
sleep 5
screen -S tachyonServer -p 0 -X stuff "-SERVER RESTART AND BACKUP IN 5 MIN! ^M"
sleep 4
screen -S tachyonServer -p 0 -X stuff "-SERVER RESTART AND BACKUP IN 1 MIN! ^M"
sleep 1
screen -S tachyonServer -p 0 -X stuff "-RESTARTING SERVER AND DOING DAILY BACKUP... ^M"
screen -S tachyonServer -p 0 -X stuff "/exit^M"
cp -r ~/Tachyon-Server/server/DataBase/ ~/backup/
sleep 2
mv ~/backup/DataBase/ ~/backup/$(timestamp)
sleep 1
screen -S tachyonServer -p 0 -X stuff "sudo bash ~/Tachyon-Server/server/StartServerConsole.sh ^M"
