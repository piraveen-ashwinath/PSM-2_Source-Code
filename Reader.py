import time
import serial
import csv
import pyrebase

firebaseConfig = {
  "apiKey": "AIzaSyAT_zLMUpPwRnY35AvwaUbd4w7VTH2gP1Q",
  "authDomain": "utm-clime.firebaseapp.com",
  "databaseURL": "https://utm-clime-default-rtdb.asia-southeast1.firebasedatabase.app",
  "projectId": "utm-clime",
  "storageBucket": "utm-clime.appspot.com",
  "messagingSenderId": "349645787971",
  "appId": "1:349645787971:web:9c3a2d238828c76061d5f6",
  "measurementId": "G-QFJ8PNG7V7"
 };

firebase = pyrebase.initialize_app(firebaseConfig)
database = firebase.database()

Arduino =serial.Serial('com5',9600)
time.sleep(1)

    
while 1:
    while (Arduino.inWaiting()==0):
       pass
    data=Arduino.readline()
    data=str(data, 'utf-8') 
    data=data.strip('\r\n')
    splitData=data.split(",")
    #print(splitData)
    database.child("Readings").child("Humidity").push(splitData[0])
    database.child("Readings").child("Temperature").push(splitData[1])
    database.child("Readings").child("CarbonMonoxideLevels").push(splitData[2])
    database.child("Readings").child("DustSmall").push(splitData[3])
    database.child("Readings").child("DustBig").push(splitData[4])
    database.child("Readings").child("Rain").push(splitData[5])
    database.child("Readings").child("Pressure").push(splitData[6])
    database.child("Readings").remove()
    with open('Readings.csv','a',newline='')as f:
        write=csv.writer(f)
        write.writerow(splitData)

    print("Temperature: ",splitData[1]," Celsius")
    print("Humidity: ",splitData[0]," %")
    print("Rain: ",splitData[5]," (0 = NO, 1 = YES)")
    print("Pressure: ",splitData[6]," hPa")
    print("Carbon Monoxide Levels: ", splitData[2]," ppm")
    print("Dust Particles (PM 2.5): ",splitData[3])
    print("Dust Particles (PM 10): ",splitData[4])
    print(" ")
