ybug $1 << EOF | grep "sp\|Loc  MC\|Ext  MC\|Dump MC" | tr "\n" " " | sed -r 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+,[0-9]+,[0-9]+[ ]*>[ ]*sp[ ]*([0-9])[ ]*([0-9])[ ]*Loc  MC:[ ]*([0-9]+)[ ]*Ext  MC:[ ]*([0-9]+) Dump MC:[ ]*([0-9]+)[ ]*/Chip (\1,\2)  Loc,Ext MC: \3, \4  Dump MC: \5\n/g'
sp 0 0
rtr_diag
sp 1 0
rtr_diag
sp 2 0
rtr_diag
sp 3 0
rtr_diag
sp 4 0
rtr_diag
sp 5 1
rtr_diag
sp 6 2
rtr_diag
sp 7 3
rtr_diag
sp 7 4
rtr_diag
sp 7 5
rtr_diag
sp 7 6
rtr_diag
sp 7 7
rtr_diag
sp 6 7
rtr_diag
sp 5 7
rtr_diag
sp 4 7
rtr_diag
sp 3 6
rtr_diag
sp 2 5
rtr_diag
sp 1 4
rtr_diag
sp 0 3
rtr_diag
sp 0 2
rtr_diag
sp 0 1
rtr_diag

sp 1 1
rtr_diag
sp 2 1
rtr_diag
sp 3 1
rtr_diag
sp 4 1
rtr_diag

sp 1 2
rtr_diag
sp 2 2
rtr_diag
sp 3 2
rtr_diag
sp 4 2
rtr_diag
sp 5 2
rtr_diag

sp 1 3
rtr_diag
sp 2 3
rtr_diag
sp 3 3
rtr_diag
sp 4 3
rtr_diag
sp 5 3
rtr_diag
sp 6 3
rtr_diag

sp 2 4
rtr_diag
sp 3 4
rtr_diag
sp 4 4
rtr_diag
sp 5 4
rtr_diag
sp 6 4
rtr_diag

sp 3 5
rtr_diag
sp 4 5
rtr_diag
sp 5 5
rtr_diag
sp 6 5
rtr_diag

sp 4 6
rtr_diag
sp 5 6
rtr_diag
sp 6 6
rtr_diag

EOF

# To grep the output for 'sp' OR 'Dump MC' type:
# ./rtr_diag_border.sh  | grep "sp\|Dump MC"

# Use this if you want to further clean up the output
# ./rtr_diag_border.sh  | grep "sp\|Dump MC" | sed -r 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+,[0-9]+,[0-9]+ > //'

# These are some crazy ones but they can be used for some nice output
#./rtr_diag_border.sh  | grep "sp\|Dump MC" | tr "\n" " " | sed -r 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+,[0-9]+,[0-9]+[ ]*>[ ]*sp[ ]*([0-9])[ ]*([0-9])[ ]*Dump MC:[ ]*([0-9]+)[ ]*/Chip (\1,\2) Dumped MC: \3\n/g'
#./rtr_diag_border.sh  | grep "sp\|Loc  MC\|Dump MC" | tr "\n" " " | sed -r 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+,[0-9]+,[0-9]+[ ]*>[ ]*sp[ ]*([0-9])[ ]*([0-9])[ ]*Loc  MC:[ ]*([0-9]+) Dump MC:[ ]*([0-9]+)[ ]*/Chip (\1,\2) Loc MC: \3 Dump MC: \4\n/g'
