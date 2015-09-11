#!/bin/bash

# Check number of parameters
if [ $# -ne 1 ]
then
	echo "Usage: $0 <IP address>"
	exit
fi
SPIN_IP=$1

# Test an IP address for validity:
# Usage:
#      valid_ip IP_ADDRESS
#      if [[ $? -eq 0 ]]; then echo good; else echo bad; fi
#   OR
#      if valid_ip IP_ADDRESS; then echo good; else echo bad; fi
#

IP_ADDR=0
function valid_ip()
{
    local  ip=$1
    local  stat=1
    local  num=34

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.([0-9]{1,3})$ ]]; then
        OIFS=$IFS
        IFS='.'
        IP_ADDR=($ip)
        IFS=$OIFS
        [[ ${IP_ADDR[0]} -le 255 && ${IP_ADDR[1]} -le 255 \
            && ${IP_ADDR[2]} -le 255 && ${IP_ADDR[3]} -le 255 ]]
        stat=$?
    fi

    return $stat
}

# Validate IP
valid_ip $SPIN_IP
if [[ $? -ne 0 ]]; then
    printf "Badly formed IP address ($SPIN_IP)\n"
    exit
else
    # If all OK proceed
    for i in `seq 0 23`
    do
        echo "#---------------------------------------------"
        echo "#Board $i"
        echo power on
        echo sleep 10
        echo ""
        echo ybug ${IP_ADDR[0]}.${IP_ADDR[1]}.${IP_ADDR[2]}.$((i*8+1)) -bmp ${IP_ADDR[0]}.${IP_ADDR[1]}.${IP_ADDR[2]}.0/$i "<< EOF"
        echo reset
        echo sleep 5
        echo boot scamp.boot spin5-bt.conf
        echo ""
        echo iptag 1 set . 17895
        echo app_load spinn_board_test.aplx all 1-12 16
        echo sleep
        echo app_sig all 16 sync0
        echo EOF
        echo "#---------------------------------------------"
        echo ""

        echo ""
        echo "Listening to port 17895"
        echo "-----------------------"
        echo ./sdp_recv.pl 17895 1.5

        echo ""
        echo "Checking cores"
        echo "--------------"
        echo ./tools/core-bt.pl ${IP_ADDR[0]}.${IP_ADDR[1]}.${IP_ADDR[2]}.$((i*8+1))

        echo ""
        echo "Checking links"
        echo "--------------"
        echo ./tools/link-bt.pl ${IP_ADDR[0]}.${IP_ADDR[1]}.${IP_ADDR[2]}.$((i*8+1))

    done
fi
