import tkinter
from tkinter import *
import os
import sys
import time
import random
from functools import partial
from random import randint
import math
import mysql.connector

def start():
    startti=Tk()
    startti.title('pop up puzzle')
    startti.geometry('910x720+20+10')
    c=Canvas(startti, height=910,width=720,bg='black')
    kartantausta = c.create_rectangle(0,0,1000,400,width=4,fill='black')

    label=Label(c,height=720,width=910,bg='black')
    photo = PhotoImage(file='homesweethome.png')#kuva1

    c.pack()

    label.config(image=photo)
    label.pack()

    buttoni=Button(startti)
    photo2=PhotoImage(file="clickstart.png")#kuva2
    buttoni.config(image=photo2,width="250",height="90",activebackground="black",bg="black", bd=0,command=startti.quit)#,command=restart_program
    #, text='OAK: now is not the time to use that',width="50",height="50", command=oakki.quit
    startti.protocol('WM_DELETE_WINDOW', startti.quit)
    buttoni.pack()
    c.create_window(455,510, window=buttoni)
    startti.mainloop()
    startti.destroy()
start()
#----------EKANA FPS LISÄIKKUNAN KOODIA---------------------------------------------
#1
WIDTH = 1024
HEIGHT = 768
MOVSPEED = 0.2
ROTSPEED = 0.05

# Kääntyminen
TGM = (math.cos(ROTSPEED), math.sin(ROTSPEED))
ITGM = (math.cos(-ROTSPEED), math.sin(-ROTSPEED))
COS, SIN = 0, -1

# Aloitus koordinaatit
positionX = 4.0
positionY = 15.0
directionX = 1.0
directionY = 0.0
planeX = 0.0
planeY = .66 #tsekkaa tää
def game():
    #Kartta  Aloitus yläkulmassa, Peilikuvana???????
    m = [ [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2],
          [1,0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2],
          [1,0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2],
          [1,0,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,2],
          [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,0,0,2,2],
          [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,3,3,3,3,3,3,3,3,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,2,2,2,2,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,0,0,2,2,2,2,2,0,0,3,3,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,1],
          [1,0,0,0,0,3,2,2,2,2,0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,2,2,0,0,2,2,2],
          [1,0,0,0,0,3,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,2],
          [1,0,0,0,0,3,0,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,2],
          [1,0,0,0,0,3,0,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,2,0,0,0,0,0,2],
          [1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,1,1,1,2,2,2,2,2,2,2],]

    # Kentän koko


    #---------------------------------------------------------
    root = Tk()
    root.title("Good Ending")
    root.geometry('1024x768+20+10')

    canvas = Canvas(root, width=WIDTH, height=HEIGHT,bg='grey')#,bg='darkgrey'
    #sky = canvas.create_rectangle(0,0,100,100,fill='red')
    #label4 = Label(Canvas, text='', fg='black', bg='white')
    #label5 = Label(Canvas, text='', fg='black', bg='red')
    #canvas.create_window(120, 425, window=sky)

    canvas.pack()
    def leftKey(event):
        global directionX
        global directionY
        global planeX
        global planeY
        directionY = directionX * ITGM[SIN] + directionY * ITGM[COS]
        directionX = directionX * ITGM[COS] - directionY * ITGM[SIN]
        planeY = planeX * ITGM[SIN] + planeY * ITGM[COS]
        planeX = planeX * ITGM[COS] - planeY * ITGM[SIN]

    def rightKey(event):
        global directionX
        global directionY
        global planeX
        global planeY
        directionY = directionX * TGM[SIN] + directionY * TGM[COS]
        directionX = directionX * TGM[COS] - directionY * TGM[SIN]
        planeY = planeX * TGM[SIN] + planeY * TGM[COS]
        planeX = planeX * TGM[COS] - planeY * TGM[SIN]

    def upKey(event):
        global positionX
        global positionY
        if not m[int(positionX + directionX * MOVSPEED)][int(positionY)]:
            positionX += directionX * MOVSPEED
        if not m[int(positionX)][int(positionY + directionY * MOVSPEED)]:
            positionY += directionY * MOVSPEED

    def downKey(event):
        global positionX
        global positionY
        if not m[int(positionX - directionX * MOVSPEED)][int(positionY)]:
            positionX -= directionX * MOVSPEED
        if not m[int(positionX)][int(positionY - directionY * MOVSPEED)]:
            positionY -= directionY * MOVSPEED

    #Keybindaus--------------------------------------------------------
    root.bind('<Left>', leftKey)
    root.bind('<Right>', rightKey)
    root.bind('<Up>', upKey)
    root.bind('<Down>', downKey)
    
    root.bind('<a>', leftKey)
    root.bind('<d>', rightKey)
    root.bind('<w>', upKey)
    root.bind('<s>', downKey)

    while True:
        canvas.delete('all')
        canvas.create_rectangle(0,0,1024,384,fill='midnightblue')
        for x in range(WIDTH):
            mapX = int(positionX)
            mapY = int(positionY)
            
            cameraX = 2.0 * x / WIDTH - 1.0
            rayDirX = directionX + planeX * cameraX
            rayDirY = directionY + planeY * cameraX + .0000001 # 
            deltaDistX = math.sqrt(1.0 + (rayDirY * rayDirY) / ((rayDirX * rayDirX)))
            deltaDistY = math.sqrt(1.0 + (rayDirX * rayDirX) / ((rayDirY * rayDirY)))

            if rayDirX < 0:
                stepX = -1
                sideDistX = (positionX - mapX) * deltaDistX
            else:
                stepX = 1
                sideDistX = (mapX + 1.0 - positionX) * deltaDistX
            if rayDirY < 0:
                stepY = -1
                sideDistY = (positionY - mapY) * deltaDistY
            else:
                stepY = 1
                sideDistY = (mapY + 1.0 - positionY) * deltaDistY

            hit = False
            while not hit:
                if sideDistX < sideDistY:
                    sideDistX += deltaDistX
                    mapX += stepX
                    side = False
                else:
                    sideDistY += deltaDistY
                    mapY += stepY
                    side = True
                if m[mapX][mapY] > 0:
                    hit = True

            if not side:
                perpWallDist = abs((mapX - positionX + (1.0 - stepX) / 2.0) / rayDirX)
            else:
                perpWallDist = abs((mapY - positionY + (1.0 - stepY) / 2.0) / rayDirY)

            lineHeight = abs(int(HEIGHT / (perpWallDist + .0000001))) # avoid death by ZDE again

            drawStart = -lineHeight / 2.0 + HEIGHT / 2.0
            drawEnd = lineHeight / 2.0 + HEIGHT / 2.0
            if drawStart < 0:
                drawStart = 0
            if drawEnd >= HEIGHT:
                drawEnd = HEIGHT - 1

            # 
            wallcolors = [[], [45,45,45],[190, 201, 219],[250,250,250], [12, 52, 117]] #Lisää näitä värejää!!!
            color = wallcolors[m[mapX][mapY]]
            if side:
                for k, v in enumerate(color):
                    color[k] = int(v / 1.2)
            hex_color = '#%02x%02x%02x' % (color[0], color[1], color[2])
            
            
            canvas.create_line(x, drawStart, x, drawEnd, fill=hex_color)
        #-----------------------------------------------------------------
        root.update()

#------------FPS GAME LOPPUU-----------------------------------------------------------        
        
def menuPalkki():
    print('menuPalkki')
    c.create_window(400, 350, window=labeloak)
    c.create_window(400,425, window=buttoni)
def easter():
    print('easter')
    #start_game()
    menuPalkki()
         
