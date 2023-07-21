import time
import serial
import pyrebase
import pandas as pd
import numpy as np
import seaborn as sns
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from matplotlib import pyplot as plt


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

condition="Forecast"

while 1:
    data = pd.read_csv('Readings.csv')

    X = data[['Temperature']]
    y = data['Pressure']

    # Split the data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Create a Linear Regression model
    model = LinearRegression()

    # Train the model
    model.fit(X_train, y_train)

    # Make predictions using the trained model
    y_pred = model.predict(X_test)

    # Calculate the mean squared error
    mse = mean_squared_error(y_test, y_pred)

    print("Mean Squared Error: ",mse)
    print(" ")
    #print(X)
    print("Predicted Pressure Values: ",y_pred)
    print(" ")

    if y_pred.any() > 1015.0:
        condition="Clear Sky Ahead"
        print("Prediction: ",condition)
    elif 1005.0 < y_pred.any() < 1015.0:
        condition="Clouds Forming, Wind Picking Up"
        print("Prediction: ",condition)
    else:
        condition="Rain Expected"
        print("Prediction: ",condition)

    plt.scatter(X_train, y_train,color='g') 
    plt.plot(X_test, y_pred,color='k')
    plt.title("Rain Prediction: Pressure vs Temperature")
    plt.xlabel("Temperature (Celsius)")
    plt.ylabel("Pressure (hPa)")
    plt.show()

    database.child("Weather Forecast").push(condition)
    time.sleep(3)
    database.child("Weather Forecast").remove()

