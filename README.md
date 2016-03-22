# RetroPie Simple Backup Script
Hey guys!
 
I make a simple shell script to backup all your RetroPie  save files!
 
**(Now with Cloud backups! scroll to the bottom for the cloud setup)**
 
* It backs up all your saves to a folder that's on the default samba share, so you can easily transfer the dumps to your PC.

* It timestamps all the backups down to the second!
 
* Creates an md5 checksum to allow you to make sure noting happened to your backup during transfer (long story,don't ask..)
 
* It's setup with FULL paths to your Roms and backups dir, so you can run the script from anywhere! 

* And it's configurable! Change a few vars, and you can customize the backup path, change the working (roms) directory, change the date format, etc.

* You can set the backup dir to something like a dropbox/google drive sync 

Enjoy!
 
**You can make it run at startup with too!**

---
**NEW CLOUD ENABLED VERSION!**
 
---
 
You can find the new cloud enabled version [HERE!](https://github.com/BOBdotEXE/RetroPie-Simple-Backup-Script/releases/)
 
Archive md5: 8956552db8f73e75416c515ca8fdfcb6 
 
**PLEASE! DO NOT USE YOUR MAIN GOOGLE ACCOUNT FOR THIS!**
 
**Only use an account that's you'd be okay with lousing all the data from, (just make a new google account)** 
 
*You can always set up a share to your main google account!* (safe)
 
Ok, Ready? one, two, three, let's Jam!
 
**Step 1:** download the [latest version of drive](http://www.mediafire.com/download/439bq3bcbdgd8bn/drive) 
 
[md5: 462e5b2ccf9ad4b98dde5c7cdaede17d]
  
I compiled it from the source code, on my pi3, but it should at least work on the Pi2.
 
You can find an older version [here](https://github.com/odeke-em/drive/releases/download/v0.2.2-arm-binary/drive-arm-binary), [Source](https://www.raspberrypi.org/forums/viewtopic.php?p=801697#p801697) (rename it to: *drive*)
  
**Step 2:**
 
If you have not yet, Pick a folder where you want your backups stored.
 
I'll be using: */home/pi/Retropi/roms/backups*
 
This is so I can easy copy the backups to my pc as needed, you can pick anywhere, but that's what I'll be using for this guide.
 
ok, go ahead and copy the cloud enabled backup script from your zip file to your home directory. (/home/pi)
 
then place *drive* in your backups folder, and make sure it's marked as executable (chmod +x)

**Step 3:** 
And then go back to the backup script, and open it with your favorite text editor, and edit the 'backupDir' and replace the string "/home/pi/RetroPie/roms/backups"  **If** you're using a different folder.
 
Now open a terminal (or ssh) and navigate to your backups folder.
  
  Mark drive in as executable!
 
    chmod +x drive
  
from there run:
 
    drive init /home/pi/RetroPie/roms/backups

 Replacing */home/pi/RetroPie/roms/backups* with your backup path,
 
 From here you'll be given a URL to visit, **Make sure you ONLY open that url when signed into your second/extra google account!!*
  
  That url will give you a code, copy and past that code back in the terminal where you ran *drive init*, then press enter.
   
   That should get your account all set up.
  
  *Step 4:* (optinal, but suggested!) so drive dose not always ask us to confirm each upload,
  create a new file called: *.driverc*  (yes, with the '.' before the name)
  In side of it, you'll only need one line of text:
      no-prompt=true
  Then save, and close the file.
  And now google drive syncing should be all set!

**Step 5:**
  if you have not yet, mark the main script as executable.
 
    chmod +x ~/backup

  Now run the script! 
    ~/backup
  
  And it should backup your files, and Automatically Sync them to google Drive!
   
**Step 6:** (automatic backups!)
 
 edit your root cron jobs.
 
    sudo crontab -e
 simply scroll to the bottom and add:
 
    @reboot pi /home/pi/backup

(change *'/home/pi/backup'* to the path of your script)
 
and  save the file!
 
this will make it run every time you start up!
 
(but for some reason, it will not make an md5)
 
**If you also want to make nightly backups, you can do that too!**
 
For nightly just before midnight, you'll edit your own cron jobs:
  
    crontab -e
 simply scroll to the bottom and add:
 
    59 23 * * * pi /home/pi/backup 
and  save the file!


   If you have any quesions for now, I guess you can ask them in the redit thread for this project:
   https://www.reddit.com/r/RetroPie/comments/4bdx0h/simple_configurable_script_to_back_up_all_save/
