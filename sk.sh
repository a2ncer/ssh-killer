#! /bin/bash
my_tty=$(tty)
dev=""
my_tty=${my_tty/\/dev\//$dev}
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
while true; do 
 for tty in $(who | awk '{print $2}'); do
   test $tty = ${thistty=$(tty)} ||
	if [ "$my_tty" != "$tty" ] && [ "$1" != "$tty" ]; then
		 echo -e  "\n \n ${YELLOW}* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *${NC} ";
		 echo -e  "		${GREEN} safe $my_tty $1 ${NC}	${RED} kill  $tty ${NC} \n";
		 w;
		 pkill -HUP -t $tty;
		 echo -e "\n ${YELLOW}* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * ${NC}";
	fi

 done
sleep 2;
done
