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

# Create a directory "this is a dir" in the temporary directory
my $dirname = "$tempdir/this is a dir";
mkdir $dirname or die "Can't mkdir $dirname: $!";

my $cmd = "$^X $RealBin/../bin/cavaspazi -r --verbose $tempdir/*";

ok(-e $filename, "File $filename exists");
ok(-e $dirname, "Directory $dirname exists");

my $exit = system($cmd);
ok($exit == 0, "Command $cmd exited with 0");

my @files = glob("$tempdir/*");
for my $file (@files) {
    ok(!($file =~ / /), "File $file does not contain spaces");
}

done_testing();