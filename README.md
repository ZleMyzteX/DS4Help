# DS4Help
Simple script that helps running DS4Windows' exclusive mode. (https://github.com/Ryochan7/DS4Windows)

It stops all processes that are known to block DS4Windows from using exclusive mode. (Game Launcher, Xbox gamebar, etc.)

At the moment its "optimised" for NVIDIA systems. (it'll try to end all the nvidia services, doesn't make sense on a system with an AMD GPU...) More compatibility and features will be added soon. 

There are two versions - *DS4Help* & *DS4HelpAdvanced*:

* DS4Help is the normal script, you simply press any key and it starts doing its thing. 

* DS4HelpAdvanced allows you to specify the file path of DS4Windows and it'll then start DS4Windows automatically. At the moment the file path is not saved - not that practical I guess...

# Tutorilla:
Simply download the script and open it with admin rights.
After opening press a button to start the script, it'll end the processes.
