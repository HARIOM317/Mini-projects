from tkinter import *
from tkinter import ttk

exp = " "
# For all keys
def press(num):
    global exp
    exp += str(num)
    key.set(exp)

# For clear key
def clear():
    global exp
    exp = " "
    key.set(exp)

# For enter key
def action():
    global exp
    exp = "Next Line : "
    key.set(exp)

root = Tk()
root.wm_iconbitmap('keyboard.ico')
root.title("keyboard")
root.geometry('1250x270+10+350')
root.maxsize(width=1250, height=270)
root.minsize(width=1250, height=270)
root.config(bg='#F0F8FF')

key = StringVar()
display = Entry(root, textvariable=key)
display.grid(rowspan=1, columnspan=100, ipadx=999, ipady=10)

# Create Buttons:
# _______________________ Line-1 __________________________
tild = ttk.Button(root, text='~', command= lambda  : press('~'))
tild.grid(row=1, column=0, ipadx=0, ipady=10)

num1 = ttk.Button(root, text='1', command= lambda  : press('1'))
num1.grid(row=1, column=1, ipadx=0, ipady=10)

num2 = ttk.Button(root, text='2', command= lambda  : press('2'))
num2.grid(row=1, column=2, ipadx=0, ipady=10)

num3 = ttk.Button(root, text='3', command= lambda  : press('3'))
num3.grid(row=1, column=3, ipadx=0, ipady=10)

num4 = ttk.Button(root, text='4', command= lambda  : press('4'))
num4.grid(row=1, column=4, ipadx=0, ipady=10)

num5 = ttk.Button(root, text='5', command= lambda  : press('5'))
num5.grid(row=1, column=5, ipadx=0, ipady=10)

num6 = ttk.Button(root, text='6', command= lambda  : press('6'))
num6.grid(row=1, column=6, ipadx=0, ipady=10)

num7 = ttk.Button(root, text='7', command= lambda  : press('7'))
num7.grid(row=1, column=7, ipadx=0, ipady=10)

num8 = ttk.Button(root, text='8', command= lambda  : press('8'))
num8.grid(row=1, column=8, ipadx=0, ipady=10)

num9 = ttk.Button(root, text='9', command= lambda  : press('9'))
num9.grid(row=1, column=9, ipadx=0, ipady=10)

num0 = ttk.Button(root, text='0', command= lambda  : press('0'))
num0.grid(row=1, column=10, ipadx=0, ipady=10)

minus = ttk.Button(root, text='-', command= lambda  : press('-'))
minus.grid(row=1, column=11, ipadx=0, ipady=10)

plus = ttk.Button(root, text='+', command= lambda  : press('+'))
plus.grid(row=1, column=12, ipadx=8, ipady=10)

clear = ttk.Button(root, text='Clear', command=clear)
clear.grid(row=1, column=13, ipadx=10, ipady=10)

# _______________________ Line-2 __________________________
tab = ttk.Button(root, text='tab', command= lambda  : press('    '))
tab.grid(row=2, column=0, ipadx=5, ipady=10)

q = ttk.Button(root, text='Q', command= lambda  : press('Q'))
q.grid(row=2, column=1, ipadx=0, ipady=10)

w = ttk.Button(root, text='W', command= lambda  : press('W'))
w.grid(row=2, column=2, ipadx=0, ipady=10)

e = ttk.Button(root, text='E', command= lambda  : press('E'))
e.grid(row=2, column=3, ipadx=0, ipady=10)

r = ttk.Button(root, text='R', command= lambda  : press('R'))
r.grid(row=2, column=4, ipadx=0, ipady=10)

t = ttk.Button(root, text='T', command= lambda  : press('T'))
t.grid(row=2, column=5, ipadx=0, ipady=10)

y = ttk.Button(root, text='Y', command= lambda  : press('Y'))
y.grid(row=2, column=6, ipadx=0, ipady=10)

u = ttk.Button(root, text='U', command= lambda  : press('U'))
u.grid(row=2, column=7, ipadx=0, ipady=10)

i = ttk.Button(root, text='I', command= lambda  : press('I'))
i.grid(row=2, column=8, ipadx=0, ipady=10)

o = ttk.Button(root, text='O', command= lambda  : press('O'))
o.grid(row=2, column=9, ipadx=0, ipady=10)

p = ttk.Button(root, text='P', command= lambda  : press('P'))
p.grid(row=2, column=10, ipadx=0, ipady=10)

open_Bracket = ttk.Button(root, text='[', command= lambda  : press('['))
open_Bracket.grid(row=2, column=11, ipadx=0, ipady=10)

close_bracket = ttk.Button(root, text=']', command= lambda  : press(']'))
close_bracket.grid(row=2, column=12, ipadx=0, ipady=10)

enter = ttk.Button(root, text='enter', command=action)
enter.grid(row=2, column=13, ipadx=10, ipady=10)

# _______________________ Line-3 __________________________
a = ttk.Button(root, text='A', command= lambda  : press('A'))
a.grid(row=3, column=0, ipadx=0, ipady=10)

s = ttk.Button(root, text='S', command= lambda  : press('S'))
s.grid(row=3, column=1, ipadx=0, ipady=10)

d = ttk.Button(root, text='D', command= lambda  : press('D'))
d.grid(row=3, column=2, ipadx=0, ipady=10)

f = ttk.Button(root, text='F', command= lambda  : press('F'))
f.grid(row=3, column=3, ipadx=0, ipady=10)

g = ttk.Button(root, text='G', command= lambda  : press('G'))
g.grid(row=3, column=4, ipadx=0, ipady=10)