def gameOver():
    #label4.config(text='GAME OVER')
    time.sleep(4)
    destroy()
    
def oak():
    oakki=Tk()
    oakki.title('pop up puzzle')
    oakki.geometry('200x300+20+10')
    c=Canvas(oakki, height=200,width=300,bg='black')
    label=Label(c,height=200,width=300,bg='white')
    photo = PhotoImage(file='oak.gif')#kuva3

    c.pack()

    label.config(image=photo)
    label.pack()

    buttoni=Button(oakki, text='OAK: now is not the time to use that',width="50",height="50", command=oakki.quit)
    oakki.protocol('WM_DELETE_WINDOW', oakki.quit)
    buttoni.pack()
    oakki.mainloop()
    oakki.destroy()

#2------------------HELP INFOTAULU--------------------------------------------------
def help():
    win = Toplevel()             
    Label(win,  text='To move, type:'+'\n'+'n or north'+'\n'+'s or south'+'\n'+'w or west'+'\n'+'e or east'+'\n'+'Other commands:'+'\n'+'inventory'+'\n'+'pick him up'+'\n'+'start car'+'\n'+'take key'+'\n'+'take jump starter'+'\n'+'pick up rock'
          +'\n'+'take key'+'\n'+'take cables'+'\n'+'start car'+'\n'+'').pack() 
    Button(win, text='OK', command=win.quit).pack()    
    win.protocol('WM_DELETE_WINDOW', win.quit)         
     
    win.focus_set()          
    win.grab_set()           
    win.mainloop()           
    win.destroy()
def destroy():
    db.rollback()
    root.destroy()
    
#3----------------------QUIT/EXIT----------------------------------------------------
def quit():
    win = Toplevel()             
    Label(win,  text='Do you really want to quit?').pack() 
    Button(win,bg='red', text='YES', command=destroy).pack()
    Button(win,bg='green', text='NO!', command=win.quit).pack() 
    win.protocol('WM_DELETE_WINDOW', win.quit)         
     
    win.focus_set()          
    win.grab_set()           
    win.mainloop()           
    win.destroy()
    
def enter(event):
    show()
    eBox.configure(state=NORMAL)
#--------------------------------------------------------


def ending_screen():
    ending=Button(c, bg='black',width="1000",height="1000")
    ending.pack()
    endlabel=Label(c,text='YOU WON', fg='blue', bg='black')
    endlabel.config(font=("times",50))
    endlabel.pack
    Button11=Button(c,bg='red', text='QUIT', command=destroy)
    Button21=Button(c,bg='green', text='RESTART!', command=restart_program)
    Button31=Button(c,bg='yellow', text='FPS BONUS', command=game)

    Button11.pack()
    Button21.pack()
    Button31.pack()
    
    c.create_window(450,400, window=Button11)
    c.create_window(450,430, window=Button21)
    c.create_window(450,460, window=Button31)
    c.create_window(450,300, window=endlabel)
    
def end_animationy(start_y, end_y, muutos):
    global auto
    global rengasEV 
    global rengasTV 
    global rengasTO 
    global rengasEO
    button5.configure(state=DISABLED)
    eBox.configure(state=DISABLED)
    c.move(rengasEV,0, 3000)
    c.move(rengasTV,0, 3000)
    c.move(rengasTO,0, 3000)
    c.move(rengasEO,0, 3000)
    c.move(oval,0, 3000)
    
    if end_y<0 or end_y>0:        
        while start_y > end_y or start_y< end_y:
            c.move(auto,0, muutos)
            
            c.update()
            # (20)
            c.after(20)
            start_y=start_y+muutos
            #print(start_y)
            
            #if start_y == end_y:

    #end_animationx(0,300,5)
    ending_screen()                
def end_animationx(start_x, end_x, muutos):
    global auto
    eBox.configure(state=DISABLED)
    button5.configure(state=DISABLED)
    button4.configure(state=DISABLED)
    button3.configure(state=DISABLED)
    button2.configure(state=DISABLED)
    button1.configure(state=DISABLED)
    if end_x<0 or end_x>0:
        while start_x > end_x or start_x < end_x:
            c.move(auto,muutos,0)
            # (20)
            c.update()
            c.after(20)
            start_x=start_x+muutos
    
#(aloitus koordinaatti 0, liikkeen +/-määrä, askellus(5 tai -5)
def car_animation(aloitus, lopetus, muutos):
    global auto
    global rengasEV 
    global rengasTV 
    global rengasTO 
    global rengasEO

    auto = c.create_rectangle(50,400,75,450,width=2,fill='blue')
    button5.configure(state=DISABLED)

    if lopetus<0 or lopetus>0:        
        while aloitus > lopetus or aloitus< lopetus:
            c.move(auto,0, muutos)

            c.update()
            #(40)
            c.after(60)
            aloitus=aloitus+muutos


    rengasEV = c.create_oval(45, 330, 50, 345, width=2, fill='darkgrey')
    rengasTV = c.create_oval(45, 370, 50, 355, width=2, fill='darkgrey')
    rengasTO = c.create_oval(75, 370, 80, 355, width=2, fill='darkgrey')
    rengasEO = c.create_oval(75, 330, 80, 345, width=2, fill='darkgrey')
    place=30


            #root.after_idle(moveup())

#-------------------------------------------------------
#global cheat if cheat=1 buttons 1-4 
def animationY(start_y, end_y, muutos):
    global cheat
    eBox.configure(state=DISABLED)
    button5.configure(state=DISABLED)
    button4.configure(state=DISABLED)
    button3.configure(state=DISABLED)
    button2.configure(state=DISABLED)
    button1.configure(state=DISABLED)


    if end_y<0 or end_y>0:        
        while start_y > end_y or start_y< end_y:
            c.move(oval,0, muutos)
            
            c.update()
            # (20)
            c.after(40)
            start_y=start_y+muutos
            #root.after_idle(moveup())
            
    button5.configure(state=NORMAL)
    eBox.configure(state=NORMAL)
    if cheat==1:
        button4.configure(state=NORMAL)
        button3.configure(state=NORMAL)
        button2.configure(state=NORMAL)
        button1.configure(state=NORMAL)




#---(aloitus koordinaatti 0, liikkeen määrä ja +-:lla suunta, askelkoko)-----

def animationX(start_x,end_x, muutos):
    eBox.configure(state=DISABLED)
    button5.configure(state=DISABLED)
    button4.configure(state=DISABLED)
    button3.configure(state=DISABLED)
    button2.configure(state=DISABLED)
    button1.configure(state=DISABLED)
    if end_x<0 or end_x>0:
        while start_x > end_x or start_x < end_x:
            c.move(oval,muutos,0)
            # (20)
            c.update()
            c.after(40)
            start_x=start_x+muutos
    button5.configure(state=NORMAL)
    eBox.configure(state=NORMAL)
    if cheat==1:
        button4.configure(state=NORMAL)
        button3.configure(state=NORMAL)
        button2.configure(state=NORMAL)
        button1.configure(state=NORMAL)
        #root.after_idle(moveup())

#-------------------------------------------------------
def turns():
    cur = db.cursor()
    turnsleft="SELECT player.TURNS_LEFT FROM player WHERE player.TURNS_LEFT>-1"
    cur.execute(turnsleft)
    res=cur.fetchall()
    for row in res:
        print('turns left',row[0])
    if row[0]!=0:
        turns = "UPDATE player SET player.TURNS_LEFT=player.TURNS_LEFT-1"
        cur.execute(turns)
    if row[0]==0:
        #label4.config(text='GAME OVER')
        #label3.config(text='GAME OVER')
        #gameOver()
        dead()

