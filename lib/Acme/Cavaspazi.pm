package Acme::Cavaspazi;
# ABSTRACT: a simple script to remove spaces from filenames or file contents, but also a tribute to old school robust bioinformatics tools

use 5.012;
use warnings;
require Exporter;
our @ISA = qw(Exporter);

# Export subroutine cavaspazi
our @EXPORT = qw(cavaspazi);

$Acme::Cavaspazi::VERSION = "0.1.0";

sub cavaspazi {
    my @results = ();
    for my $i (@_) {
        my $result = $i;
        $result =~ s/ /_/g;
        push @results, $result;
    }
    # if input is a scalar, return a scalar
    if (@_ == 1) {
        return $results[0];
    } else {
        return @results;
    }
    
}

1;
