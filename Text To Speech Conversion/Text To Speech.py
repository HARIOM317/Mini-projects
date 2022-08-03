# Import useful libraries
from tkinter import *
from tkinter import filedialog
from tkinter.ttk import Combobox
import pyttsx3
import os

# initialize pyttsx3
engine = pyttsx3.init()

# create download function to save the audio file
def download():
    text = text_area.get(1.0, END)
    gender = gender_combo_box.get()
    speed = speed_combo_box.get()
    voices = engine.getProperty('voices')

    # define setvoice function to set the gender voice
    def setvoice():
        if (gender == 'Male'):
            engine.setProperty('voice', voices[0].id)
            path = filedialog.askdirectory()
            os.chdir(path)
            engine.save_to_file(text, 'TextAudio.mp3')
            engine.runAndWait()
        else:
            engine.setProperty('voice', voices[1].id)
            path = filedialog.askdirectory()
            os.chdir(path)
            engine.save_to_file(text, 'TextAudio.mp3')
            engine.runAndWait()

    # Conditions for voice rate
    if (text):
        if (speed == 'Fast'):
            engine.setProperty('rate', 200)
            setvoice()
        elif (speed == 'Normal'):
            engine.setProperty('rate', 150)
            setvoice()
        else:
            engine.setProperty('rate', 100)
            setvoice()

# Create speak function to speak the text
def speak():
    text = text_area.get(1.0, END)
    gender = gender_combo_box.get()
    speed = speed_combo_box.get()
    voices = engine.getProperty('voices')

    # define setvoice function to set the gender voice
    def setvoice():
        if (gender == 'Male'):
            engine.setProperty('voice', voices[0].id)
            engine.say(text)
            engine.runAndWait()
        else:
            engine.setProperty('voice', voices[1].id)
            engine.say(text)
            engine.runAndWait()

    # Conditions for voice rate
    if (text):
        if (speed == 'Fast'):
            engine.setProperty('rate', 200)
            setvoice()
        elif (speed == 'Normal'):
            engine.setProperty('rate', 150)
            setvoice()
        else:
            engine.setProperty('rate', 100)
            setvoice()

root = Tk()
root.title("Text to Speech")
root.geometry('1000x620+150+10')
root.resizable(False, False)
root.config(bg="#942d74")

# Set icon
root.wm_iconbitmap('textToSpceech.ico')

# Create top frame
top_frame = Frame(root, bg='#76245d', width=1000, height=200)
top_frame.place(x=0, y=0)

# Set Image Logo
Logo = PhotoImage(file='text_to_speech.png')
Label(top_frame, image=Logo, bg="#76245d").place(x=450, y=10)

# Set text in label
Label(top_frame, text="Text To Speech", font=("Poor Richard", 25, 'italic'), bg='#76245d', fg='white').place(x=430, y=150)

# Create text area
text_area = Text(root, font="Georgia 15", bg='white', relief=GROOVE, wrap=WORD)
text_area.place(x=10, y=210, width=800, height=400)

Label(root, text="VOICE", font='Georgia 10 bold', bg='#942d74', fg='white').place(x=875, y=225)
Label(root, text="SPEED", font='Georgia 10 bold', bg='#942d74', fg='white').place(x=875, y=295)

# create gender combo box
gender_combo_box = Combobox(root, values=['Male', 'Female'], font='Georgia 10', state='r', width=10)
gender_combo_box.place(x=848, y=250)
gender_combo_box.set('Male')

# create speed combo box
speed_combo_box = Combobox(root, values=['Fast', 'Normal', 'Slow'], font='Georgia 10', state='r', width=10)
speed_combo_box.place(x=848, y=320)
speed_combo_box.set('Normal')

# Set speak icon
speak_image = PhotoImage(file='speaker-icon.png')
speak_button = Button(root, image=speak_image, bg='#942d74', activebackground='#942d74', bd=0, command=speak)
speak_button.place(x=870, y=400)

# Set save icon
save_image = PhotoImage(file='save_icon.png')
save_button = Button(root, image=save_image, bg='#942d74', activebackground='#942d74', bd=0, command=download)
save_button.place(x=870, y=500)

root.mainloop()