def moveup():
    global place
    global y
    global x
    cur = db.cursor()
    eBox.delete(0,END)
    
    location="SELECT player.ROOM_ID FROM player"
    cur.execute(location)
    res=cur.fetchall()
    for row in res:
        print(row[0])

        
    place=res[0][0]

    sql="SELECT access.ACCESSROOM_ID_2 FROM access,player WHERE player.ROOM_ID=access.ROOM_ID_1 AND access.DIRECTIONS='N'"
    cur.execute(sql)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    aaa=res[0][0]
    #print(aaa)
    turns()
    roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
    cur.execute(roomdesc)
    tulos=cur.fetchall()
    for row in tulos:
        print(row[0])

    kuvailu=tulos[0][0]
    #print(kuvailu)
    label3.config(text=kuvailu)

    huone="SELECT room.NAME FROM room WHERE room.ROOM_ID="+str(aaa)
    cur.execute(huone)
    huonenimi=cur.fetchall()
    for row in huonenimi:
        print(row[0])
    vastaus=huonenimi[0][0]
    label2.config(text=str(vastaus)+'\n'+'----------------')

    
    if place==1:
        animationY(0,-85,-5)
        animationX(0,0,-5)

    elif place==4:
        animationX(0,35,5)
        animationY(0,-80,-5)
        animationX(0,15,5)

    elif place==2:
        animationY(0,-150,-5)
        animationX(0,-20,-5)


    elif place==3:
        animationX(0,-15,-5)
        animationY(0,-80,-5)
        animationX(0,-35,-5)

    elif place==9:
        animationY(0,-120,-5)
        animationX(0,0,5)

    elif place==10:
        animationY(0,-120,-5)
        animationX(0,0,5)

    elif place==12:
        animationX(0,40,5)
        animationY(0,-50,-5)

    elif place==13:
        animationY(0,-105,-5)
        animationX(0,-0,-5)

    elif place==14:
        animationY(0,-75,-5)
        animationX(0,-60,-5)

    
    #print('place on up: ',aaa,'YLÖS')
    destination = "UPDATE player SET player.ROOM_ID="+str(aaa)
    cur.execute(destination)   
    
    return

#-------------------------------------------------------
def moveright():
    global place
    global x
    global y
    cur = db.cursor()
    eBox.delete(0,END)
    
    location="SELECT player.ROOM_ID FROM player"
    cur.execute(location)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    place=res[0][0]
    turns()
    sql="SELECT access.ACCESSROOM_ID_2 FROM access,player WHERE player.ROOM_ID=access.ROOM_ID_1 AND access.DIRECTIONS='E'"
    cur.execute(sql)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    aaa=res[0][0]
    #print(aaa)
    roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
    cur.execute(roomdesc)
    tulos=cur.fetchall()
    for row in tulos:
        print(row[0])

    kuvailu=tulos[0][0]
    #print(kuvailu)
    label3.config(text=kuvailu)


    huone="SELECT room.NAME FROM room WHERE room.ROOM_ID="+str(aaa)
    cur.execute(huone)
    huonenimi=cur.fetchall()
    for row in huonenimi:
        print(row[0])
    vastaus=huonenimi[0][0]
    label2.config(text=str(vastaus)+'\n'+'----------------')

    
    if place==1:
        animationX(0,480,5)
        animationY(0,-70,-5)


    elif place==8:
        animationY(0,40,5)
        animationX(0,225,5)

    elif place==3:
        animationX(0,80,5)
        animationY(0,65,5)
 
    elif place==7:
        animationY(0,0,5)
        animationX(0,150,5)

    elif place==6:
        animationX(0,80,5)
        animationY(0,5,5)
 
    elif place==9:
        animationY(0,0,5)
        animationX(0,150,5)

    elif place==15:
        animationY(0,-20,-5)
        animationX(0,200,5)

    elif place==11:
        animationY(0,20,5)
        animationX(0,125,5)


    #print('place on: ',aaa,'-aaas--s-s-s-s-s')
    destination = "UPDATE player SET player.ROOM_ID="+str(aaa)
    cur.execute(destination)   

    return

#-------------------------------------------------------
def movedown():
    global place
    global y
    global x
    global oval
    cur = db.cursor()
    eBox.delete(0,END)
    turns()
    location="SELECT player.ROOM_ID FROM player"
    cur.execute(location)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    place=res[0][0]

    sql="SELECT access.ACCESSROOM_ID_2 FROM access,player WHERE player.ROOM_ID=access.ROOM_ID_1 AND access.DIRECTIONS='S'"
    cur.execute(sql)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    aaa=res[0][0]
    #print(aaa)

    roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
    cur.execute(roomdesc)
    tulos=cur.fetchall()
    for row in tulos:
        print(row[0])

    kuvailu=tulos[0][0]
    #print(kuvailu)


    huone="SELECT room.NAME FROM room WHERE room.ROOM_ID="+str(aaa)
    cur.execute(huone)
    huonenimi=cur.fetchall()
    for row in huonenimi:
        print(row[0])
    vastaus=huonenimi[0][0]
    label2.config(text=str(vastaus)+'\n'+'----------------')


    
    if place==8:
        animationY(0,120,5)
        animationX(0,0,5)

    elif place==2:
        animationY(0,85,5)
        animationX(0,0,5)
        
    elif place==5:
        animationX(0,35,5)
        animationY(0,80,5)
        animationX(0,15,5)
 
    elif place==3:
        animationX(0,-15,-5)
        animationY(0,80,5)
        animationX(0,-35,-5)

    elif place==11:
        animationX(0,20,5)
        animationY(0,150,5)

    elif place==13:
        animationX(0,60,5)
        animationY(0,75,5)
  
    elif place==16:
        animationY(0,50,5)
        animationX(0,-40,-5)

    elif place==12:
        animationY(0,105,5)
        animationX(0,0,5)


    elif place==7:
        animationY(0,120,5)
        animationX(0,0,5)


    #print('place on: ',aaa,'-aaas--s-s-s-s-s')
    destination = "UPDATE player SET player.ROOM_ID="+str(aaa)
    cur.execute(destination)   
    label3.config(text=kuvailu)        

    return

#-------------------------------------------------------
def moveleft():
    global x
    global y
    global place
    cur = db.cursor()
    eBox.delete(0,END)
    turns()
    location="SELECT player.ROOM_ID FROM player"
    cur.execute(location)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    place=res[0][0]

    sql="SELECT access.ACCESSROOM_ID_2 FROM access,player WHERE player.ROOM_ID=access.ROOM_ID_1 AND access.DIRECTIONS='W'"
    cur.execute(sql)
    res=cur.fetchall()
    for row in res:
        print(row[0]) 
    aaa=res[0][0]
    #print(aaa)
        
    roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
    cur.execute(roomdesc)
    tulos=cur.fetchall()
    for row in tulos:
        print(row[0])

    kuvailu=tulos[0][0]
    #print(kuvailu)
    label3.config(text=kuvailu)

    huone="SELECT room.NAME FROM room WHERE room.ROOM_ID="+str(aaa)
    cur.execute(huone)
    huonenimi=cur.fetchall()
    for row in huonenimi:
        print(row[0])
    vastaus=huonenimi[0][0]
    label2.config(text=str(vastaus)+'\n'+'----------------')

    
    if place==13:
        animationY(0,70,5)
        animationX(0,-480,-5)

    elif place==12:
        animationX(0,-225,-5)
        animationY(0,-40,-5)

    elif place==8:
        animationY(0,0,5)
        animationX(0,-150,-5)

    elif place==2:
        animationY(0,-65,-5)
        animationX(0,-80,-5)

    elif place==3:
        animationY(0,-5,-5)
        animationX(0,-80,-5)
   
    elif place==10:
        animationY(0,0,5)
        animationX(0,-150,-5)

    elif place==1:
        animationX(0,-200,-5)
        animationY(0,20,5)

    elif place==7:
        animationX(0,-125,-5)
        animationY(0,-20,-5)
    
    

    #print('place on: ',aaa,'-aaas--s-s-s-s-s')
    destination = "UPDATE player SET player.ROOM_ID="+str(aaa)
    cur.execute(destination)   

    return

