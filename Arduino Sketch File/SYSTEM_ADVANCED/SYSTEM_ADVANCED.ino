//Libraries
#include <DHT.h>;
#include <SDS011.h>;
#include <SFE_BMP180.h>
#include <SPI.h>;
#include <Wire.h>;
#include <SoftwareSerial.h>
#include <Wire.h>

//Constants
#define DHTPIN 2     // what pin we're connected to
#define DHTTYPE DHT22   // DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE); //// Initialize DHT sensor for normal 16mhz Arduino
#define sensorPin A0
#define POWER_PIN   7
#define SIGNAL_PIN  8
//#define THRESHOLD   300 
#define ALTITUDE 35.0
//SoftwareSerial espSerial(5, 6);


//Variables
float humidity;  //Stores humidity value
float temperature; //Stores temperature value
float p10,p25;
int error;
SDS011 nova;
int rain = 0;
SFE_BMP180 pressure;
char status;
float T,P,p0,a;
float condition;
long RL = 1000; // 1000 Ohm
long Ro = 830; // 830 ohm ( SILAHKAN DISESUAIKAN)
float SensorValues[7] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0};


void setup()
{
  Serial.begin(9600);
  //espSerial.begin(115200);
	dht.begin();
  nova.begin(4,3); //Digital Pin 04 receives input from TX terminal of the sensor
                   //Digital Pin 03 receives input from RX terminal of the sensor
  pinMode(POWER_PIN, OUTPUT);   // configure D7 pin as an OUTPUT
  digitalWrite(POWER_PIN, LOW); // turn the sensor OFF

if (pressure.begin()){
    Serial.println();
    //espSerial.println("Pressure sensor connected");
}
  else
  {
    // Oops, something went wrong, this is usually a connection problem,
    // see the comments at the top of this sketch for the proper connections.

    Serial.println("Pressure sensor not available");
    //espSerial.println("Pressure sensor not available");
    //while(1); // Pause forever.
  }


}




void loop()
{
    //Temperature & Humidity
    humidity = dht.readHumidity();
    temperature= dht.readTemperature();
    Serial.print("Humidity: ");
    Serial.print(humidity);
    Serial.println(" %");
    Serial.print("Temperature: ");
    Serial.print(temperature);
    Serial.println(" Celsius");
    
    //Carbon Monoxide
    int sensorvalue = analogRead(sensorPin);    // membaca nilai ADC dari sensor
    float VRL= sensorvalue*5.00/1024;           // mengubah nilai ADC ( 0 - 1023 ) menjadi nilai voltase ( 0 - 5.00 volt )
    float Rs = ( 5.00 * RL / VRL ) - RL;
    float ppm = 100 * pow(Rs / Ro,-1.53);       // ppm = 100 * ((rs/ro)^-1.53);
    Serial.print("CO : ");
    Serial.print(ppm);
    Serial.println(" ppm");

    //Dust PM 2.5 & PM 10
    error = nova.read(&p25,&p10);
    if (! error) {
    Serial.println("PM 2.5: "+String(p25));
    Serial.println("PM 10:  "+String(p10));
  }

    //Rain
    digitalWrite(POWER_PIN, HIGH);  // turn the sensor ON
    delay(10);                      // wait 10 milliseconds
    rain = digitalRead(SIGNAL_PIN); // read the analog value from sensor
    digitalWrite(POWER_PIN, LOW);   // turn the sensor OFF

    if (rain > 0) {
      condition= 0.0;
      Serial.println(condition);
  } else {
      condition= 1.0;
      Serial.println(condition);
  }

    //Pressure
    status = pressure.startPressure(3);
      if (status != 0)
      {
        // Wait for the measurement to complete:
        delay(status);

        // Retrieve the completed pressure measurement:
        // Note that the measurement is stored in the variable P.
        // Note also that the function requires the previous temperature measurement (T).
        // (If temperature is stable, you can do one temperature measurement for a number of pressure measurements.)
        // Function returns 1 if successful, 0 if failure.

        status = pressure.getPressure(P,T);
        if (status != 0)
        {
          // Print out the measurement:
         //Serial.print("Absolute pressure: ");
         //Serial.print(P,2);
         //Serial.println(" hPa");
          //espSerial.print("Absolute pressure: ");
          //espSerial.print(P,2);
          //espSerial.println(" hPa");

          // The pressure sensor returns abolute pressure, which varies with altitude.
          // To remove the effects of altitude, use the sealevel function and your current altitude.
          // This number is commonly used in weather reports.
          // Parameters: P = absolute pressure in mb, ALTITUDE = current altitude in m.
          // Result: p0 = sea-level compensated pressure in mb

          p0 = pressure.sealevel(P,ALTITUDE);                     // we're at 1655 meters (Boulder, CO)
          Serial.print("Relative (SEA-LEVEL) pressure: ");
          Serial.print(p0,2);
          Serial.println(" hPa");
          //Serial.print('\n');
          //espSerial.print("Relative (SEA-LEVEL) pressure: ");
          //espSerial.print(p0,2);
          //espSerial.println(" hPa");


          // On the other hand, if you want to determine your altitude from the pressure reading,
          // use the altitude function along with a baseline pressure (sea-level or other).
          // Parameters: P = absolute pressure in mb, p0 = baseline pressure in mb.
          // Result: a = altitude in m.

          a = pressure.altitude(P,p0);
          //Serial.print("Computed altitude: ");
          //Serial.print(a,0);
          //Serial.println(" meters");
          //espSerial.print("Computed altitude: ");
          //espSerial.print(a,0);
          //espSerial.println(" meters");
        }
        else{
           Serial.println("ERROR. Unable to retrieve pressure measurement");
           //Serial.print('\n');
           //espSerial.println("ERROR. Unable to retrieve pressure measurement");
        }
      }
      else{
         Serial.println("ERROR. Unable to start pressure measurement\n");
         //Serial.print('\n');
         //espSerial.println("ERROR. Unable to start pressure measurement");
    }





    //Serial.println();
    //Serial.println('\n');

    //espSerial.println();


  SensorValue[0]=temperature;
  SensorValue[1]=humidity;
  SensorValue[2]=ppm;
  SensorValue[3]=p25;
  SensorValue[4]=p10;
  SensorValue[5]=condition;
  SensorValue[6]=p0;

  Serial.print(SensorValue);


    delay(3000); //Delay 3 seconds
}

   