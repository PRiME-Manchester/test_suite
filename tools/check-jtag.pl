#!/usr/bin/perl

use strict;
use warnings;

my $taps = 0;

my @text;

while (<>)
{
    if (/^Info : JTAG tap: chip-(\d+)-(\d+).cpu tap\/device found: 0x05968477 \(mfg: 0x23b, part: 0x5968, ver: 0x0\)$/)
    {
	$taps++;
    }
    else
    {
	push @text, $_;
    }
}

if ($taps == 864)
{
    print "# All OK ($taps taps)\n";
}
else
{
    print @text;
    print "# JTAG test failed\n";
}