#-------------------------------------------------------
def show():
    global place
    global komennot
    global inventory
    global items
    global cheat
    global palau
    global kivipois
    global room1
    global room2
    global room3
    global room4
    global room5
    global room6
    global room7
    global room8
    global room9
    global room10
    global room11
    global room12
    global room13
    global room14
    global room15
    global room16
    global visit1
    global abcd
    cur = db.cursor()

    lower=eBox.get()
    lower=lower.lower()

    itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
    cur.execute(itemcheck)
    item=cur.fetchall()
    for row in item:
         print(row[0])
    resultitem=item[0][0]
    #print('alkutilanne',resultitem)


    if lower == 'exit' or lower == 'quit':
        quit()
    if lower == '1337' or lower == 'cheatcode':
        button4.configure(state=NORMAL)
        button3.configure(state=NORMAL)
        button2.configure(state=NORMAL)
        button1.configure(state=NORMAL)
        cheat = 1
        
    if lower == 'help' or lower == 'HELP':
            help()
    if lower == 'inventory'or lower == 'i':
            label2.config(text='Items in your inventory:'+"\n"
                          + str(inventory))

     

    if lower in komennot and place==1: #starting position
        if lower == 'north' or lower == 'n' or lower == 'go north':
            moveup()
            place=2
        elif lower == 'east' or lower == 'e' or lower == 'go east':
            moveright()
            place=13
        elif lower == 'west' or lower == 'w' or lower == 'go west':
            moveleft()
            place=15
        else:
            print(' ')


