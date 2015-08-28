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

my $cores = 0;
my $core17 = 0;

for (my $x = 0; $x < 8; $x++)
{
    for (my $y = 0; $y < 8; $y++)
    {
	my $map = $spin4_map->[$y]->[$x];
	next unless $map;

	for (my $c = 0; $c < 18; $c++)
	{
	    eval
	    {
		my $e = $spin->ver (addr => [$x, $y, $c]);
	    };
	    
	    $cores++ unless $@;

	    if ($@)
	    {
		if ($c == 17 && $@ =~ /RC_CPU/)
		{
		    print "# ($x, $y) - 17 core\n";
		    $core17++;
		}
		else
		{
		    print "($x, $y, $c) $@";
		    next;
		}
	    }
	}
    }
}

$spin->close ();

printf "# $cores cores ($core17 \@ 17 core)\n"
