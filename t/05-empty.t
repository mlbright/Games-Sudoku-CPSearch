#!perl -T

use Test::More tests => 1;
use Games::Sudoku::CPSearch;

my $empty
  = ".................................................................................";

open my $f, '>', "/tmp/empty";
print $f $empty;
close($f);
my $oempty = Games::Sudoku::CPSearch->new('/tmp/empty');
$oempty->solve();
is( $oempty->_verify( $oempty->solution() ), 1 );