# place=2
    elif lower in komennot and place==2:
        if lower == 'north' or lower == 'n' or lower == 'go north':
            moveup()
            place=11
        elif lower == 'west' or lower == 'w' or lower == 'go west':
            moveleft()
            place=3
        elif lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=1
        else:
            print(' ')
            
    elif place==9:#playroom/child's location
        if room9!=2:
            if lower == 'north' or lower == 'n':
                moveup()
                place=7
            elif lower == 'east' or lower == 'e':
                moveright()
                place=10
            else:
                print(' ')
        elif room9==2:
            label4.config(text="I need to pick him up")
            if lower == 'take child' or lower == 'take son' or lower == 'pick child'or lower == 'pick up child' or lower =='pick him up':#-------------------------------------
                itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
                cur.execute(itemcheck)
                item=cur.fetchall()
                for row in item:
                     print(row[0])
                resultitem=item[0][0]
                print('onko lapsi = 1 ,,',resultitem)
                if resultitem==1:
                    inventory.append('child')
                    print(inventory,'<- inventoryssä')
                    nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 9"
                    cur.execute(nostettu)
                desc = "UPDATE room SET room.DESCRIPTION='The play room' WHERE room.ROOM_ID=9"
                cur.execute(desc)
                roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
                cur.execute(roomdesc)
                tulos=cur.fetchall()
                for row in tulos:
                    print(row[0])
                kuvailu=tulos[0][0]
                label3.config(text=kuvailu)
                room9=3
            

    elif place==10:#bedroom
        if lower == 'north' or lower == 'n' or lower == 'go north':
            moveup()
            place=8
        elif lower == 'west' or lower == 'w' or lower == 'w' or lower == 'w':
            moveleft()
            place=9
        else:
            print(' ')

    elif place==7:#living room
        if lower == 'east' or lower == 'e' or lower == 'go east':
            moveright()
            place=8
        elif lower == 'west' or lower == 'w' or lower == 'go west':
            moveleft()
            place=11
        elif lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=9
        else:
            print(' ')

    elif place==11:#kitchen
        if lower == 'east' or lower == 'e' or lower == 'go east':
            moveright()
            place=7
        elif lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=2
        elif lower == 'take knife' or lower == 'take knives' or lower == 'pick knife'or lower == 'pick up knife':#-------------------------------------
            itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
            cur.execute(itemcheck)
            item=cur.fetchall()
            for row in item:
                 print(row[0])
            resultitem=item[0][0]
            print('onko veitsi = 7 ,,',resultitem)
            if resultitem==7:
                inventory.append('knife')
                #print('se on seitsemän')
                nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 11"
                cur.execute(nostettu)  
            else:
                print(' ')
        else:
            print(' ')

    elif place==5: #appliance room
        if lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=3
        elif room5==3:
            if lower == 'take key' or lower == 'take shed key' or lower == 'take the key' or lower == 'take the shed key':
                itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
                cur.execute(itemcheck)
                item=cur.fetchall()
                for row in item:
                     print(row[0])
                resultitem=item[0][0]
                #print('Itemi ',resultitem)
                if resultitem==2:
                    inventory.append('shed key')
                    label4.config(text="No time to lose. Got to get that shed open.")
                    room13=5
                    room3=4
                    room5=4
                    room1=4
                    room6=3
                    room7=5
                    room12=9
                    nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 5"
                    cur.execute(nostettu)
                


    elif place==6:#WC
        if lower == 'east' or lower == 'e' or lower == 'go east':
            moveright()
            place=3
        elif lower == 'take bandages':
            itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)#-------------------------------------
            cur.execute(itemcheck)
            item=cur.fetchall()
            for row in item:
                 print(row[0])
            resultitem=item[0][0]
            #print('ddddd',resultitem)
            if resultitem==6:
                inventory.append('bandages')
                #print('se on kuusi')
                nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 6"
                cur.execute(nostettu)  
            else:
                print(' ')
        else:
            print(' ')

    elif place==4:#bedroomSW
        if lower == 'north' or lower == 'n' or lower == 'go north':
            moveup()
            place=3
        else:
            print(' ')

    elif place==13:#yard
        if lower == 'south' or lower == 's' or lower == 'go south':
            sql="SELECT access.ACCESSROOM_ID_2 FROM access,player WHERE player.ROOM_ID=access.ROOM_ID_1 AND access.DIRECTIONS='S'"
            cur.execute(sql)
            res=cur.fetchall()
            for row in res:
                print(row[0]) 
            aaa=res[0][0]
            #print(aaa)
            iflocked2="SELECT access.LOCKED FROM access WHERE access.ROOM_ID_1="+str(place)+" AND access.ACCESSROOM_ID_2="+str(aaa)
            cur.execute(iflocked2)
            lock2=cur.fetchall()
            for AA in lock2:
                 print(AA[0])
            reslock2=lock2[0][0]
            #print('onko lukossa??',reslock2)
            
            itemcheck2="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID=5"
            cur.execute(itemcheck2)
            item2=cur.fetchall()
            for row in item2:
                 print(row[0])
            resultitem2=item2[0][0]
            #print('mikä itemi-----',resultitem2)
            
            if reslock2!=1 or resultitem2!=2:
                ovi3 =c.create_line(780,275,805,275, width=3,fill='white')
                movedown()
                place=14
            elif resultitem2==2:
                label4.config(text='The shed is locked. Have to find the key.')
                room13=4
            if room14==0:
                room14=3

        elif lower == 'north' or lower == 'n' or lower == 'go north':
            moveup()
            place=12
        elif lower == 'west' or lower == 'w' or lower == 'go west':
            moveleft()
            place=1
        elif lower == 'swing':
            menuPalkki()
        
                
        else:
            print(' ')



    elif place==16:#hen house
        room7=7
        if lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=12
        elif lower == 'take cables' or lower == 'take the cables' or lower == 'pick cables'or lower == 'pick up cables':
            itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
            cur.execute(itemcheck)
            item=cur.fetchall()
            for row in item:
                 print(row[0])
            resultitem=item[0][0]
            #print('onko kaapelit = 5 ,,',resultitem)
            if resultitem==5:
                inventory.append('cables')
                label4.config(text="Now I just need to jump start the car and we will be out of here!")
                room15=5
                room2=5
                ####################
                room1=6
                room2=5
                room3=4
                room4=3
                room5=6
                room6=3
                room7=7
                room8=4
                room9=4
                room10=3
                room11=3
                room12=9
                room13=6
                room14=4
                #room15=5
                #room15=2
                room16=3
                desc = "UPDATE room SET room.DESCRIPTION='The hen house' WHERE room.ROOM_ID=16"
                cur.execute(desc)
                roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
                cur.execute(roomdesc)
                tulos=cur.fetchall()
                for row in tulos:
                    print(row[0])
                kuvailu=tulos[0][0]
                label3.config(text=kuvailu)

                
                nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 16"
                cur.execute(nostettu)  
            else:
                print(' ')
        else:
            print(' ')

    elif place==14:#shed
        #label4.config(text="Oh there's the jump starting kit!")
        
        if room14!=2:
            if lower == 'north' or lower == 'n' or lower == 'go north':
                moveup()
                place=13
        
            
        elif lower == 'take jump starter kit' or lower == 'take jumpstarter' or lower == 'take jump starter'or lower == 'take jump starting kit':
            itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
            cur.execute(itemcheck)
            item=cur.fetchall()
            for row in item:
                 print(row[0])
            resultitem=item[0][0]
            if resultitem==3:
                inventory.append('jump starter')
                label4.config(text="Oh for the love of ... the cables are gone!"+'\n'+"They are probably in the hen house. It might be locked too.")
                nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 14"
                cur.execute(nostettu)
                room13=6
                room7=6
                room12=4
                ################################
                room1=5
                room2=4
                #room3=2
                #room4=2
                room5=5
                room6=3
                room8=4
                room9=4
                room10=3
                room11=3
                room13=6
                room14=4
                desc = "UPDATE room SET room.DESCRIPTION='A messy shed' WHERE room.ROOM_ID=14"
                cur.execute(desc)
                roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
                cur.execute(roomdesc)
                tulos=cur.fetchall()
                for row in tulos:
                    print(row[0])
                kuvailu=tulos[0][0]
                label3.config(text=kuvailu)

            else:
                print(' ')
        itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
        cur.execute(itemcheck)
        item=cur.fetchall()
        for row in item:
             print(row[0])
        resultitem=item[0][0]
        if resultitem!=3:
            room14=3
        else:
            print(' ')

    elif place==15:#auto
        if room15!=0 and room15!=5:
            if lower == 'east' or lower == 'e' or lower == 'go east':
                moveright()
                place=1
            elif lower == 'drop child' or lower == 'drop mark' or lower == 'sit':
                label4.config(text='Sit there.')
            else:
                print(' ')
        elif room15==0:
            label4.config(text="I need to start the car")
            if lower == 'start' or lower == 'start car' or lower == 'drive'or lower == 'start the car'or lower == 'start engine':
                label4.config(text="Start damn you! START!!!"+'\n'+"Damn it! The battery has run dry." +'\n'+"I think Steve had a jump starting kit in the shed.")
                room1=3
                room15=4
        elif room15==5:
            label4.config(text="I need to jump start the car")
            if lower == 'start' or lower == 'start car' or lower == 'jump start'or lower == 'start the car'or lower == 'jump start the car':
                label4.config(text="YES! We made it"+'\n'+"Don't worry you'll be fine soon")
                end_animationy(0,580,5)
        elif room15==3:
            label4.config(text="I need to get find the jump starter")
            
        
            

    elif place==12:#piha/olohuoneen edusta
        if lower == 'north' or lower == 'n'  or lower == 'go north':
            sql="SELECT access.ACCESSROOM_ID_2 FROM access,player WHERE player.ROOM_ID=access.ROOM_ID_1 AND access.DIRECTIONS='N'"
            cur.execute(sql)
            res=cur.fetchall()
            for row in res:
                print(row[0]) 
            aaa=res[0][0]
            #print(aaa)
            iflocked="SELECT access.LOCKED FROM access WHERE access.ROOM_ID_1="+str(place)+" AND access.ACCESSROOM_ID_2="+str(aaa)
            cur.execute(iflocked)
            lock=cur.fetchall()
            for AA in lock:
                 print(AA[0])
            reslock=lock[0][0]
            print('onko lukossa??',reslock)
            itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
            cur.execute(itemcheck)
            item=cur.fetchall()
            for row in item:
                 print(row[0])
            resultitem=item[0][0]
            #print('hen house key onko nullll',resultitem)
            if reslock!=1 or resultitem!=4:
                ovi4 =c.create_line(765,125,790,125, width=3,fill='white')
                moveup()
                place=16
                
        elif lower == 'west' or lower == 'w' or lower == 'go west':
            moveleft()
            place=8
        elif lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=13
        
        if lower == 'take stone' or lower == 'pick stone' or lower == 'pick up stone'or lower == 'move stone' or lower == 'move rock' or lower == 'pick up rock' or lower == 'take rock' or lower == 'pick rock':
            if kivipois!=1 and room13>=3:
                kivipois=1
                room12==6
                desc = "UPDATE room SET room.DESCRIPTION='Part of the yard' WHERE room.ROOM_ID=12"
                cur.execute(desc)
                roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
                cur.execute(roomdesc)
                tulos=cur.fetchall()
                for row in tulos:
                    print(row[0])
                kuvailu=tulos[0][0]
                label3.config(text=kuvailu)
                
            elif kivipois==1:
                label4.config(text='I already took the rock...')
            else:
                label4.config(text='No point picking it up now..')
        
        elif kivipois==1 and lower == 'take key' or lower == 'pick key' or lower == 'take the key'or lower == 'pick up key':
            itemcheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID="+str(place)
            cur.execute(itemcheck)
            item=cur.fetchall()
            for row in item:
                 print(row[0])
            resultitem=item[0][0]
            #print('hen house key = 4',resultitem)
            if resultitem==4:
                label4.config(text='I got the hen house key'+'\n'+"Finally! Time to open that hen house.")
                inventory.append('hen house key')
                #label4.config(text="Finally! Time to open that hen house.")
                nostettu = "UPDATE room SET room.OBJECT_ID= NULL WHERE room.ROOM_ID = 12"##########################################################################
                cur.execute(nostettu)
            else:
                print(' ')
        else:
            print(' ')

    elif place==3:#hallway w
        if lower == 'north' or lower == 'n' or lower == 'go north':
            moveup()
            place=5
        elif lower == 'west' or lower == 'w'  or lower == 'go west':
            moveleft()
            place=6
        elif lower == 'south' or lower == 's' or lower == 'go South':
            movedown()
            place=4
        elif lower == 'east' or lower == 'e' or lower == 'go east':
            moveright()
            place=2
        else:
            print(' ')
            
    elif place==8:#living room e
        if lower == 'west' or lower == 'w' or lower == 'go west':
            moveleft()
            place=7
        elif lower == 'south' or lower == 's' or lower == 'go south':
            movedown()
            place=10
        elif lower == 'east' or lower == 'e' or lower == 'go east':
            moveright()
            place=12
        else:
            print(' ')
