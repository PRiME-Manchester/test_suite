#Board 0
ybug 192.168.4.1 -bmp 192.168.4.0/0 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF

#Board 1
ybug 192.168.4.9 -bmp 192.168.4.0/1 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 2
ybug 192.168.4.17 -bmp 192.168.4.0/2 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 3
ybug 192.168.4.25 -bmp 192.168.4.0/3 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 4
ybug 192.168.4.33 -bmp 192.168.4.0/4 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 5
ybug 192.168.4.41 -bmp 192.168.4.0/5 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 6
ybug 192.168.4.49 -bmp 192.168.4.0/6 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 7
ybug 192.168.4.57 -bmp 192.168.4.0/7 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 8
ybug 192.168.4.65 -bmp 192.168.4.0/8 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 9
ybug 192.168.4.73 -bmp 192.168.4.0/9 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 10
ybug 192.168.4.81 -bmp 192.168.4.0/10 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 11
ybug 192.168.4.89 -bmp 192.168.4.0/11 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 12
ybug 192.168.4.97 -bmp 192.168.4.0/12 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 13
ybug 192.168.4.105 -bmp 192.168.4.0/13 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 14
ybug 192.168.4.113 -bmp 192.168.4.0/14 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 15
ybug 192.168.4.121 -bmp 192.168.4.0/15 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 16
ybug 192.168.4.129 -bmp 192.168.4.0/16 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 17
ybug 192.168.4.137 -bmp 192.168.4.0/17 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 18
ybug 192.168.4.145 -bmp 192.168.4.0/18 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 19
ybug 192.168.4.153 -bmp 192.168.4.0/19 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 20
ybug 192.168.4.161 -bmp 192.168.4.0/20 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 21
ybug 192.168.4.169 -bmp 192.168.4.0/21 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 22
ybug 192.168.4.177 -bmp 192.168.4.0/22 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF


#Board 23
ybug 192.168.4.185 -bmp 192.168.4.0/23 << EOF
reset
sleep 5
boot scamp.boot spin5.conf

iptag 1 set . 17895
app_load spinn_board_test.aplx all 1-16 16
sleep
app_sig all 16 sync0
EOF

