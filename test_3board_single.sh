ybug 192.168.5.1 -bmp 192.168.5.0/0 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


ybug 192.168.5.17 -bmp 192.168.5.0/2 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17896
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


ybug 192.168.5.33 -bmp 192.168.5.0/4 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17897
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF
