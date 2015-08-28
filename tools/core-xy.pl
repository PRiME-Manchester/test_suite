#!/usr/bin/perl

use strict;
use warnings;

use SpiNN::Cmd;
use SpiNN::Struct;


die "usage: core-xy <ip_addr> <X> <Y> <cores>\n" unless
    $#ARGV == 3 &&
    $ARGV[1] =~ /^\d+$/ &&
    $ARGV[2] =~ /^\d+$/ &&
    $ARGV[3] =~ /^\d+$/;


my @errors;

my $spin = SpiNN::Cmd->new (target => $ARGV[0]);
die unless $spin;

my $sv = SpiNN::Struct->new (scp => $spin);
die unless $sv;

my $cores = 0;
my $core17 = 0;

for (my $x = 0; $x < $ARGV[1]; $x++)
{
    for (my $y = 0; $y < $ARGV[2]; $y++)
    {
	for (my $c = 0; $c < $ARGV[3]; $c++)
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
