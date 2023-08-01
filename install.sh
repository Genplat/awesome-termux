#!/data/data/com.termux/files/usr/bin/bash -e

VERSION=2020011601 # Kali version variable
BASE_URL=https://kali.download/nethunter-images/current/rootfs
USERNAME=kali

function ctbanner() {
    clear
    echo -e """\t
    \t⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⠖⠀⠀⠲⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    \t⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
    \t⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀
    \t⠀⠀⠀⠀⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀
    \t⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⣤⠶⠛⣛⣉⣙⡛⠛⢶⣄⣸⣿⣿⣿⠀⠀⠀⠀⠀⠀
    \t⠀⠀⠀⠀⢀⣀⣿⣿⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣀⡀⠀⠀⠀⠀
    \t⠀⠀⢠⣴⣿⣿⣿⣿⡟⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⣿⣿⣦⡄⠀⠀
    \t⠀⣴⣿⣿⡿⠿⢛⣻⡇⢸⡟⠻⣿⣿⣿⣿⣿⡿⠟⢻⡇⣸⣛⡛⠿⣿⣿⣿⣦⠀
    \t⢸⣿⡿⠋⠀⠀⢸⣿⣿⡜⢧⣄⣀⣉⡿⣿⣉⣀⣠⣼⢁⣿⣿⡇⠀⠀⠙⢿⣿⡆
    \t⣿⣿⠁⠀⠀⠀⠈⣿⣿⡇⣿⡿⠛⣿⣵⣮⣿⡟⢻⡿⢨⣿⣿⠀⠀⠀⠀⠈⣿⣿
    \t⢿⡟⠀⠀⠀⠀⠀⠘⣿⣷⣤⣄⡀⣿⣿⣿⣿⢁⣤⣶⣿⣿⠃⠀⠀⠀⠀⠀⣿⡟
    \t⠘⠇⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡇⢿⣿⣿⣿⢸⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠻⠃
    \t⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⢩⣦⣘⡘⠋⣛⣸⡍⠁⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀
    \t⠀⠀⠘⢿⣷⣤⣤⣄⣤⣤⣶⣿⣿⣿⡿⢿⣿⣿⣿⣷⣤⣤⣠⣤⣴⣾⡿⠁⠀⠀
    \t⠀⠀⠀⠀⠉⠛⠿⠿⠿⡿⠿⠿⠛⠉⠀⠀⠉⠛⠿⠿⣿⠿⠿⠿⠛⠉⠀⠀⠀⠀
    """ | lolcat
    toilet -f ivrit ' CustoMUX   Setup' | lolcat
    echo
    echo
    echo
}

function clonerepo() {
    ctbanner
    echo Cloning sources... | lolcat
    git clone https://github.com/Genplat/awesome-termux
}

function cpfiles() {
    ctbanner
    echo Copying files... | lolcat
    mv awesome-termux custoMUX &> /dev/null
    cd custoMUX &> /dev/null
    rm ~/../usr/bin/login &> /dev/null
    chmod +x * &> /dev/null
    cp -r * ~/../usr/bin/ &> /dev/null
}

function confprof() {
    ctbanner
    read -p "New username: " usernametermux
    read -p "New password: " passwdtermux
    echo $passwdtermux > ~/../usr/etc/passwdtermux
    echo $username termux > ~/../usr/etc/usrtermux
}

function unsupported_arch() {
    ctbanner
    printf "${red}"
    printf "[*] Unsupported Architecture\n\n"
    printf "${reset}"
    exit
}

function magisk_alert() {
    printf "${blue}Do you have magisk installed? You can try our CustoMUX magisk module for a more easy installation and more tools!\n"
    printf "${blue}Download at https://github.com/Genplat/CustoMUX\n"
    printf "${blue}Wait 5s to install BASIC CustoMUX (awesome-termux) or Ctrl+C to cancell and install magisk module\n\n"
    sleep 5
}

function installzsh_theme() {
    echo Installing Powerlevel10k... | lolcat
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
}

function ask() {
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi
        
        printf "${light_cyan}\n[?] "
        read -p "$1 [$prompt] " REPLY

        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        printf "${reset}"

        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac
    done
}

function get_arch() {
    ctbanner
    echo "[*] Checking device architecture ..." | lolcat
    case $(getprop ro.product.cpu.abi) in
        arm64-v8a)
            SYS_ARCH=arm64
            ;;
        armeabi|armeabi-v7a)
            SYS_ARCH=armhf
            ;;
        *)
            unsupported_arch
            ;;
    esac
}

