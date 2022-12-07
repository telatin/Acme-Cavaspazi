use strict;
use warnings;
use FindBin qw($RealBin);
use Test::More;
use File::Temp qw/ tempfile tempdir /;



# Create a temporary directory
my $tempdir = tempdir( CLEANUP => 1 );

# Create a file called "this is a test" in the temporary directory
my $filename = "$tempdir/this is a test";
open my $fh, '>', $filename or die "Can't open $filename: $!";

print $fh "Hello, world!\nThere are spaces in this file.\n";
close $fh;

my $cmd = "$^X $RealBin/../bin/cavaspazi -s --verbose $tempdir/*";

ok(-e $filename, "File $filename exists");

my $exit = system($cmd);
ok($exit == 0, "Command $cmd exited with 0");

my @files = glob("$tempdir/*");
for my $file (@files) {
    open my $fh, '<', $file or die "Can't open $file: $!";
    my $content = do { local $/; <$fh> };
    close $fh;
    ok(($content !~ / /), "File $file does not contain spaces: $content");
}

done_testing();