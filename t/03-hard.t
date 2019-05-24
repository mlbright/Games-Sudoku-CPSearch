#!perl -T

use Test::More tests => 1;
use Games::Sudoku::CPSearch;

my $hard_unsolved
  = "4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......";
my $hard_solved
  = "417369825632158947958724316825437169791586432346912758289643571573291684164875293";
open my $fh, '>', '/tmp/hard';
print $fh $hard_unsolved;
close $fh;

my $ohard = Games::Sudoku::CPSearch->new('/tmp/hard');
$ohard->solve();
is( $ohard->solution(), $hard_solved );
