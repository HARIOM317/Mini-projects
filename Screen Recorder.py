import cv2
import pyautogui
from win32api import GetSystemMetrics
import numpy as np
import time

width = GetSystemMetrics(0)
height = GetSystemMetrics(1)

dimension = (width, height)
f = cv2.VideoWriter_fourcc(*"XVID")
output = cv2.VideoWriter("MyScreenRecording.mp4", f, 30.0, dimension)

current_start_time = time.time()
duration = 10
end_time = current_start_time + duration

while True:
    image = pyautogui.screenshot()
    frame_1 = np.array(image)
    frame = cv2.cvtColor(frame_1, cv2.COLOR_BGR2RGB)
    output.write(frame)
    current_time = time.time()
    if current_time > end_time:
        break
output.release()
print("__________ Screen has been recorded successfully __________")

