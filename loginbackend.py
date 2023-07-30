import time
import os
def login(username, passwd):
    usernameinfile = open("/data/data/com.termux/files/usr/etc/usrtermux")
    passwdinfile = open("/data/data/com.termux/files/usr/etc/passwdtermux")
    if username == usernameinfile and passwd == passwdinfile:
        os.system('touch /data/data/com.termux/files/home/custoMUX/passwdlock')
        os.system("mainmenu")
    else:
        print("[!] ERROR.")
        time.sleep(3) 
        exit()
try:
	file = open('/data/data/com.termux/files/home/custoMUX/passwdlock')
	file.close()
	os.system("mainmenu")
except FileNotFoundError:
    username = input("User: ")
    passwd = input("Password: ")
    login(username, passwd)