from tkinter import *
from tkinter import messagebox
from threading import Thread
import wikipedia

root = Tk()
root.config(bg='#171a28')
root.resizable(False, False)

Label(root, text="Search any wikipedia here", font=("Poor Richard", 25, 'bold'), fg='white', bg='#171a28').pack()

def threading_search():
    t1 = Thread(target=search)
    t1.start()

def search():
    try:
        global answer_value
        entry_value = entry.get()
        answer.delete(1.0, END)
        try:
            answer_value = wikipedia.summary(entry_value)
        except Exception as e:
            print(e)
            answer.insert(INSERT, "Something went wrong!")
        answer.insert(INSERT, answer_value)
    except:
        messagebox.showerror("Error", "Check your internet connection!")

topFrame = Frame(root, bg='#171a28')
entry = Entry(topFrame, width=30, bg='white', fg='black', bd=0, highlightcolor='#00e9ff', highlightthickness=2, highlightbackground='#00b5ff', font="default 25")
entry.bind("<Return>", lambda e: threading_search())
entry.pack(ipadx=10)
button = Button(topFrame, text="Search", pady=10, padx=20, bg='light blue', fg='black', font='Georgia 16', command=threading_search)
button.pack(pady=10)
topFrame.pack(side=TOP)

bottomFrame = Frame(root)
scrollbar = Scrollbar(bottomFrame)
scrollbar.pack(side=RIGHT, fill=Y)
answer = Text(bottomFrame, width=80, height=20, yscrollcommand=scrollbar.set, bg='#1c2031', fg='white', wrap=WORD, font='Georgia 14')
scrollbar.config(command=answer.yview)
answer.pack()

bottomFrame.pack(side=BOTTOM)

root.mainloop()
