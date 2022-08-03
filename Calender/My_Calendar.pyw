# Import libraries
from tkinter import *
from tkcalendar import *
import datetime
import babel.numbers        # for backend process in .exe file

# Get current year
current_year = (datetime.datetime.now().strftime("%Y"))

# Create showTime function to show current time
def showTime():
    time = datetime.datetime.now().strftime("%I : %M : %S  %p")
    time_label = Label(root, width=15, text=time, fg='orange', bg='#10161f', font=("Aparajita", 20))
    time_label.place(x=150, y=350)
    time_label.after(200, showTime)


if __name__ == '__main__':      # Start execution from here
    # Create instance of Tk class
    root = Tk()
    root.geometry("490x420+350+50")    # set geometry
    root.title("Calendar")      # set title
    root.config(bg='#10161f')       # Set background color
    root.resizable(False, False)    # Disable the resize window
    root.attributes('-alpha', 0.98)  # Transparent 2% or 0.02%
    root.wm_iconbitmap('calendar_icon.ico')     # Set the icon

    # Create the calendar
    my_Calender = Calendar(root, setmode="day", get_pattern="dd/mm/yy", background="#10161f", foreground='white', font=("Bahnschrift Light", 20), headersbackground='#10161f', headersforeground='#FAF0BE', selectbackground='orange', selectforeground='white', normalbackground='#131823', normalforeground='Alice Blue', weekendbackground='#131823', weekendforeground='Alice Blue', othermonthbackground='#131823', othermonthwebackground='#131823', bordercolor='#222b32')
    my_Calender.place(x=0, y=10)

    # Create a button for showing the current time
    Button(root, text="Show Time", command=showTime, bg='#0e121a', fg="white", activebackground='#0e121a', activeforeground='white', bd=2, relief=RIDGE, font=("Aparajita", 15), cursor='hand2').place(x=245, y=10)

    # Set current date
    date = datetime.datetime.now().strftime("%A %d %B %Y")
    week = datetime.datetime.now().strftime("Week - %W")
    Label(root, text=date, fg='orange', bg='#10161f', font=("Georgia", 20)).pack(side=BOTTOM)
    Label(root, text=week, fg='gold', bg='#10161f', font=("Georgia", 15)).pack(side=BOTTOM)

    root.mainloop()
