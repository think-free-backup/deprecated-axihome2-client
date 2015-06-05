THIS IS THE OLD VERSION OF THE CLIENT, NEW ONE HAS A LOTS OF IMPROVMENT BUT IS WAITING ON A PRIVATE REPO FOR CODE CLEANING OF PESONAL STUFFS, IF YOU WANT TO ACCESS THE CODE, PING ME

axihome
=======

Automation Integrated for your house

This is a client for axihome-server written in Qt


Use with axihome-server

Features :
-----------

- Control every devices defined on axihome-server
- View weather conditions, temperatures in each places
- Load scene with NFC Tag

How to use :
-------------

Write a config.ini file in :

- linux : /home/user/.axihome
- android : /sdcard/.axihome

config.ini sample :

serverIp=192.168.1.1
sceneUrl=http://192.168.1.1:20002/call/domo/loadScene?name= (android)

To use nfc tags to load a scene you have to write a text tag with the following :

Scene=MyScene
