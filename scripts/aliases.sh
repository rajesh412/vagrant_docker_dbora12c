#!/bin/sh

alias db_container_init='sudo docker run  --privileged -h db12c --name database -p 1521:1521 -t -d  oracle/database /bin/bash'
alias wl_container_init='sudo docker run  --privileged -h crm92 --name weblogic -p 8001:8001 -p 8002:8002 -t -d oracle/weblogic /bin/bash'

alias db_shell='sudo docker exec -i -t database /bin/bash'
alias wl_shell='sudo docker exec -i -t weblogic /bin/bash'

alias db_start='sudo docker exec -i database /bin/bash  /etc/init.d/dbstart'
alias db_stop='sudo  docker exec -i database /etc/init.d/dbstart stop'
alias db_ping='sudo  docker exec -i database su - oracle -c "tnsping db12c"'

alias db_container_start='sudo docker start  database && db_start'
alias wl_container_start='sudo docker start  weblogic'
alias db_container_stop='db_stop && sudo docker stop  database'
alias wl_container_stop='sudo docker stop  weblogic'       

# Welcome message for login shells
if [[ $SHLVL -eq 1 ]] ; then
    echo
    print -P "\e[1;32m Welcome to: \e[1;34m%m"
    print -P "\e[1;32m Running: \e[1;34m`uname -srm`\e[1;32m on \e[1;34m%l"
    print -P "\e[1;32m It is:\e[1;34m %D{%r} \e[1;32m on \e[1;34m%D{%A %b %f %G}"
    echo  
	print -P "\e[1;32m Docker containers: \e[1;34m"
    docker ps -a 
	print -P "\e[1;32m"

    echo " Following aliases available:"
    echo "--------------------------------------------------"
	echo "db_container_init"
	echo "db_container_start"
	echo "db_container_stop"
	echo ""
	echo "db_ping       - tnsping database"
	echo "db_stop       - Stops Database inside the image"
	echo "db_start      - Start Database inside the image"
	echo ""
	echo "db_shell      - shell into database container"
	echo "wl_shell      - shell into weblogic container"	
	echo "--------------------------------------------------"
fi
