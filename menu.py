#!/usr/bin/python


import os

print ("Welcome to SSH Menu")
print ("Your options are:")
print ("")
print ("1) EC CDM Clients")
print ("2) GP CDM Clients")
print ("3) WC CDM Clients")
print ("4) KN CDM Clients")
print ("5) RIM CDM Clients")
print ("6) CAL servers")
print ("7) CDL servers")
print ("")



loop = 1

while loop == 1:
    choice = input ("Choose your optioni 8 to Exit: ")
    choice = int (choice)
    
    if choice == 1:
        print ("Menu for EC CDM Clients")
        os.system("/root/ECmenu.py 1")
    elif choice == 2:
        print ("Menu for GP CDM Clients")
        os.system("/root/GPmenu.py 1")
    elif choice == 3:
        print ("Menu for WC CDM Clients")
        os.system("/root/WCmenu.py 1")
    elif choice == 4:
        print ("Menu for KN CDM Clients")
        os.system("/root/KNmenu.py 1")
    elif choice == 5:
        print ("Menu for RIM CDM Clients")
        os.system ("/root/RIMmenu.py 1")
    elif choice == 6:
        print ("Menu for CAL CDM Clients")
        os.system("/root/CALmenu.py 1")
    elif choice == 7:
        print ("Menu for CDL CDM Clients")
        os.system("/root/CDLmenu.py 1")
    elif choice == 8:
        loop = 0
    else:
        print ("Plese enter Value between 1 to 8.")

