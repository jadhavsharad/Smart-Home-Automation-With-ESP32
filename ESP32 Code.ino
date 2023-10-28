#include "WiFi.h"
#include "NTPClient.h"
#include "WiFiUdp.h"
#include "Firebase_ESP_Client.h"
#include "addons/TokenHelper.h"
#include "DHT.h"


// Define Firebase Credentials
#define DATABASE_URL "YOUR DATABASE URL"
#define API_KEY "YOUR DATABASE API KEY"
#define USER_EMAIL "admin@gmail.com"
#define USER_PASSWORD "admin1"

// Wifi Credentials
#define WIFI_SSID "YOUR WIFI SSID"
#define WIFI_PASSWORD "YOUR WIFI PASSWORD"

// GMT Offset 19800 = +05:30
const long utcOffsetInSeconds = 19800;

// Defining the NTP Client to Get The Time
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", utcOffsetInSeconds);


// Define the Firebase Objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

#define DHTPIN 26
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);


// Define Pins
int relayPin1 = 16;
int relayPin2 = 17;

void initwifi() {
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
}

void setup() {
  Serial.begin(115200);
  initwifi();
  dht.begin();

  // Firebase Auth And Config
  config.api_key = API_KEY;
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;
  config.database_url = DATABASE_URL;
  Firebase.reconnectNetwork(true);
  config.token_status_callback = tokenStatusCallback;
  config.max_token_generation_retry = 5;
  fbdo.setBSSLBufferSize(4096 /* Rx buffer size in bytes from 512 - 16384 */, 1024 /* Tx buffer size in bytes from 512 - 16384 */);
  Firebase.begin(&config, &auth);
  pinMode(relayPin1, OUTPUT);
  pinMode(relayPin2, OUTPUT);
}



void loop() {

  int temperature = dht.readTemperature();
  int humidity = dht.readHumidity();
  int sensor = analogRead(33);
  float voltage = sensor * (5.0 / 1023.0);
  if (voltage > 4.0) {
    digitalWrite(25, HIGH);
  } else {
    digitalWrite(25, LOW);
  }

  timeClient.update();
  if (Firebase.ready()) {
    Firebase.RTDB.setStringAsync(&fbdo, "/Time/", timeClient.getFormattedTime());
    Firebase.RTDB.setIntAsync(&fbdo, "/Temperature/", temperature);
    Serial.println(dht.readTemperature());
    Firebase.RTDB.setIntAsync(&fbdo, "/Humidity/", humidity);
    Serial.println(dht.readHumidity());
    Firebase.RTDB.getInt(&fbdo, "/Pins/16/16");
    int Signal1 = fbdo.intData();
    Signal1 = map(Signal1, 0, 1, 1, 0);
    if (Signal1 == 0) {
      digitalWrite(relayPin1, LOW);
    } else if (Signal1 == 1) {
      digitalWrite(relayPin1, HIGH);
    }
    Firebase.RTDB.getInt(&fbdo, "/Pins/17/17");
    int Signal2 = fbdo.intData();
    Signal2 = map(Signal2, 0, 1, 1, 0);
    if (Signal2 == 0) {
      digitalWrite(relayPin2, LOW);
    } else if (Signal2 == 1) {
      digitalWrite(relayPin2, HIGH);
    }
    Serial.println(Signal1);
    Serial.println(Signal2);
  }
  if (Firebase.isTokenExpired()) {
    Firebase.refreshToken(&config);
    Serial.println("Refresh token");
  }
  delay(1000);
}
