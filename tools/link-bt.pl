#!/usr/bin/perl

use strict;
use warnings;

use SpiNN::Cmd;
use SpiNN::Struct;


my $spin4_map =
[
# X     0     1     2     3     4     5     6     7
    [0x07, 0x0f, 0x0f, 0x0f, 0x0e,    0,    0,    0], # Y = 0
    [0x27, 0x3f, 0x3f, 0x3f, 0x3f, 0x1e,    0,    0], # Y = 1
    [0x27, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x1e,    0], # Y = 2
    [0x23, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x1c], # Y = 3
    [   0, 0x33, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x3c], # Y = 4
    [   0,    0, 0x33, 0x3f, 0x3f, 0x3f, 0x3f, 0x3c], # Y = 5
    [   0,    0,    0, 0x33, 0x3f, 0x3f, 0x3f, 0x3c], # Y = 6
    [   0,    0,    0,    0, 0x31, 0x39, 0x39, 0x38]  # Y = 7
];


my @errors;

my $spin = SpiNN::Cmd->new (target => $ARGV[0]);
die unless $spin;

my $sv = SpiNN::Struct->new (scp => $spin);
die unless $sv;

print " X  Y   LU     0     1     2     3     4     5 \n";
print "------  --    ---   ---   ---   ---   ---   ---\n";

for (my $x = 0; $x < 8; $x++)
{
  for (my $y = 0; $y < 8; $y++)
  {
		my $map = $spin4_map->[$y]->[$x];
		next unless $map;

		my ($text, $lu);

		for (my $link = 0; $link < 6; $link++)
		{
	    my $d;

	    eval
	    {
				$lu = $sv->read_var ("sv.link_up", addr => [$x, $y]);

				$d = $spin->link_read ($link, 0xf5007f00, 4,
						     addr => [$x, $y],
						     unpack => "V");
	    };
	    
	    if ($@)
	    {
				push @errors, "($x, $y) $@\n";
				$text .= "   ###";
		#		last;
	    }
	    else
	    {
				my $t = sprintf "%d,%d", ($d->[0] >> 8) & 255, $d->[0] & 255;
				$text .= sprintf " %5s", $t;
	    }
		}

		printf "%2d %2d   %02x %s\n", $x, $y, $lu, $text;
  }
}

print @errors;

$spin->close ();