h = ttk.Button(root, text='H', command= lambda  : press('H'))
h.grid(row=3, column=5, ipadx=0, ipady=10)

j = ttk.Button(root, text='J', command= lambda  : press('J'))
j.grid(row=3, column=6, ipadx=0, ipady=10)

k = ttk.Button(root, text='K', command= lambda  : press('K'))
k.grid(row=3, column=7, ipadx=0, ipady=10)

l = ttk.Button(root, text='L', command= lambda  : press('L'))
l.grid(row=3, column=8, ipadx=0, ipady=10)

colon = ttk.Button(root, text=':', command= lambda  : press(':'))
colon.grid(row=3, column=9, ipadx=0, ipady=10)

comma = ttk.Button(root, text=',', command= lambda  : press(','))
comma.grid(row=3, column=10, ipadx=0, ipady=10)

curlyBracket_open = ttk.Button(root, text='{', command= lambda  : press('{'))
curlyBracket_open.grid(row=3, column=11, ipadx=0, ipady=10)

culryBracket_close = ttk.Button(root, text='}', command= lambda  : press('}'))
culryBracket_close.grid(row=3, column=12, ipadx=0, ipady=10)

single_quot = ttk.Button(root, text="'", command= lambda  : press("'"))
single_quot.grid(row=3, column=13, ipadx=0, ipady=10)

# _______________________ Line-4 __________________________
z = ttk.Button(root, text='Z', command= lambda  : press('Z'))
z.grid(row=4, column=0, ipadx=0, ipady=10)

x = ttk.Button(root, text='X', command= lambda  : press('X'))
x.grid(row=4, column=1, ipadx=0, ipady=10)

c = ttk.Button(root, text='C', command= lambda  : press('C'))
c.grid(row=4, column=2, ipadx=0, ipady=10)

v = ttk.Button(root, text='V', command= lambda  : press('V'))
v.grid(row=4, column=3, ipadx=0, ipady=10)

b = ttk.Button(root, text='B', command= lambda  : press('B'))
b.grid(row=4, column=4, ipadx=0, ipady=10)

n = ttk.Button(root, text='N', command= lambda  : press('N'))
n.grid(row=4, column=5, ipadx=0, ipady=10)

m = ttk.Button(root, text='M', command= lambda  : press('M'))
m.grid(row=4, column=6, ipadx=0, ipady=10)

open_tag = ttk.Button(root, text='<', command= lambda  : press('<'))
open_tag.grid(row=4, column=7, ipadx=0, ipady=10)

close_tag = ttk.Button(root, text='>', command= lambda  : press('>'))
close_tag.grid(row=4, column=8, ipadx=0, ipady=10)

question_mark = ttk.Button(root, text='?', command= lambda  : press('?'))
question_mark.grid(row=4, column=9, ipadx=0, ipady=10)

back_slash = ttk.Button(root, text='\\', command= lambda  : press('\\'))
back_slash.grid(row=4, column=10, ipadx=0, ipady=10)

forward_slash = ttk.Button(root, text='/', command= lambda  : press('/'))
forward_slash.grid(row=4, column=11, ipadx=0, ipady=10)

dot = ttk.Button(root, text='.', command= lambda  : press('.'))
dot.grid(row=4, column=12, ipadx=0, ipady=10)

double_quot = ttk.Button(root, text='"', command= lambda  : press('"'))
double_quot.grid(row=4, column=13, ipadx=0, ipady=10)

# _______________________ Line-5 __________________________
space = ttk.Button(root, text='SPACE', command= lambda  : press(' '))
space.grid(row=5, column=0, ipadx=5, ipady=10)

NOT_SIGN = ttk.Button(root, text='!', command= lambda  : press('!'))
NOT_SIGN.grid(row=5, column=1, ipadx=0, ipady=10)

At_The_Rate = ttk.Button(root, text='@', command= lambda  : press('@'))
At_The_Rate.grid(row=5, column=2, ipadx=0, ipady=10)

Hase = ttk.Button(root, text='#', command= lambda  : press('#'))
Hase.grid(row=5, column=3, ipadx=0, ipady=10)

Doller = ttk.Button(root, text='$', command= lambda  : press('$'))
Doller.grid(row=5, column=4, ipadx=0, ipady=10)

percent = ttk.Button(root, text='%', command= lambda  : press('%'))
percent.grid(row=5, column=5, ipadx=0, ipady=10)

cap = ttk.Button(root, text='^', command= lambda  : press('^'))
cap.grid(row=5, column=6, ipadx=0, ipady=10)

and_sign = ttk.Button(root, text='&', command= lambda  : press('&'))
and_sign.grid(row=5, column=7, ipadx=0, ipady=10)

astric = ttk.Button(root, text='*', command= lambda  : press('*'))
astric.grid(row=5, column=8, ipadx=0, ipady=10)

openBracket = ttk.Button(root, text='(', command= lambda  : press('('))
openBracket.grid(row=5, column=9, ipadx=0, ipady=10)

closeBracket = ttk.Button(root, text=')', command= lambda  : press(')'))
closeBracket.grid(row=5, column=10, ipadx=0, ipady=10)

degree_celcius = ttk.Button(root, text='℃', command= lambda  : press('℃'))
degree_celcius.grid(row=5, column=11, ipadx=0, ipady=10)

Resisterd = ttk.Button(root, text='®', command= lambda  : press('®'))
Resisterd.grid(row=5, column=12, ipadx=0, ipady=10)

copyright_key = ttk.Button(root, text='©', command= lambda  : press('©'))
copyright_key.grid(row=5, column=13, ipadx=0, ipady=10)

root.mainloop()