# DS4Help
Simple script that helps running DS4Windows' exclusive mode. (https://github.com/Ryochan7/DS4Windows)

It stops all processes that are known to block DS4Windows from using exclusive mode. (Game Launcher, Xbox gamebar, etc.)

At the moment its "optimised" for NVIDIA systems. (it'll try to end all the nvidia services, doesn't make sense on a system with an AMD GPU...) More compatibility and features will be added soon. 

There are three scripts - *DS4Help*, *DS4HelpAdvanced* & *DS4HelpAdvRun*

* DS4Help is the normal script, you simply press any key and it starts doing its thing. 

* DS4HelpAdvanced allows you to specify the file path of DS4Windows and it'll then start DS4Windows automatically.

* DS4HelpAdvRun does the same thing as DS4HelpAdvanced but without the possibility to change the global path to DS4Windows. 


# Setup
Before using the script it's very helpful to start up DS4Windows and check the "Hide DS4 Controller" box. 

![image](https://user-images.githubusercontent.com/13170303/113399787-136f2180-93a1-11eb-84ba-ffef558f7ba3.png)


# Tutorial - DS4Help
Simply download the script and open it with admin rights.
After opening press a button to start the script, it'll end the processes.

# Tutorial - DS4HelpAdvanced + DS4HelpAdvRun
Running the script will explain every step too, but here's a short overview if there's anything unclear. 

DS4HelpAdvanced and DS4HelpAdvRun automatically start DS4Windows after specifying the path to it. 
If you didn't ever run DS4HelpAdvanced before, it'll ask you to specify the file path to DS4Windows. After you did that a global variable is set, so "DS4HelpAdvRun" can always simply use the specified path and start DS4Windows automatically. If you ever want to change the path, just rerun DS4HelpAdvanced and when it asks "do you want to change it" enter y. 

Your first run will look like this:

![image](https://user-images.githubusercontent.com/13170303/113399270-3c42e700-93a0-11eb-869f-7d8edd64042e.png)

It's pretty self explainatory, you simply have to specify your file path to DS4Windows.exe. After this just confirm it's the right path. 

![image](https://user-images.githubusercontent.com/13170303/113399436-85933680-93a0-11eb-9c3a-32d98d948e70.png)

Afterwards all the processes should be stopped and DS4Windows should be open. 
If the controller is connected and exclusive mode worked, simply press a button to restart the NVIDIA services. 

After your first run, if everything worked, you can always just use DS4HelpAdvRun - this'll skip the variable checks and simply use the set variable.

*note: DS4HelpAdvanced creates a global variable and changes it if needed. - if you want to delete the variable, simply press WIN + R & run "rundll32.exe sysdm.cpl,EditEnvironmentVariables" and delete the variable "DS4HelpPath".*
