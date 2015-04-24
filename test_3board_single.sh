# Power cycle boards
ybug 192.168.5.1 -bmp 192.168.5.0/0-4 << EOF
power off
sleep 5
power on
sleep 10
EOF

echo "Board 1"
ybug 192.168.5.1 -bmp 192.168.5.0/0 << EOF
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF

echo "Board 2"
ybug 192.168.5.17 -bmp 192.168.5.0/2 << EOF
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF

echo "Board 3"
ybug 192.168.5.33 -bmp 192.168.5.0/4 << EOF
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF
