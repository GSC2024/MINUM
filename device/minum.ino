// Sensor TDS, TEMP, PH, TURBIDITY

// Note most code made for ESP32/ESP8266
#include <OneWire.h>
#include <DallasTemperature.h>
#include <DFRobot_ESP_EC.h>

#include <ESP8266WiFi.h>
#include <Firebase_ESP_Client.h>

// Provide the token generation process info.
#include "addons/TokenHelper.h"
// Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"

// Insert Firebase project API Key & URL
#define API_KEY "AIzaSyCQChQAlOrgKtxgg9Dun4FM52hbpFled2k"
#define DATABASE_URL "https://esp32-watergsc-default-rtdb.asia-southeast1.firebasedatabase.app/"

// Insert Authorized Email and Corresponding Password
#define USER_EMAIL "kyran123@gmail.com"
#define USER_PASSWORD "123456789"

// Insert your network credentials
#define WIFI_SSID "UGM-Insecure"
#define WIFI_PASSWORD "orca12390"

// Define Firebase Data Object, Auth Data, Config Data
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

// Connect to the ESP8266 D13
#define ONE_WIRE_BUS 13

// Setup a oneWire instance
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature sensor
DallasTemperature temp(&oneWire);

DFRobot_ESP_EC tds;

// Default for initialization
float tdsVoltage, tdsValue, temperature, phVoltage, phValue, turbidityVoltage = 25;
int samples = 10;
float adcResolution = 1024.0;

float readTemperature()
{
  float tempSum = 0;
  
  for (int i = 0; i < samples; i++)
  // Call ds.requestTemperatures() to issue a request for temperature
  {
    temp.requestTemperatures();
    tempSum += temp.getTempCByIndex(0);
    delay(10);
  }
  return tempSum / samples;
}

float getTDS()
{
  float tdsSum = 0;
  
  for (int i = 0; i < samples; i++)
  {
    tdsVoltage = analogRead(12);
    temperature = readTemperature();
    tdsValue = tds.readEC(tdsVoltage, temperature);
    tdsSum += tdsValue;
    delay(10);
  }
  return tdsSum / samples;
}

float calculatePH()
{
  float phSum = 0;
  
  for (int i = 0; i < samples; i++)
  {
    phVoltage += analogRead(A0);
    delay(10); // Delay for stability
    phSum += 5 / adcResolution * phVoltage;
  }

  // Calculate average pH voltage
  float phValue = phSum / samples;

  // Calculate and return pH
  return 7 + ((2.5 - phValue) / 0.18);
}

float getTurbidty()
{
  float turbiditySum = 0;
  
  for (int = 0; i < samples; i++)
  {
    turbidityVoltage = analogRead(A1);
    
    // Calibration
    turbidityValue = map(turbidityVoltage, 0, 1023, 0, 500) - 125;
    
    turbiditySum += turbidtyVoltage;

    delay(10);
  }
  return turbiditySum / samples;
}

void initWiFi()
{
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to WiFi ..");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print('.');
    delay(1000);
  }
  Serial.println("WiFi Connected");
}

void setup()
{
  Serial.begin(115200);

  // Initialize WiFi
  initWiFi();

  // Initialize sensors
  tds.begin();
  temp.begin();

  // Assign the api key
  config.api_key = API_KEY;

  // Assign the user sign in credentials
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  // Assign the RTDB URL
  config.database_url = DATABASE_URL;

  // Reconnect to Firebase & Data transmission limit
  fbdo.setResponseSize(4096);

  // Callback function for long running token generation task
  config.token_status_callback = tokenStatusCallback;

  // Initialize Firebase auth & config
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
}

void loop()
{
  String pathTDS = "/users/";
  pathTDS += auth.token.uid.c_str();
  pathTDS += "/sensor/TDS";

  String pathPH = "/users/";
  pathPH += auth.token.uid.c_str();
  pathPH += "/sensor/PH";

  String pathTurbidity = "/users/";
  pathTurbidity += auth.token.uid.c_str();
  pathTurbidity += "/sensor/Turbidity";

  String pathDeviceStatus = "/users/";
  pathDeviceStatus += auth.token.uid.c_str();
  pathDeviceStatus += "/device";

  if (Firebase.RTDB.getBool(&fbdo, pathDeviceStatus))
  {
    if (fbdo.boolData() == true)
    {
      // TDS
      if (Firebase.RTDB.setFloat(&fbdo, pathTDS, tdsValue)))
      {
        Serial.println("PASSED");
        Serial.println("PATH: " + fbdo.dataPath());
        Serial.println("TYPE: " + fbdo.dataType());
      }
      else
      {
        Serial.println("FAILED");
        Serial.println("REASON: " + fbdo.errorReason());
      }

      // PH
      if (Firebase.RTDB.setFloat(&fbdo, pathPH, phValue)))
      {
        Serial.println("PASSED");
        Serial.println("PATH: " + fbdo.dataPath());
        Serial.println("TYPE: " + fbdo.dataType());
      }
      else
      {
        Serial.println("FAILED");
        Serial.println("REASON: " + fbdo.errorReason());
      }

      // Turbidity
      if (Firebase.RTDB.setFloat(&fbdo, pathTurbidity, turbidityValue)))
      {
      Serial.println("PASSED");
        Serial.println("PATH: " + fbdo.dataPath());
        Serial.println("TYPE: " + fbdo.dataType());
      }
      else
      {
        Serial.println("FAILED");
        Serial.println("REASON: " + fbdo.errorReason());
      }
    }
  }
}
