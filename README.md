axihome
=======

Automation Integrated for your house

Client for on-domo-nutsy server written in Qt


Use with axihome-server

Features :
-----------

- Control every devices defined on axihome-server
- View weather conditions, temperatures in each places
- Load scene with NFC Tag

How to use :
-------------

Write a config.ini file in :

- linux : /home/user/.on-domo-qt
- android : /sdcard/.on-domo-qt

config.ini sample :

serverIp=192.168.1.1
sceneUrl=http://192.168.1.1:20002/call/domo/loadScene?name= (android)

To use nfc tags to load a scene you have to write a text tag with the following :

Scene=MyScene
