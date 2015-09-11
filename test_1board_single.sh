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
function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.([0-9]{1,3})$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi

	BMP_IP="${ip[0]}.${ip[1]}.${ip[2]}.$((ip[3]-1))"

    return $stat
}

# Validate IP
valid_ip $SPIN_IP
if [[ $? -ne 0 ]]; then printf "Badly formed IP address ($SPIN_IP)\n"; exit; fi

# If all OK, proceed

# Power cycle board no. 1
ybug $SPIN_IP -bmp $BMP_IP << EOF
power off
sleep 2
power on
sleep 6
EOF

echo ""
echo "Single board testing"
echo "--------------------"
ybug $SPIN_IP -bmp $BMP_IP << EOF
boot scamp.boot spin5-bt.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-12 16
sleep
app_sig all 16 sync0
EOF

echo ""
echo "Listening to port 17895"
echo "-----------------------"
./sdp_recv.pl 17895 1.5

echo ""
echo "Checking cores"
echo "--------------"
./tools/core-bt.pl 192.168.240.1

echo ""
echo "Checking links"
echo "--------------"
./tools/link-bt.pl 192.168.240.1
