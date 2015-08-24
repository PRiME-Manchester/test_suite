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

suffix=$(date +%d%m%y_%H%M%S)
filename_ver=ver-xy_1board_$suffix.log
filename_link=link-xy_1board_$suffix.log
 
echo "Probing core status"
./ver-xy $SPIN_IP 8 8 > $filename_ver
echo "Probing links"
./link-xy $SPIN_IP 8 8 >  $filename_link

echo "Core status ($filename_ver)"
cat $filename_ver
echo "Listing errors"
grep x $filename_ver

echo "Link status ($filename_link)"
cat $filename_link
grep xxx $filename_link
echo "Listing errors"