#-----        
    eBox.delete(0,END)
    roomdesc="SELECT room.DESCRIPTION FROM room WHERE room.ROOM_ID="+str(place)
    cur.execute(roomdesc)
    tulos=cur.fetchall()
    for row in tulos:
        print(row[0])
    kuvailu=tulos[0][0]
    label3.config(text=kuvailu)
#---------------------Before child discovery---------------------------------
    lapsicheck="SELECT room.OBJECT_ID FROM room WHERE room.ROOM_ID=9"
    cur.execute(lapsicheck)
    lapsi=cur.fetchall()
    for row in lapsi:
         print(row[0])
    lapsiresult=lapsi[0][0]
    
    if place==1:
        if room1==1:
            label4.config(text='Home sweet home')
            #room1=0
        elif room1==2:
            label4.config(text="Come on honey! You will be just fine.")
            room1=0
        elif room1==3:
            label4.config(text="I need to find the jump starter")
            room15=3
        elif room1==4:
            label4.config(text="I can now open the shed")

        elif room1==5:
            label4.config(text="I need to pick the cables"+'\n'+"for the jump starter")

        elif room1==6:
            label4.config(text="Almost there...")

            
    elif place==2:
        if room2==1:
            label4.config(text='All seems good here. Awfully quiet tho.')
            room2=0
        elif room2==2:
            label4.config(text="I need to take you to the hospital")
        elif room2==3:
            label4.config(text="The shed, I need to go there")
        elif room2==4:
            label4.config(text="The hen house key is hidden somewhere")#pois avaimen jälkeen
        elif room2==5:
            label4.config(text="Time is running out")
    elif place==3:
        if room3==1:
            label4.config(text='So quiet in here')
            #room3=0
        elif room3==2:
            label4.config(text="Come on honey! You will be just fine.")
        elif room3==3:
            label4.config(text="The shed key shoud be near.")
        elif room3==4:
            label4.config(text="Got to go fast")
    elif place==4:
        if room4==1:
            label4.config(text="I guess Tony is out with his friends."+'\n'+ "I wish he'd inform me of his whereabouts more often.")
            room4=0
        elif room4==0:
            label4.config(text="He needs to clean this room")
        elif room4==3:
            label4.config(text="Nothing interesting here")
        elif room4==2:
            label4.config(text="What am I doing? I need to take you to the car")
    elif place==5:
        if room5==1:
            label4.config(text='I should clean up in here. '+'\n'+'Should place all these keys in their right place.'+'\n'+' Got some laundry to do too.')
            room5=0
        elif room5==0:
            label4.config(text="too many keys")
        elif room5==2:
            label4.config(text="What am I doing? I need to take you to the car")
        elif room5==3:
            label4.config(text="The shed key!, I need to take it")
        elif room5==4:
            label4.config(text="Got the key!"+'\n'+"The other keys here are useless")
        elif room5==5:
            label4.config(text="No hen house key here")
        elif room5==6:
            label4.config(text="I need to hurry up")#hh

    elif place==6:
        if room6==1:
            label4.config(text='Steve sure bought alot of medical supplies.'+'\n'+'Will last for some time.')
            room6=0
            visit1=0
        elif room6==2:
            if visit1==1:
                label4.config(text="Now is not the time for bathroom break")

                #label4.config(text="Ah bandages! Good thing I bought some last week!")
            elif visit1==0:
                label4.config(text="Now is not the time for bathroom break")

                #label4.config(text="Here we go! I need to take the Bandages!")#-------------------------
            room6=3
        elif room6==3:
            label4.config(text="Now is not the time for bathroom break")
        elif room6==4:
            label4.config(text="No keys here")
        
                
    elif place==7:
        if room7==1:
            label4.config(text='I guess Mark is sleeping,'+'\n'+' I should still check up on him.')
            room7=0
        elif room7==2:
            label4.config(text="Come on honey! You will be just fine.")
        elif room7==3:
            label4.config(text="No jump starter here")
        elif room7==4:
            label4.config(text="No keys here...")
        elif room7==5:
            label4.config(text="The crazy vegan must be near...")
        elif room7==6:
            label4.config(text="The hen house key might be outside..")
        elif room7==7:
            label4.config(text="I need to hurry up..")
            
            
            

            
    elif place==8:
        if room8==1:
            label4.config(text='Our latest family portrait was a success!'+'\n'+'Even Tony showed up.')
            room8=0
        elif room8==2:
            label4.config(text="Come on honey! You will be just fine.")
        elif room8==3:
            label4.config(text="The jump starter should be in the shed")
        elif room8==4:
            label4.config(text="Got to go fast")
    elif place==9:
        if room9==1:
            room1=2
            room2=2
            room3=2
            room4=2
            room5=2
            room6=2
            room7=2
            room8=2
            room9=2
            room10=2
            room11=2
            room12=2
            room13=2
            room14=2
            room15=2
            room16=2
            label4.config(text="Dear Lord! Mark?! MARK!?!"+'\n'+"What happened to you?! Don't worry! Mommy is right here!"+'\n'+"I'll pick you up and drive to hospital")
        elif room9==3:
            label4.config(text="I'll take you to the car")
        elif room9==4:
            label4.config(text="My poor baby...")

    elif place==10:
        if room10==1:
            label4.config(text="Didn't have time to make the bed this morning."+'\n'+"Mark really must be sleeping tighly.")
            room10=0
        elif room10==0:
            label4.config(text="Mark should be in the next room")
        elif room10==2:
            label4.config(text="Come on honey! You will be just fine.")
        elif room10==3:
            label4.config(text="Nothing interesting here")
    elif place==11:
        if room11==1:
            label4.config(text='Oh Steve remembered to buy a new set of knives!')
            room11=0
        elif room11==0:
            label4.config(text="I should ask if Mark is hungry")
        elif room11==2:
            label4.config(text="Come on honey! You will be just fine.")
        elif room11==3:
            label4.config(text="Nothing interesting here")
            
    elif place==12:
        if room12==1:
            label4.config(text='That rock looks wierd')
            room12=0
            if lower == 'take stone' or lower == 'pick stone' or lower == 'pick up stone'or lower == 'move stone' or lower == 'move rock' or lower == 'pick up rock' or lower == 'take rock' or lower == 'pick rock':
                label4.config(text='No point picking it now..')
        elif room12==0:
            label4.config(text="Hope the chickens are fine")
            if lower == 'take stone' or lower == 'pick stone' or lower == 'pick up stone'or lower == 'move stone' or lower == 'move rock' or lower == 'pick up rock' or lower == 'take rock' or lower == 'pick rock':
                label4.config(text='No point picking it now..')
        elif room12==2:
            label4.config(text="Come on honey! You will be just fine.")
            if lower == 'take stone' or lower == 'pick stone' or lower == 'pick up stone'or lower == 'move stone' or lower == 'move rock' or lower == 'pick up rock' or lower == 'take rock' or lower == 'pick rock':
                label4.config(text='No point picking it now..')
        elif room12==3:
            label4.config(text="I think the shed key is in the applience room")
            if lower == 'take stone' or lower == 'pick stone' or lower == 'pick up stone'or lower == 'move stone' or lower == 'move rock' or lower == 'pick up rock' or lower == 'take rock' or lower == 'pick rock':
                label4.config(text='No point picking it now..')
        elif room12==4:
            label4.config(text="The hen house is locked"+'\n'+"Hmm... That rock looks out of place.")
            room12=5
        
        elif room12==5:
            if abcd==0:
                label4.config(text="I should pick up that rock")
            elif abcd==1:
                label4.config(text='The key, there it is')
            if lower == 'take stone' or lower == 'pick stone' or lower == 'pick up stone'or lower == 'move stone' or lower == 'move rock' or lower == 'pick up rock' or lower == 'take rock' or lower == 'pick rock':
                label4.config(text='The key, there it is')
                abcd=1
            elif lower == 'take key' or lower == 'pick key' or lower == 'pick up key':
                label4.config(text='Got it!')
                room12=7
        elif room12==6:
            label4.config(text="The key, there it is")
            room12=7
        elif room12==7:
            label4.config(text="The jump starter cables"+'\n'+" are in the hen house")
        elif room12==8:
            label4.config(text="Got to go fast")
        elif room12==9:
            label4.config(text="Oh I hope the jump starter will work")


                          
    elif place==13:
        if room13==1:
            label4.config(text='Oh the swingset! Mark sure loves to swing.')
            room13=0
        elif room13==2:
            label4.config(text='I need to take him to the car')
        elif room13==3:
            label4.config(text='I think the jump starter is in the shed')
            room6=4
            room8=4
        elif room13==4:
            label4.config(text='The shed is locked. Have to find the key.')
            if room6==3:
                room6=4
                room7=4
                room8=4
        elif room13==5:
            label4.config(text='Finally I can go in')
        elif room13==6:
            label4.config(text='No time to waste')
    elif place==14:#################
        if room14==1:
            label4.config(text='The jump starter!'+'\n'+'With that I can start the car')#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
            room14=0
        elif room14==2:
            label4.config(text="The jump starter is there"+'\n'+"But oh no! It's missing cables..")
        elif room14==3:
            label4.config(text="Now I need to get the cables")
        elif room14==4:
            label4.config(text="Time is running out")
    elif place==15:
        if room15==1:
            label4.config(text="Nothing here")####
            room15=1
            #end_animationy(0,580,5)
            #end_animationx(300,0,5)
        elif room15==2:
            label4.config(text="Sit there I'll start the car")####MURDERER WHEN???
            inventory.remove('child')
            room15=0
            room2=3
            room13=3
            room5=3
            room3=3
            room4=3
            room6=3
            room7=3
            room8=3
            room9=4
            room10=3
            room11=3
            room12=3
        elif room15==5:
            label4.config(text="Now I just need to jump start the car and we will be out of here!")
            #end_animationy(0,580,5)
            #ending_screen()
        elif room15==4:
            room15=3
    elif place==16:
        if room16==1:
            label4.config(text="Looks like the chicken are fine."+'\n'+" Oh! the cables are hanging on the wall!")
            room16=2
        elif room16==2:
            label4.config(text="The cables are hanging on the wall!")
            
        elif room16==3:
            label4.config(text="Now I just need to jump start the car and we will be out of here!")
            room15=5
