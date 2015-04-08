#!/bin/bash

suffix=$(date +%d%m%y_%H%M%S)
filename_ver=ver-xy_3boards_$suffix.log
filename_link=link-xy_3boards_$suffix.log
 
echo "Probing core status"
./ver-xy 192.168.5.1 12 12 > $filename_ver
echo "Probing links"
./link-xy 192.168.5.1 12 12 >  $filename_link

echo "Core status ($filename_ver)"
cat $filename_ver
echo "Listing errors"
grep x $filename_ver

echo "Link status ($filename_link)"
cat $filename_link
grep xxx $filename_link
echo "Listing errors"
