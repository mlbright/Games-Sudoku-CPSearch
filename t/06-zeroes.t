#!perl -T

use Test::More tests => 1;
use Games::Sudoku::CPSearch;

my $easy_unsolved
  = "..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.300";
my $easy_solved
  = "483921657967345821251876493548132976729564138136798245372689514814253769695417382";

open my $f, '>', "/tmp/zeroes";
print $f $easy_unsolved;
close($f);
my $o = Games::Sudoku::CPSearch->new('/tmp/zeroes');
$o->solve();
is( $o->solution(), $easy_solved );
