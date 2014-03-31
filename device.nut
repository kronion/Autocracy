// create a global variabled called led, 
// and assign pin9 to it
led <- hardware.pin9;
left <- hardware.pin2;
right <- hardware.pin5;
 
// configure led to be a digital output
led.configure(DIGITAL_OUT);
left.configure(DIGITAL_IN);
right.configure(DIGITAL_IN);
 
// function to turn LED on or off
function setLed(ledState) {
  led.write(ledState);
}

local test = false;
while(true) {
  if(left.read() && hardware.millis() % 1000 == 0) {
    test = !test;
    setLed(test.tointeger());
    agent.send("command", "left");
  }
  else if(right.read() && hardware.millis() % 1000 == 0) {
    test = true;
    setLed(test.tointeger());
    agent.send("command", "right");
  }
}
