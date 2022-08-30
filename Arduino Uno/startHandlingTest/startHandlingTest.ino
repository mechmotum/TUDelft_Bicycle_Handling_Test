int LEDpin = 2;
int BUTTONpin = 3;

void setup() {
  Serial.begin(9600);
  pinMode(LEDpin, OUTPUT);
  pinMode(BUTTONpin, INPUT_PULLUP);
  digitalWrite(LEDpin, LOW);
}

void loop() {
  int state = digitalRead(BUTTONpin); // Read the button's state
  // Button state is 1 when not pressed, 0 when pressed
  // So we need to invert it in Serial and LEDs
  Serial.println(!state); // Print the button's state to serial
  digitalWrite(LEDpin, !state); // Turn on the button
  delay(50);
}