#---------------------After child discovery---------------------------------
def restart_program():
    python = sys.executable
    os.execl(python, python, * sys.argv)
#os.execl(sys.executable, sys.executable, *sys.argv)
#-------------------------------------------------------
def keyup(e):
    print('up', e.char)
    if (e.char)== '§':
        print('painoit enteriä')
        puzzle=Tk()
        puzzle.title('pop up puzzle')
        puzzle.geometry('300x300+20+10')
        puzcan = Canvas(puzzle, height=300, width=300, bg='purple')
        kartantausta = puzcan.create_rectangle(0,0,100,100,width=4,fill='black')
        puzcan.pack()

        puzzle.mainloop()
    elif (e.char)== '':
        command=show()

def keydown(e):
    print('down',e.char)

def kk():
    c.create_window(1400, 350, window=labeloak)
    c.create_window(1400,425, window=buttoni)


    
# Open DB connection--------------------------------------------
db = mysql.connector.connect(host="localhost",
                      user="dbuser10",
                      passwd="dbpass",
                      db="r10",
                      buffered=True)
#-----------------------------------------------------------
kivipois=0
abcd=0
room1=1
room2=1
room3=1
room4=1
room5=1
room6=1
room7=1
room8=1
room9=1
room10=1
room11=1
room12=1
room13=1
room14=1
room15=1
room16=1
visit1=1
#-------------------------------------
cheat=0
root=Tk()
root.title('Home Sweet Home')
#------------tiedosto menu----------------------------------
menupalkki = Menu(root)
root.config(menu=menupalkki)
subMenu = Menu(menupalkki)
subHelp = Menu(menupalkki)
editMenu = Menu(menupalkki)
#-----------------------------------------------------------
menupalkki.add_cascade(label='File',menu=subMenu)
#subMenu.add_command(label='FPS Map')#, command=game
#subMenu.add_command(label='Numerot', command=easter)
#subMenu.add_separator()
subMenu.add_command(label='Restart', command=restart_program)
subMenu.add_separator()
subMenu.add_command(label='Exit', command=quit)
#----------------------------------------------------------
menupalkki.add_cascade(label='Help',menu=subHelp)
subHelp.add_command(label='Help', command=help)
#-----------------------------------------------------------
#menupalkki.add_cascade(label='3 Squares',menu=editMenu)
#editMenu.add_command(label='Puzzle', command=keyPuzzle)
#-----------------------------------------------------------


# 910 x 720 on ikkunan koko x*y
# 20+10 on ikkunan aloitus koordinaatti näytön vesammasta yläkulmasta x+y
root.geometry('910x720+20+10')


#y,x
# 'canvas' = paneeli ikkunan sisään johon voidaan liittää asioita 
c = Canvas(root, height=720, width=910, bg='darkgrey')

# piirtäminen viivoilla ja neliöillä aloitus x,y lopetus x,y,
kartantausta = c.create_rectangle(0,0,1000,400,width=4,fill='black')
piha = c.create_rectangle(10,10,900,375,width=3,fill='darkgreen')
kanala = c.create_rectangle(700,50,850,125,width=3,fill='darkgrey')
varasto = c.create_rectangle(750,350,850,275,width=3,fill='darkgrey')
talonpohja = c.create_rectangle(50,50,600,300,width=3,fill='white')
road = c.create_rectangle(50,300,115,400,width=0,fill='lightgrey')
road2 = c.create_rectangle(100,345,300,300,width=0,fill='lightgrey')
gravell = c.create_rectangle(300,300,750,345,width=0,fill='moccasin')
gravel2 = c.create_rectangle(750,345,700,125,width=0,fill='moccasin')
gravel3 = c.create_rectangle(750,125,850,275,width=0,fill='moccasin')
gravel4 = c.create_rectangle(700,125,600,175,width=0,fill='moccasin')
gravel5 = c.create_rectangle(600,125,675,80,width=0,fill='moccasin')

#-------------------------------------------------------
frame=Frame(root)
frame.bind("<KeyPress>", keydown)
frame.bind("<KeyRelease>", keyup)
frame.pack()
frame.focus_set()
c.pack()
starting=77

#----DIALOGIA-JA-KOMENTOJA---
teksti1=str('Home sweet home')
teksti2=str("If you need help, type 'help' or click the 'Help' button on top"+
               '\n'+   '----------------------------------------------------------------')
teksti3=str('© Jari Pietikäinen, Eero Takaneva, Valtteri Rauhala')
teksti4=str('YOU DIED')

komennot = ['north','swing','south','east','west','n','e','w','s','open door','open box','take item','inventory','go north','go west','go east','go south','N','S','W','E','move north','move east','move west','move south']

