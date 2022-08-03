import pyttsx3
import speech_recognition as sr
import wikipedia
import webbrowser
import os
import datetime
import time
import random
import smtplib
import pyjokes

engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[2].id)

def speak(audio):
    engine.say(audio)
    engine.runAndWait()
    rate = engine.getProperty('rate')
    engine.setProperty('rate', 150)     # Set voice speed (Speak 150 words per minutes)

def wishMe():
    hour = int(datetime.datetime.now().hour)
    if 0 <= hour < 12:
        speak("Good Morning!")
    elif 12 <= hour < 18:
        speak("Good Afternoon!")
    else:
        speak("Good Evening!")
    speak("I am a Jarvis assistant. Please tell me how may i help you? ")

def TakeCommand():
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening...")
        r.adjust_for_ambient_noise(source) # Remove source noise
        r.pause_threshold = 1
        audio = r.listen(source)

    try:
        print("Recognizing...")
        query = r.recognize_google(audio, language='en-in')
        print(f"User said: {query}\n")
    except:
        print("Say that again please...")
        return "None"

    return query

def sendEmail(to, content):
    # First you will have to enable less secure apps in gmail
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.ehlo()
    server.starttls()
    server.login('your email', 'type password by using a file for security')
    server.sendmail('your email', to, content)
    server.close()


if __name__ == '__main__':
    wishMe()
    while True:
        random_song = random.randint(1, 200)
        query = TakeCommand().lower()
        # Logic for executing tasks based on query
        if 'wikipedia' in query:
            speak('searching wikipedia...')
            query = query.replace("wikipedia", "")
            results = wikipedia.summary(query, sentences=1)
            speak("According to wikipedia")
            print(results)
            speak(results)

        elif 'your name' in query:
            speak("My name is Lisha. How may i help you?")

        elif 'old are you' in query or 'your age' in query:
            speak("There is no age define for me but i created at 15 feburary 2022.")

        elif 'joke' in query:
            speak("Okay here i present a joke for you...")
            jokes = pyjokes.get_joke(language="en", category="all")     # Speak random jokes
            print(jokes)
            speak(jokes)

        elif 'open youtube' in query or 'open the youtube' in query or 'open my youtube' in query:
            webbrowser.open("youtube.com")

        elif 'open google' in query or 'open the google' in query or 'open my google' in query:
            webbrowser.open("google.com")

        elif 'open gmail' in query or 'open the gmail' in query or 'open my gmail' in query:
            webbrowser.open("gmail.com")

        elif 'open outlook' in query or 'open the outlook' in query or 'open my outlook' in query:
            webbrowser.open("outlook.com")

        elif 'close browser' in query or 'close the browser' in query or 'close my browser' in query:
            os.system("taskkill /im msedge.exe /f")     # it will close the browser

        elif 'play music' in query or 'play the music' in query or 'play songs' in query:
            music_dir = 'C:\\Users\\hariom mewada\\Music'
            songs = os.listdir(music_dir)
            os.startfile(os.path.join(music_dir, songs[random_song]))

        elif 'time' in query or 'the time' in query:
            current_time = datetime.datetime.now().strftime("%I:%M:%S %p")  # %I - gives hour in 12_hour_format, % M - Gives minutes, %S - Gives seconds and %p gives AM or PM
            print(current_time)
            speak(f"The current time is: {current_time}")

        elif 'open code' in query or 'vs code' in query or 'visual studio code' in query:
            code_path = "C:\\Users\\hariom mewada\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe"
            os.startfile(code_path)

        elif 'email to hariom' in query:
            try:
                speak("what should i say?")
                content = TakeCommand()
                to = "type email here where you want to send the mail"
                sendEmail(to, content)
                speak("Email has been sent.")
            except Exception as e:
                speak("Sorry! sir, I am not able to send this email at this movement")

        elif 'quit' in query or 'close' in query:
            print("Closing...")
            speak("Thanks sir! Have a nice day")
            exit()

        time.sleep(3)
