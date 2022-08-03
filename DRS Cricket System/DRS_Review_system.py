import tkinter
from tkinter import ttk
import PIL.Image, PIL.ImageTk
import cv2
from functools import partial
import threading
import imutils
import time

stream = cv2.VideoCapture("clip.mp4")
flag = True

def play(speed):
    global flag
    print(f"You clicked on play. Speed is {speed}")
    frame1 = stream.get(cv2.CAP_PROP_POS_FRAMES)
    stream.set(cv2.CAP_PROP_POS_FRAMES, frame1 + speed)

    grabbed, frame = stream.read()
    if not grabbed:
        exit()
    frame = imutils.resize(frame, width=SET_WIDTH, height=SET_HEIGHT)
    frame = PIL.ImageTk.PhotoImage(image=PIL.Image.fromarray(frame))
    canvas.image = frame
    canvas.create_image(0, 0, image=frame, anchor=tkinter.NW)
    if flag:
        canvas.create_text(150, 25, fill="red", font="Times 27 italic bold", text="Decision Pending!")
    flag = not flag

def pending(decision):
    # 1. Display empire image
    frame = cv2.cvtColor(cv2.imread("empire.png"), cv2.COLOR_BGR2RGB)
    frame = imutils.resize(frame, width=SET_WIDTH, height=SET_HEIGHT)
    frame = PIL.ImageTk.PhotoImage(image=PIL.Image.fromarray(frame))
    canvas.image = frame
    canvas.create_image(0, 0, image=frame, anchor=tkinter.NW)
    # 2. Wait for 1 second
    time.sleep(1)
    # 3. Display Decision Pending Image
    frame = cv2.cvtColor(cv2.imread("decision_pending.png"), cv2.COLOR_BGR2RGB)
    frame = imutils.resize(frame, width=SET_WIDTH, height=SET_HEIGHT)
    frame = PIL.ImageTk.PhotoImage(image=PIL.Image.fromarray(frame))
    canvas.image = frame
    canvas.create_image(0, 0, image=frame, anchor=tkinter.NW)
    # 4. Wait for 1 second
    time.sleep(1)
    # 5. Display sponser image
    frame = cv2.cvtColor(cv2.imread("sponser.png"), cv2.COLOR_BGR2RGB)
    frame = imutils.resize(frame, width=SET_WIDTH, height=SET_HEIGHT)
    frame = PIL.ImageTk.PhotoImage(image=PIL.Image.fromarray(frame))
    canvas.image = frame
    canvas.create_image(0, 0, image=frame, anchor=tkinter.NW)
    # 6. Wait for 1.5 second
    time.sleep(1.5)
    # 7. Display six/out/not out image
    if decision == 'out':
        DecisionImg = "out.png"
    elif decision == 'six':
        DecisionImg = "six.png"
    else:
        DecisionImg = "notout.png"

    frame = cv2.cvtColor(cv2.imread(DecisionImg), cv2.COLOR_BGR2RGB)
    frame = imutils.resize(frame, width=SET_WIDTH, height=SET_HEIGHT)
    frame = PIL.ImageTk.PhotoImage(image=PIL.Image.fromarray(frame))
    canvas.image = frame
    canvas.create_image(0, 0, image=frame, anchor=tkinter.NW)


def out():
    thread = threading.Thread(target=pending, args=("out", ))
    thread.daemon = 1
    thread.start()
    print("Player is out!")

def not_out():
    thread = threading.Thread(target=pending, args=("not out",))
    thread.daemon = 1
    thread.start()
    print("Player is not out!")

def Six():
    thread = threading.Thread(target=pending, args=("six",))
    thread.daemon = 1
    thread.start()
    print("Six")

SET_WIDTH = 650
SET_HEIGHT = 368

cv_img = cv2.cvtColor(cv2.imread("DRS.png"), cv2.COLOR_BGR2RGB)
window = tkinter.Tk()
window.title("Third Empire Decision Making System")
canvas = tkinter.Canvas(window, width=SET_WIDTH, height=SET_HEIGHT)
photo = PIL.ImageTk.PhotoImage(image=PIL.Image.fromarray(cv_img))
image_on_canvas = canvas.create_image(0, 0, ancho=tkinter.NW, image=photo)
canvas.pack()

# Buttons to control playback
ttk.Button(window, text="<< Previous (fast)", width=50, command=partial(play, -25)).pack()
ttk.Button(window, text="<< Previous (slow)", width=50, command=partial(play, -2)).pack()
ttk.Button(window, text="Next (slow) >>", width=50, command=partial(play, 2)).pack()
ttk.Button(window, text="Next (fast) >>", width=50, command=partial(play, 25)).pack()
ttk.Button(window, text="Give Out", width=50, command=out).pack()
ttk.Button(window, text="Give Not Out", width=50, command=not_out).pack()
ttk.Button(window, text="Give Six", width=50, command=Six).pack()

window.mainloop()
