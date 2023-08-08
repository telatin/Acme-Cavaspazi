use strict;
use warnings;
use Test::More;
use Data::Dumper;
use_ok 'Acme::Cavaspazi';
use FindBin qw($RealBin);
use File::Spec;

my $data = File::Spec->catfile( $RealBin, "..", "data" );
my $bind  = File::Spec->catfile( $RealBin, "..", "bin" );

ok(-d $data, "Data dir found in $RealBin: $data");
ok(-d $bind, "Bin dir found in $RealBin: $bind");

my $bin  = File::Spec->catfile($bind, 'cavaspazi');

my $cmd = qq($^X $bin  -r -n "$data"/*);
ok(defined $cmd, "Running: $cmd");
my @out = `$cmd`;

ok($? == 0, "Program executed without errors");

for my $item (@out) {
  ok($item =~/^#mv/, "Output starts with #mv: " . substr($item, 0, 20) . "...");
}
ok(scalar @out == 3, "Got two output lines: " . scalar @out);

done_testing();
