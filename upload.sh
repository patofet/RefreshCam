#!/bin/bash
# SCRIPT  : upload.sh
# USAGE   : ./upload.sh [-d remote directory path] -f "File-to-upload"
#           -d option is optional by default it takes servers home dir
#                               or
#           ./upload.sh "Filename-to-upload"
#
# PURPOSE : Upload file to remote ftp server.

############### DEFINE FUNCTIONS HERE ##############

Usage()
{
  echo "                     USAGE                                  "
  echo " $0 [-d \"Remote Directory Path\"] -f \"Filename-to-upload\""
  echo "-------------------------- or -----------------------------"
  echo " $0 Filename-to-upload"
  exit 1
}

################# ARGUMENTS CHECKING #################

while getopts d:f: choice
do
   case $choice in
   d) Dname=$OPTARG;;
   f) Fname=$OPTARG;;
   esac
done

[ $# -eq 1 ] && Fname=$1
[ -z $Dname ] && Dname="/"                  #change it to suit
[ -z $Fname ] && echo "Bad Arguments" && Usage

[ ! -e $Fname ] && echo "$0: $Fname  no such file" && exit 1

############### DEFINE VARIABLES HERE ################

Server="gestio.bell-lloc.org"               #Remote ftp server.
Username="camera"                         #Remote ftp user name.
Password="132465798"                   #Remote ftp Password.

# change above to suit

############### MAIN PROGRAM STARTS HERE #############

# Remove comment lines within the here document before run the script
echo ftp...
ftp -n 192.168.100.3 << ServerEnd
user camera 132465798
binary
cd $Dname
put "$Fname"
bye
ServerEnd

exit 0
