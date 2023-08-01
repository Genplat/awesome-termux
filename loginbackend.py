import time
import os

def login(username, passwd):
    with open("/data/data/com.termux/files/usr/etc/usrtermux") as usernameinfile:
        stored_username = usernameinfile.read().strip()
    with open("/data/data/com.termux/files/usr/etc/passwdtermux") as passwdinfile:
        stored_passwd = passwdinfile.read().strip()

    if username == stored_username and passwd == stored_passwd:
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