function set_strings() {
    echo \
    && echo "" 
    ####
    if [[ ${SYS_ARCH} == "arm64" ]];
    then
        wimg="full"
    elif [[ ${SYS_ARCH} == "armhf" ]];
    then
            ctbanner
            echo "[!] NetHunter installation will be MINIMAL. Your arch doesn't support a full nethunter installation." | lolcat
            wimg="minimal"
    fi
    ####


    CHROOT=kali-${SYS_ARCH}
    IMAGE_NAME=kalifs-${SYS_ARCH}-${wimg}.tar.xz
    SHA_NAME=kalifs-${SYS_ARCH}-${wimg}.sha512sum
}    

function prepare_fs() {
    unset KEEP_CHROOT
    if [ -d ${CHROOT} ]; then
        rm -rf ${CHROOT}
    fi
} 

function cleanup() {
    echo "Limpiando archivos residuales..." | lolcat
    if [ -f ${IMAGE_NAME} ]; then
	    if [ -f ${IMAGE_NAME} ]; then
                rm -f ${IMAGE_NAME}
	    fi
	    if [ -f ${SHA_NAME} ]; then
                rm -f ${SHA_NAME}
	    fi
    fi
} 

function check_dependencies() {
    printf "\n[*] Installing packages...${reset}\n"
    apt update -y && apt dist-upgrade
    pkg i apt
    dpkg --configure -a
    rm /data/data/com.termux/files/usr/etc/profile.d/init-termux-properties.sh # This fix bugs
    rm /data/data/com.termux/files/usr/etc/motd # This file bug some devices :/
    pkg update -y
    apt-get update -y || apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" dist-upgrade -y
    dpkg --configure -a
    apt install -y proot tar axel nano python python3 figlet toilet git zsh neovim wget curl zip
    dpkg --configure -a
    pip3 install lolcat
}

function get_url() {
    ROOTFS_URL="${BASE_URL}/${IMAGE_NAME}"
    SHA_URL="${BASE_URL}/${SHA_NAME}"
}

function get_rootfs() {
    unset KEEP_IMAGE
    if [ -f ${IMAGE_NAME} ]; then
        rm -f ${IMAGE_NAME}
    fi
    printf "[*] Downloading rootfs...${reset}\n\n" | lolcat
    get_url
    wget ${EXTRA_ARGS} --continue "${ROOTFS_URL}" | lolcat
}

function get_sha() {
    if [ -z $KEEP_IMAGE ]; then
        printf "\n[*] Getting SHA ... ${reset}\n\n" | lolcat
        get_url
        if [ -f ${SHA_NAME} ]; then
            rm -f ${SHA_NAME}
        fi
        wget ${EXTRA_ARGS} --continue "${SHA_URL}" | lolcat
    fi
}

function verify_sha() {
    if [ -z $KEEP_IMAGE ]; then
        printf "\n[*] Verifying integrity of rootfs...${reset}\n\n" | lolcat
        sha512sum -c $SHA_NAME || {
            printf "Don't use unofficial nethunter rootfs.\n" | lolcat
        }
    fi
}

function extract_rootfs() {
    printf "\n[*] Extracting rootfs...\n\n" | lolcat
    proot --link2symlink tar -xf $IMAGE_NAME 2> /dev/null
}


function create_launcher() {
    NH_LAUNCHER=${PREFIX}/bin/nethunter
    NH_SHORTCUT=${PREFIX}/bin/nh
    cat > $NH_LAUNCHER <<- EOF
#!/data/data/com.termux/files/usr/bin/bash -e
cd \${HOME}
## termux-exec sets LD_PRELOAD so let's unset it before continuing
unset LD_PRELOAD
## Workaround for Libreoffice, also needs to bind a fake /proc/version
if [ ! -f $CHROOT/root/.version ]; then
    touch $CHROOT/root/.version
fi

## Default user is "kali"
user="$USERNAME"
home="/home/\$user"
start="sudo -u kali /bin/bash"

## NH can be launched as root with the "-r" cmd attribute
## Also check if user kali exists, if not start as root
if grep -q "kali" ${CHROOT}/etc/passwd; then
    KALIUSR="1";
else
    KALIUSR="0";
fi
if [[ \$KALIUSR == "0" || ("\$#" != "0" && ("\$1" == "-r" || "\$1" == "-R")) ]];then
    user="root"
    home="/\$user"
    start="/bin/bash --login"
    if [[ "\$#" != "0" && ("\$1" == "-r" || "\$1" == "-R") ]];then
        shift
    fi
fi

cmdline="proot \\
        --link2symlink \\
        -0 \\
        -r $CHROOT \\
        -b /dev \\
        -b /proc \\
        -b $CHROOT\$home:/dev/shm \\
        -w \$home \\
           /usr/bin/env -i \\
           HOME=\$home \\
           PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin \\
           TERM=\$TERM \\
           LANG=C.UTF-8 \\
           \$start"

cmd="\$@"
if [ "\$#" == "0" ];then
    exec \$cmdline
else
    \$cmdline -c "\$cmd"
fi
EOF

    chmod 700 $NH_LAUNCHER
    if [ -L ${NH_SHORTCUT} ]; then
        rm -f ${NH_SHORTCUT}
    fi
    if [ ! -f ${NH_SHORTCUT} ]; then
        ln -s ${NH_LAUNCHER} ${NH_SHORTCUT} >/dev/null
    fi
   
}

