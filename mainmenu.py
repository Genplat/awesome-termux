import os
def func():
	opt = int(input("Option: "))
	if opt == 1:
	    os.system("clear")
	    os.system("banner")
	    os.system("zsh")
	elif opt == 2:
	    os.system("clear")
	    os.system("banner")
	    os.system("nethunter")
	elif opt == 3:
	    os.system("clear")
	    os.system("banner")
	    os.system("nh kex")
	elif opt == 4:
	    os.system("clear")
	    os.system("banner")
	    os.system("su")
	elif opt == 5:
	    os.system("close")
	else:
	    os.system("echo [!] Invalid option | lolcat")
	    func()
func()
