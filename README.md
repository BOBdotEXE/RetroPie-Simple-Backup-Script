# RetroPie / RecalBox Simple Backup Script
Hey guys!
 
I make a simple shell script to backup all your RetroPie save files!
 
**(Now with Cloud backups!)**
 
 
##  Table of Contents:
   
  1. [What can this script do?](#do)
  2. [Getting started!](#start)
  3. [Step 1: Getting the sync program *'Drive'*](#s1)
  4. [Step 2: Setting up your backup folder](#s2)
  5. [Step 3: Setting up Cloud sync](#s3)
  6. [Step 4: Making the bakups not require user input (optinal)](#s4)
  7. [Step 5: Running the backup script for the first time!](#s5)
  8. [Step 6: Setting up Automatic Bakups](#s6)
  9. [Step 7: (Optinal) Nigtly backups ](#nite)
  10. [Configuring the script for custom settings](#conf)

<a name="do"></a>
## What can this script do?
 
* It backs up all your saves to a folder that's on the default samba share, so you can easily transfer the dumps to your PC.

* It timestamps all the backups down to the second!
 
* Creates an md5 checksum to allow you to make sure noting happened to your backup during transfer (long story,don't ask..)
 
* It's setup with FULL paths to your Roms and backups dir, so you can run the script from anywhere! 

* And it's configurable! Change a few vars, and you can customize the backup path, change the working (roms) directory, change the date format, etc.

* You can set the backup dir to something like a dropbox/google drive sync 

Enjoy!
 
**You can make it run at startup with too!**

<a name="start"></a>
 
## Getting Started!

You can find the new cloud enabled version [HERE!](https://github.com/BOBdotEXE/RetroPie-Simple-Backup-Script/releases/)
 
You can place this script anywhere, but this guide will assume you put it in your home folder *(/home/pi/backup)*
 
**PLEASE! DO NOT USE YOUR MAIN GOOGLE ACCOUNT FOR THIS!**
 
**Only use an account that's you'd be okay with lousing all the data from, (just make a new google account)** 
 
*You can always set up a share to your main google account!* (safe)
 
Ok, Ready? one, two, three, let's Jam!

<a name="s1"></a>
 
## Step 1: Getting the sync program 'Drive'

Download the [latest version of drive](https://github.com/BOBdotEXE/RetroPie-Simple-Backup-Script/releases/download/1.4/drive) 

 
[md5: 462e5b2ccf9ad4b98dde5c7cdaede17d]
  
I compiled it from the source code, on my pi3, but it should at least work on the Pi2.
 
You can find an older version [here](https://github.com/odeke-em/drive/releases/download/v0.2.2-arm-binary/drive-arm-binary), [Source](https://www.raspberrypi.org/forums/viewtopic.php?p=801697#p801697) 
 
 
 
<a name="s2"></a>
 
## Step 2: Setting up your backup folder
 
If you have not yet, Pick a folder where you want your backups stored.
 
I'll be using: */home/pi/Retropi/roms/backups*
 
This is so I can easy copy the backups to my pc as needed, you can pick anywhere, but that's what I'll be using for this guide.
 
ok, go ahead and copy the cloud enabled backup script from your zip file to your home directory. (/home/pi)
 
then place *drive* in your backups folder, and make sure it's marked as executable (chmod +x)
 
<a name="s3"></a>
 
## Step 3: Setting up Cloud sync

And then go back to the backup script, and open it with your favorite text editor, and edit the 'backupDir' and replace the string "/home/pi/RetroPie/roms/backups"  **If** you're using a different folder.
 
Now open a terminal (or ssh) and navigate to your backups folder.
  
  Mark drive in as executable!
 
    chmod +x drive
  
from there run:
 
    ./drive init /home/pi/RetroPie/roms/backups

 Replacing */home/pi/RetroPie/roms/backups* with your backup path,

 
 From here you'll be given a URL to visit, **Make sure you ONLY open that url when signed into your second/extra google account!!*
  
  That url will give you a code, copy and past that code back in the terminal where you ran *drive init*, then press enter.
   
   That should get your account all set up.
   
  Now Rename *drive* to *.drive* so it dose not get added to google drive :P

     mv drive .drive
 
  
  Once it's renamed to *.drive* it will be hidden, so if you can't see it, doesn't freak out!
  
<a name="s4"></a> 
  
  
## Step 4: Making the bakups not require user input (optinal)
  
  (optinal, but suggested!) so drive dose not always ask us to confirm each upload,
   
  create a new file called: *.driverc*  (yes, with the '.' before the name) in the same folder as *'drive'*
   
  In side of it, you'll only need one line of text:
   
      no-prompt=true
 
  Then save, and close the file.
  And now google drive syncing should be all set!
  
<a name="s5"></a>
 
## Step 5: Running the backup script for the first time!

  if you have not yet, mark the main script as executable.
 
    chmod +x ~/backup

 Next we'll need to install zip, so we can make compressed archives

    sudo apt-get install zip

  Now run the script! 

    ~/backup
  
  And it should backup your files, and Automatically Sync them to google Drive!
   
<a name="s6"></a>
 
## Step 6: Setting up Automatic Bakups
 
 **(Please Note, at this time automatic backup, are only backed up locally, but they will sync to the cloud at your next manual backup)**
 
To make the system backup your saves everytime you boot
 Edit */etc/rc.local* and make a new line before exit, and type:

     runuser -l  pi -c /home/pi/backup

(change *'/home/pi/backup'* to the path of your script)
 
and  save the file!
 
This will make it run every time you start up!

<a name="nite"></a>
 
## Step 7: (Optinal) Nightly backups
 
**If you also want to make nightly backups, you can do that too!**
 
For nightly just before midnight, you'll edit your own cron jobs:
  
    crontab -e
 simply scroll to the bottom and add:
 
    59 23 * * *  /home/pi/backup 

You can add more if you want, just copy the line and change the times, like "59 11 * * *..." for noon backups, or 

and  save the file!

<a name="conf"></a>

## Configuring the script for custom settings
This script should be pretty easy to undertsand, but I'll go over a few of the settings,
 
First, open the script with any text editor, and we'll go over each main line that you can change.

To change the folder where you save files are red from. (why???) just edit the *7th line*:
 
(Make sure you **don't** put an extra **/** at the end)
 
     workingDir="/home/pi/RetroPie/roms" 
 
 Simply change that to wherever your roms/saves are.

 
To change where your backups are stored edit *line 9*:
 
(Make sure you **don't** put an extra **/** at the end)
 
     backupDir="/home/pi/RetroPie/roms/backups"
 

Next If you want to change the backup storage folder name, you can do that with *line 11*:
 
      *archiveFolderName="RetroPiSaves"*
 
 If you want to add a suffex to all the backup, for example if using 2 pi's you want to make one's backups end with "-MainPie", buy default, none are used. if you add one they will be called something like: *"15.04.02_03-29-2016-MainPie.zip"*
  
     backupSuffex=""
 
If you *don't* live in the USA, and want all your backups to use the proper format: *Day-Month-Year
 
 Simply go down to lines *27-28*:
  
     #USA format
     
     timestamp="$(date +'%H.%M.%S_%m-%d-%Y')"
     
     #Proper format
     
     #timestamp="$(date +'%H.%M.%S_%d-%m-%Y')"   

And comment out *line 28*, and uncomment *line 30*, then it should look like this:

     #USA format

     #timestamp="$(date +'%H.%M.%S_%m-%d-%Y')"
 
     #Proper format

     timestamp="$(date +'%H.%M.%S_%d-%m-%Y')" 

 With one-way sync (always upload, never download), Deleteing the files in google Drive **WILL NOT** remove them from the PI,
 (and any files deleted from the cloud will be re-uploaded next sync).
  
 To enable one way sync, go to *line 18*:
  
     ./.drive pull
     
 And change it to:
  
       #./.drive pull
 

---
 
   If you have any quesions for now, I guess you can ask them in the redit thread for this project:
   https://www.reddit.com/r/RetroPie/comments/4bdx0h/simple_configurable_script_to_back_up_all_save/