function create_kex_launcher() {
    KEX_LAUNCHER=${CHROOT}/usr/bin/kex
    cat > $KEX_LAUNCHER <<- EOF
#!/bin/bash

function start-kex() {
    if [ ! -f ~/.vnc/passwd ]; then
        passwd-kex
    fi
    USR=\$(whoami)
    if [ \$USR == "root" ]; then
        SCREEN=":2"
    else
        SCREEN=":1"
    fi 
    export HOME=\${HOME}; export USER=\${USR}; LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgcc_s.so.1 nohup vncserver \$SCREEN >/dev/null 2>&1 </dev/null
    starting_kex=1
    return 0
}

function stop-kex() {
    vncserver -kill :1 | sed s/"Xtigervnc"/"NetHunter KeX"/
    vncserver -kill :2 | sed s/"Xtigervnc"/"NetHunter KeX"/
    return $?
}

function passwd-kex() {
    vncpasswd
    return $?
}

function status-kex() {
    sessions=\$(vncserver -list | sed s/"TigerVNC"/"NetHunter KeX"/)
    if [[ \$sessions == *"590"* ]]; then
        printf "\n\${sessions}\n"
        printf "\nYou can use the KeX client to connect to any of these displays.\n\n"
    else
        if [ ! -z \$starting_kex ]; then
            printf '\nError starting the KeX server.\nPlease try "nethunter kex kill" or restart your termux session and try again.\n\n'
        fi
    fi
    return 0
}

function kill-kex() {
    pkill Xtigervnc
    return \$?
}

case \$1 in
    start)
        start-kex
        ;;
    stop)
        stop-kex
        ;;
    status)
        status-kex
        ;;
    passwd)
        passwd-kex
        ;;
    kill)
        kill-kex
        ;;
    *)
        stop-kex
        start-kex
        status-kex
        ;;
esac
EOF

    chmod 700 $KEX_LAUNCHER
}

function fix_profile_bash() {
    ## Prevent attempt to create links in read only filesystem
    if [ -f ${CHROOT}/root/.bash_profile ]; then
        sed -i '/if/,/fi/d' "${CHROOT}/root/.bash_profile"
    fi
}

function fix_sudo() {
    ## fix sudo & su on start
    chmod +s $CHROOT/usr/bin/sudo
    chmod +s $CHROOT/usr/bin/su
	echo "kali    ALL=(ALL:ALL) ALL" > $CHROOT/etc/sudoers.d/kali

    # https://bugzilla.redhat.com/show_bug.cgi?id=1773148
    echo "Set disable_coredump false" > $CHROOT/etc/sudo.conf
}

function fix_uid() {
    ## Change kali uid and gid to match that of the termux user
    USRID=$(id -u)
    GRPID=$(id -g)
    nh -r usermod -u $USRID kali 2>/dev/null
    nh -r groupmod -g $GRPID kali 2>/dev/null
}

##################################
##              Main            ##

# Add some colours
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'

EXTRA_ARGS=""
if [[ ! -z $1 ]]; then
    EXTRA_ARGS=$1
    if [[ $EXTRA_ARGS != "--no-check-certificate" ]]; then
        EXTRA_ARGS=""
    fi
fi

##############
#            #
#   INSTALL  #
# By Genplat #
#            #
##############

termux-setup-storage
sleep 3
magisk_alert
cd $HOME
check_dependencies
get_arch
set_strings
ctbanner
installzsh_theme
clonerepo
cpfiles
ctbanner
prepare_fs
ctbanner
get_rootfs
ctbanner
get_sha
ctbanner
verify_sha
ctbanner
extract_rootfs
confprof
ctbanner
create_launcher
ctbanner
cleanup
ctbanner
printf "\n[*] Configuring NetHunter for Termux ...\n" | lolcat
fix_profile_bash
fix_sudo
create_kex_launcher
fix_uid
echo "Installed! Clossing in 10s..." | lolcat
sleep 10
login
