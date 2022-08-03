from tkinter import *
from tkinter import messagebox
from tkinter.filedialog import askopenfilename, asksaveasfilename
import subprocess

root = Tk()
root.title("Python Code Editor")
root.geometry("1150x620+50+10")
root.config(bg="#323846")
root.resizable(False, False)

file_path = ""
def set_file_path(path):
    global file_path
    file_path = path

def open_file():
    try:
        path = askopenfilename(filetypes=[("Python File", "*.py"), ("All Files", "*.*")])
        with open(path, 'r') as f:
            code = f.read()
            code_input.delete('1.0', END)
            code_input.insert('1.0', code)
            set_file_path(path)
    except FileNotFoundError:
        messagebox.showerror("File", "File not found!")

def save_file():
    try:
        if file_path == "":
            path = asksaveasfilename(filetypes=[("Python File", "*.py"), ("All Files", "*.*")])
        else:
            path = file_path
        with open(path, 'w') as f:
            code = code_input.get('1.0', END)
            f.write(code)
            set_file_path(path)
    except FileNotFoundError:
        messagebox.showerror("File", "File not found!")

def run_file():
    if file_path == "":
        messagebox.showerror("Python Code Editor", "File Not saved")
        return
    try:
        command = f"Python {file_path}"
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
        output, error = process.communicate()
        code_output.insert('1.0', output)
        code_output.insert('1.0', error)
    except Exception as e:
        print(e)

# Set Icon
Image_Icon = PhotoImage(file="python_logo.png")
root.iconphoto(False, Image_Icon)

# Code Input
code_input = Text(root, font="Georgia 16")
code_input.place(x=180, y=0, width=650, height=660)

# Code Output
code_output = Text(root, font="Aparajita 18", fg="light green", bg="#2f4155")
code_output.place(x=830, y=50, width=320, height=660)

Label(root, text="Output", font=("Poor Richard", 25, "bold"), fg="yellow", bg="#323846").place(x=935, y=0)

# Buttons
Open = PhotoImage(file="open.png")
Save = PhotoImage(file="save.png")
Run = PhotoImage(file="run.png")

Button(root, image=Open, bg="#323846", bd=3, relief=GROOVE, activebackground="sky blue", command=open_file).place(x=30, y=30)
Button(root, image=Save, bg="#323846", bd=3, relief=GROOVE, activebackground="sky blue", command=save_file).place(x=30, y=165)
Button(root, image=Run, bg="#323846", bd=3, relief=GROOVE, activebackground="sky blue", command=run_file).place(x=30, y=300)

# Add the scrollbar
scrollbar = Scrollbar(code_input, cursor="arrow")
scrollbar.pack(side=RIGHT, fill=Y)
scrollbar.config(command=code_input.yview)
code_input.config(yscrollcommand=scrollbar.set)

# Add the scrollbar
scrollbar = Scrollbar(code_output, cursor="arrow")
scrollbar.pack(side=RIGHT, fill=Y)
scrollbar.config(command=code_output.yview)
code_output.config(yscrollcommand=scrollbar.set)

root.mainloop()
