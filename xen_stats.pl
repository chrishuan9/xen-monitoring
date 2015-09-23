#!/usr/bin/perl -w
 
use strict;
 
# declare...
sub trim($);
 
# we need to run 2 itterations because CPU stats show 0% on the first, and I'm putting .1 second betwen them to speed it up
my @result = split(/\n/, `xentop -b -i 2 -d.1`);
 
# remove the first line
shift(@result);
 
# this looks for the start of the 2nd output section
foreach my $line (@result)
{
  if ($line =~ m/^xentop - /)
  {
    last;
  }
  shift(@result);
}
 
 
# the next 3 lines are headings..
shift(@result);
shift(@result);
shift(@result);
 
foreach my $line (@result)
{
  my @xenInfo = split(/[\t ]+/, trim($line));
  printf("name: %s, cpu_sec: %d, cpu_percent: %.2f, vbd_rd: %d, vbd_wr: %d\n",
    $xenInfo[0],
    $xenInfo[2],
    $xenInfo[3],
    $xenInfo[14],
    $xenInfo[15]
    );
}
 
# trims leading and trailing whitespace
sub trim($)
{
  my $string = shift;
  $string =~ s/^\s+//;
  $string =~ s/\s+$//;
  return $string;
}