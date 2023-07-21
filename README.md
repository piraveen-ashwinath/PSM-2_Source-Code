# PSM-2_Source-Code
This repository contains all of the files and code used and created during the development of the IoT-Based Air Pollution & Weather Monitoring System.


## Getting Started
This project consists of an Arduino Sketch file, two Python scripts and Dart code files used during the system development process. The Arduino Sketch file is stored within a folder named as 'Arduino Sketch File'. The two Python scripts are located within a folder name 'Python Scripts'. The rest of the repository contains Dart code files used for the development of a Flutter-based Android application.


### 'Python Scripts' Folder
Consists of two Python scripts:

#### Reader.py
Used to obtain sensor readings from the Arduino Uno microcontroller via USB serial connection. The said reading are then uploaded to Firebase Realtime Databse as well as stored in a CSV file.

#### Weatherprediction.py
Used to predict the weather through the use of a linear regression algorithm which is then uploaded to Firebase Realtime Database.


### 'Adruino Sketch File' folder
Contains the Arduino Sketch File used to program the Arduino Uno microcontroller.


### The Rest of The Repository
Contains the packages and Dart codes required for the development of the Flutter-based Android application.
