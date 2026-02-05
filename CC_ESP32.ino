#include <Wire.h>
#include "Adafruit_TCS34725.h"

#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h> 

Adafruit_TCS34725 tcs = Adafruit_TCS34725(TCS34725_INTEGRATIONTIME_700MS, TCS34725_GAIN_1X);

BLEServer* pServer = NULL;
BLECharacteristic* pCharacteristic = NULL;
bool deviceConnected = false;
bool oldDeviceConnected = false;

#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHARACTERISTIC_UUID "beb5483e-36e1-4688-b7f5-ea07361b26a8"

class MyServerCallbacks: public BLEServerCallbacks {
    void onConnect(BLEServer* pServer) {
      deviceConnected = true;
      BLEDevice::startAdvertising();
    };

    void onDisconnect(BLEServer* pServer) {
      deviceConnected = false;
    }
};



int R = 0;
int G = 0;
int B = 0;

int c = 0;
String str= "";

int button = 16;
unsigned long startTime;                 // 按鈕被按下的起始時間
unsigned long duration;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(button, INPUT);
  if (tcs.begin()) {
    Serial.println("");
    Serial.println("Found sensor");
  } else {
    Serial.println("No TCS34725 found ... check your connections");
  while (1);
  }
  // Create the BLE Device
  BLEDevice::init("Carla!");

  // Create the BLE Server
  pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  // Create the BLE Service
  BLEService *pService = pServer->createService(SERVICE_UUID);

  // Create a BLE Characteristic
  pCharacteristic = pService->createCharacteristic(
                      CHARACTERISTIC_UUID,
                      BLECharacteristic::PROPERTY_READ   |
                      BLECharacteristic::PROPERTY_WRITE  |
                      BLECharacteristic::PROPERTY_NOTIFY |
                      BLECharacteristic::PROPERTY_INDICATE
                    );

    // Create a BLE Descriptor
  pCharacteristic->addDescriptor(new BLE2902());

  // Start the service
  pService->start();

  // Start advertising
  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setScanResponse(false);
  pAdvertising->setMinPreferred(0x0);  // set value to 0x00 to not advertise this parameter
  BLEDevice::startAdvertising();
  Serial.println("Waiting a client connection to notify...");
  
  Serial.println("Press and release button now");
}

void loop() {
  scancolor();
  connectble();
  // put your main code here, to run repeatedly:
    if(digitalRead(button) == HIGH) {
    startTime = millis();                    // 記錄按鈕被按下的起始時間
    while (digitalRead(button) == HIGH)   // 等到按鈕被放開為止
      ;
    duration = millis() - startTime;         // 計算按鈕被按了多久

    }else{
      duration = 0; 
    }
    Serial.print("duration: ");               // 印出 duration 的內容
    Serial.print(duration);
    Serial.println(" microseconds");
    if(duration>=5000){
      Serial.println("restart"); 
      ESP.restart();
     }
    else if(duration<5000&&duration>10){
      Serial.println("sent");
      sentdata();
      str= "";       
    }
     else{
      Serial.println("unpress");
     }
    delay(1000);
}
void scancolor(){
  uint16_t red, green, blue, clear, colorTemp;

  tcs.getRawData(&red, &green, &blue, &clear);
  colorTemp = tcs.calculateColorTemperature(red, green, blue);

  uint32_t sum = clear;
  float r,g,b,rr,gg,bb;

  rr= red;
  gg= green;
  bb= blue;

  r= red;
  r /= sum;

  g= green;
  g /= sum;

  b= blue;
  b /= sum;

  r *=256;
  g *=256;
  b *=256;

  R = r;
  G = g;
  B = b;
  c = sum;

  Serial.print("Color Temp");
  Serial.print(":");
  Serial.println(colorTemp, DEC); 
  Serial.flush();

  Serial.print("R");
  Serial.print(":");
  Serial.print(R);
  Serial.print("(");
  Serial.print(rr);
  Serial.println(")");
 
  Serial.print("G");
  Serial.print(":");
  Serial.print(G);
  Serial.print("(");
  Serial.print(gg);
  Serial.println(")");
 
  Serial.print("B");
  Serial.print(":");
  Serial.print(B);
  Serial.print("(");
  Serial.print(bb);
  Serial.println(")");

  Serial.print("c");
  Serial.print(":");
  Serial.println(sum);
  Serial.flush();
}
void connectble(){
  // notify changed value
    if (deviceConnected) {
        
        str += R;
        str += ",";
        str += G;
        str += ",";
        str += B;
        str += ",";
        str += c;
        str += ",";

         
    }
   // disconnecting
    if (!deviceConnected && oldDeviceConnected) {
        delay(500); // give the bluetooth stack the chance to get things ready
        pServer->startAdvertising(); // restart advertising
        Serial.println("start advertising");
        oldDeviceConnected = deviceConnected;
    }
    // connecting
    if (deviceConnected && !oldDeviceConnected) {
        // do stuff here on connecting
        oldDeviceConnected = deviceConnected;
    }
}
void sentdata(){
     Serial.println(str);
     pCharacteristic->setValue((char*)str.c_str());
     pCharacteristic->notify();
}
