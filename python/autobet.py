from pynput.mouse import Button, Controller as MouseController
from pynput.keyboard import Key, KeyCode, Controller as KeyController
import time
mymouse = MouseController()
mykeyboard = KeyController()
# print("Pusición actual: " + str(mymouse.position))
for i in range(0, 3):
    mymouse.position = (434, 735)
    mymouse.click(Button.left, 1)
    mykeyboard.type('.bf 1 h')
    mykeyboard.press(Key.enter)
    time.sleep(1)
    mykeyboard.release(Key.enter)
    time.sleep(7)
