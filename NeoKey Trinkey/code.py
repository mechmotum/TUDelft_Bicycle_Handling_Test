import time
import board
import neopixel
from digitalio import DigitalInOut, Pull
import touchio

# create the pixel and turn it off
pixel = neopixel.NeoPixel(board.NEOPIXEL, 1, brightness=0.5)
pixel.fill(0x0)

# Sleep for a bit to avoid a race condition on some systems
time.sleep(1) 

# create the switch, add a pullup, start it with not being pressed
button = DigitalInOut(board.SWITCH)
button.switch_to_input(pull=Pull.DOWN)
button_state = False
button_gate = False

time.sleep(1)

# create the captouch element and start it with not touched
touch = touchio.TouchIn(board.TOUCH)
touch_state = False
touch_gate = False

lastPrint = time.monotonic()

while True:
    if button.value and not button_state:
        pixel.fill((0, 0, 255)) # Blue
        button_state = True

    if not button.value and button_state:
        button_gate = not button_gate
        button_state = False

    if touch.value and not touch_state:
        pixel.fill((0, 0, 255)) # Blue
        touch_state = True
    if not touch.value and touch_state:
        touch_gate = not touch_gate
        touch_state = False

    if not button.value and not touch.value:
        if button_gate:
            pixel.fill((255, 0, 0)) # Red
        elif touch_gate:
            pixel.fill((0, 255, 0)) # Green
        else:
            pixel.fill((0x0)) # Nothing

    # Print 1 if it was touched, 0 if not
    if touch_gate:
        touch_number = 1
    else:
        touch_number = 0
    
    # Print every 50ms to avoid overwhelming the serial buffer
    if time.monotonic() - lastPrint > 0.05:
        print("%d" % (touch_number))
        lastPrint = time.monotonic()
