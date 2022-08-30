int LEDpin = 2;
int BUTTONpin = 3;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(LEDpin, OUTPUT);
  pinMode(BUTTONpin, INPUT_PULLUP);
  digitalWrite(LEDpin, HIGH);
}

void loop() {
  // put your main code here, to run repeatedly:
  int state = digitalRead(BUTTONpin);
  Serial.println(!state);
  digitalWrite(LEDpin, !state);
  delay(50);
}
