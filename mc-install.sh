#!/bin/bash
# Init


############################################
################# CHANGE ###################
ver=0.0.1
dat=09.12.2020
otherfile=---
file=mc-install.sh
otherlink=---
link=---

### INSTALL ###
debianinstall="curl wget sudo screen dialog"
linuxinstall="curl wget sudo screen dialog"
### INSTALL ###

files="202* .debian .dev .log4bash.sh .version"

############################################
############################################


# ROOT CHECK
FILE="/tmp/out.$$"
GREP="/bin/grep"
if [ "$(id -u)" != "0" ]; then
	log_warning "Das Script muss als root gestartet werden."
	exit 1
fi

# SETZE FARBCODES
red=($(tput setaf 1))
green=($(tput setaf 2))
yellow=($(tput setaf 3))
reset=($(tput sgr0))
tput1=($(tput setaf 1))
tput2=($(tput setaf 2))
tput3=($(tput setaf 3))
tput4=($(tput setaf 4))
tput5=($(tput setaf 5))
tput6=($(tput setaf 6))
tput7=($(tput setaf 7))
tput8=($(tput setaf 8))
tput9=($(tput setaf 9))


# LADE DAS LOG FEATURE
rm .log4bash.sh
clear
curl --progress-bar https://raw.githubusercontent.com/Mobulos/multi-install/master/log4bash.sh -o .log4bash.sh
chmod +x .log4bash.sh
source .log4bash.sh
clear



#   ____    ____    _____ 
#  |  _ \  |  _ \  | ____|
#  | |_) | | |_) | |  _|  
#  |  __/  |  _ <  | |___ 
#  |_|     |_| \_\ |_____|

function pre () {
	echo "$yellow##########################################"
	sleep .1
	echo "#### mc install  Script By Mobulos ####"
	sleep .1
	echo "##########################################"
	sleep .1
	echo
	#echo "$reset""Version $ver"
	echo "$red""[DEVELOPER] "$reset"Version $ver"
	echo "Update $dat"
	echo -n "$reset"
	echo
	log_warning "Dies ist die PRE-RELEASE Version, das Script verfügt noch nicht über alle Funktionen!"
	echo

}


#   __  __   _____   _   _   _   _   _____ 
#  |  \/  | | ____| | \ | | | | | | | ____|
#  | |\/| | |  _|   |  \| | | | | | |  _|  
#  | |  | | | |___  | |\  | | |_| | | |___ 
#  |_|  |_| |_____| |_| \_|  \___/  |_____|
                            
function menue () {
	set -u
	clear
	pre
	sleep .5
	echo "Auswahlmöglichkeiten:"

	sleep .1
	echo "$tput5 [1] Minecraft versionen"

	sleep .1
	echo "$tput4 [2] CloudNet"

	sleep .1
	echo "$tput4 [3] ReformCloud"

	sleep .1
	echo "$tput6 [4] Einstellungen"

	sleep .1
	echo "$tput6 [4] Exit"

	echo -n "$tput3"
	read -n1 -p "Was willst du tun?: " menbef
	clear
	echo -n "$reset"
	case $menbef in
	1)
		installation
		;;
	2)
		rm 20*
		update
		;;
	3)
		settings
		;;
	4)
		echo
		;;
	*)
		clear
		log_error "Du musst dich vertippt haben..."
		read -n1 -t2
		menue
		;;
	esac
exit 0
}



#   _____                              
#  | ____|  _ __   _ __    ___    _ __ 
#  |  _|   | '__| | '__|  / _ \  | '__|
#  | |___  | |    | |    | (_) | | |   
#  |_____| |_|    |_|     \___/  |_|   


function error () {
	echo
	echo
	echo
	log_warning "Ein Fehler ist aufgetreten!"
	log_error "$state"
	echo
	echo 'Bitte erstelle ein "issue" auf GitHub "https://github.com/Mobulos/multi-install/issues"'
	echo 'Bitte füge alles ab "COPY" auf der Website ein!'
	sleep 2
	log_warning "Das Script wird beendet!"
	exit 0
}




menue
exit 0
