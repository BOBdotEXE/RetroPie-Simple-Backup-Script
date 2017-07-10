#!/bin/bash
#Simple backup script v1.51 (by BOBdotEXE)
echo "Simple Backup script v 1.51 By BOBdotEXE"
echo "github.com/BOBdotEXE/RetroPie-Simple-Backup-Script"
echo " "
#Directory where roms/saves are stored
workingDir="/home/pi/RetroPie/roms/"
#Save bacup location
backupDir="/home/pi/RetroPie/roms/backups"
#Name for the root backups folder (will be placed INSIDE of your 'backup location'
archiveFolderName="RetroPiSaves"
#Suffex to append to the end of all backups (example: "-backups") NO SPACES ALLOWED! (Don't use "MY BACK UPS"!!!) 
backupSuffex=""
#backup dir may be relitive.
cd $backupDir
echo Syncing changes..
#comment out for oneway sync vvv
$workingDir/.drive pull
echo " "
echo Creating Save File backup now!
echo " "
cd  $workingDir
#Get date varibles for folders
Y=$(date +'%Y')
M=$(date +'%m-%b')
D=$(date +'%d')
#USA format
timestamp="$(date +'%H.%M.%S_%m-%d-%Y')"
#Proper format
#timestamp="$(date +'%H.%M.%S_%d-%m-%Y')"
[ -d $backupDir ] || mkdir $backupDir 
[ -d $backupDir/$archiveFolderName ] || mkdir $backupDir/$archiveFolderName
[ -d $backupDir/$archiveFolderName/$Y ] || mkdir $backupDir/$archiveFolderName/$Y 
[ -d $backupDir/$archiveFolderName/$Y/$M ] || mkdir $backupDir/$archiveFolderName/$Y/$M
[ -d $backupDir/$archiveFolderName/$Y/$M/$D ] || mkdir $backupDir/$archiveFolderName/$Y/$M/$D
find . | egrep "\.(sav|srm)$" | zip -@ $backupDir/"$archiveFolderName"/$Y/$M/$D/"$timestamp"$backupSuffex.zip
md5=($(md5sum "$backupDir"/"$archiveFolderName"/$Y/$M/$D/"$timestamp"$backupSuffex.zip))
echo $md5 >> "$backupDir"/"$archiveFolderName"/$Y/$M/$D/"$timestamp"$backupSuffex.md5
echo " "
echo "Backup Completed!"
echo "Saved to $(date +'%m-%d-%Y_%H.%M.%S').zip"
echo "And md5 created for verification!"
echo " "
echo "Uploading to Google Drive..."
cd $backupDir
$workingDir/.drive push
echo " "
echo Complete!