items = ['knife','cables','jumpstarter','bandages','hen house key' ,'shed key','child','car key','easter egg']
inventory = []
#eggs = ['easter egg']
#eggs_found = []
#keys = ['car key','hen house key','shed key']
#keys_found = []
#inventory.append('jumpstarter')
#items.remove('jumpstarter')
#cur = db.cursor()



#Komento syötteet
eBox = Entry(c)
eBox.insert(20,'')

eBox.bind("<KeyPress>", keydown)
eBox.bind("<KeyRelease>", keyup)
eBox.bind('<Return>',enter)
    

#-----------------------tekstit--
label1 = Label(c, text=('Type here:'), fg='white', bg='grey')
label2 = Label(c, text="Finally Home"+
               '\n'+   '----------------------'
               , fg='white', bg='grey')

label3 = Label(c, text='The Drive way. You can see the front door of the house.'
               , fg='white', bg='black')
label3.config(font=("arial", 14))

#-------Map---guide-------------
label4 = Label(c, text=teksti1, fg='black', bg='white')
label5 = Label(c, text=teksti2, fg='white', bg='grey')
label6 = Label(c, text=teksti3, fg='red', bg='darkgrey')

#----------CanvasLine------
#piha 175y
p1 =c.create_line(10,10,900,10, width=3,fill='black')
p2 =c.create_line(900,10,900,375, width=3,fill='black')
p3 =c.create_line(900,375,150,375, width=3,fill='black')
p4 =c.create_line(10,375,10,10, width=3,fill='black')
p5 =c.create_line(10,375,50,375, width=3,fill='black')
#talon seinät
ts1 =c.create_line(50,50,600,50, width=3,fill='black')
ts2 =c.create_line(600,50,600,300, width=3,fill='black')
ts3 =c.create_line(50,50,50,300, width=3,fill='black')
ts4 =c.create_line(50,300,600,300, width=3,fill='black')
#talon sisäseinät
eteilasten =c.create_line(300,130,300,300, width=3,fill='black')

ololastenW =c.create_line(300,175,350,175, width=3,fill='black')
ololastenM =c.create_line(375,175,500,175, width=3,fill='black')
ololastenE =c.create_line(525,175,600,175, width=3,fill='black')

keittiolo =c.create_line(300,50,300,100, width=3,fill='black')
eteilasten2 =c.create_line(450,175,450,220, width=3,fill='black')
eteilasten3 =c.create_line(450,245,450,300, width=3,fill='black')

#Buttoneiden kompassi viivat
northsouth =c.create_line(700,425,700,505, width=3,fill='black')
eastwest =c.create_line(650,465,750,465, width=3,fill='black')

#raput = c.create_rectangle(170,300,210,250,width=1,fill='brown')

keittiomakuu =c.create_line(170,140,230,140, width=3,fill='black')
makuuhuoneNS =c.create_line(170,50,170,140, width=3,fill='black')

makuuhuoneEW =c.create_line(150,140,50,140, width=3,fill='black')
wcN =c.create_line(120,140,120,160, width=3,fill='black')
wcS =c.create_line(120,180,120,205, width=3,fill='black')
vierashuoneNS =c.create_line(170,205,170,300, width=3,fill='black')
vierashuoneEW =c.create_line(150,205,50,205, width=3,fill='black')

#Swing
swing1 =c.create_line(650,190,670,210, width=3,fill='darkred')
swing2 =c.create_line(630,210,650,190, width=3,fill='darkred')
swing3 =c.create_line(650,240,670,260, width=3,fill='darkred')
swing4 =c.create_line(630,260,650,240, width=3,fill='darkred')
swing5 =c.create_line(650,190,650,240, width=3,fill='darkred')


#vaja 1   
v1 =c.create_line(700,50,850,50, width=3,fill='black')
v2 =c.create_line(850,50,850,125, width=3,fill='black')
v3 =c.create_line(850,125,700,125, width=3,fill='black')
v4 =c.create_line(700,125,700,50, width=3,fill='black')

#vaja 2
v1 =c.create_line(750,350,850,350, width=3,fill='black')
v2 =c.create_line(850,350,850,275, width=3,fill='black')
v3 =c.create_line(850,275,750,275, width=3,fill='black')
v4 =c.create_line(750,275,750,350, width=3,fill='black')

ovi1 =c.create_line(600,165,600,140, width=3,fill='white')
ovi2 =c.create_line(245,300,270,300, width=3,fill='white')
ovi3 =c.create_line(780,275,805,275, width=3,fill='red')
ovi4 =c.create_line(765,125,790,125, width=3,fill='red')



#aloitus x ja y koordinaatit
x=50
y=340

#-------------------------------------------------------
c.update()

#Painikkeita

button1 = Button(c, text = "North",fg='red',bg='lightgrey', anchor = S)
button1.configure(command = moveup,width = 10,state=DISABLED)
button1.pack()

button2 = Button(c, text = "West",fg='red',bg='lightgrey', anchor = S)
button2.configure(command = moveleft,width = 10,state=DISABLED )
button2.pack()

button3 = Button(c, text = "East",fg='red',bg='lightgrey', anchor = S)
button3.configure(command = moveright,width = 10,state=DISABLED)
button3.pack()

button4 = Button(c, text = "South",fg='red',bg='lightgrey',anchor = S)
button4.configure(command = movedown,width = 10,state=DISABLED)
button4.pack()

button5 = Button(c, text = "Enter",fg='red',bg='lightgrey',anchor = S)
button5.bind('<Return>',show)
button5.configure(command = show,width = 10)
button5.pack()

labeloak=Label(c,bg='white')
photo = PhotoImage(file='oak.gif')#kuva3

#labeltext=Label(c,height=50,width=10,bg='white',text='ssssss')
labeloak.config(image=photo)
#labeltext.pack()
labeloak.pack()
buttoni=Button(c, text='OAK: now is not the time to use that', command=kk)
buttoni.pack()
#------------------------------
label1.pack()
label2.pack()
eBox.pack()

#-------------------------objectien sijainnit:-----------------------------------------------
#0,0:sta -x,-y
c.create_window(120, 425, window=label1)
c.create_window(150, 530, window=label2)
#c.create_window(350, 450, window=label3)
#c.create_window(350, 10, window=label3)
c.create_window(430, 388, window=label3)

c.create_window(400, 440, window=label4)
c.create_window(175, 690, window=label5)
c.create_window(700, 685, window=label6)
#c.create_window(300, 700, window=label7)
c.create_window(1400, 350, window=labeloak)
c.create_window(1400,425, window=buttoni)


c.create_window(700,425, window=button1)
c.create_window(620,465, window=button2)
c.create_window(780,465, window=button3)
c.create_window(700,505, window=button4)
c.create_window(175,480, window=button5)

c.create_window(150,450, window=eBox)

#ending= Button(0,0,850,800,width=0,fill='black')
def dead():
    ending=Button(c, bg='black',width="1000",height="1000")
    ending.pack()
    endlabel=Label(c,text='YOU DIED', fg='red', bg='black')
    endlabel.config(font=("times",50))
    endlabel.pack
    Button11=Button(c,bg='red', text='QUIT', command=destroy)
    Button21=Button(c,bg='green', text='RESTART!', command=restart_program)
    Button11.pack()
    Button21.pack()
    c.create_window(450,400, window=Button11)
    c.create_window(450,430, window=Button21)
    c.create_window(450,300, window=endlabel)


#-------------------------------------------------------
if starting==77:
    car_animation(0,-75,-5)
    starting=30
    oval = c.create_oval(x, y, x + 10, y + 10, fill='red')
if starting == 30:
    animationY(0,-20,-5)
    animationX(0,200,5)
    place=1

#-------------------------------------------------------
root.mainloop()


