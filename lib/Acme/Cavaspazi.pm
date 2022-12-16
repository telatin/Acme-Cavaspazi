package Acme::Cavaspazi;
# ABSTRACT: a simple function to remove spaces from strings or lists of strings

use 5.012;
use warnings;
require Exporter;
our @ISA = qw(Exporter);

# Export subroutine cavaspazi
our @EXPORT = qw(cavaspazi);

$Acme::Cavaspazi::VERSION = "1.0.0";


=head1 SYNOPSIS

  use Acme::Cavaspazi;
  my $input = "with spaces";
  my $filepath = cavaspazi($input);


=head2 cavaspazi()

Remove spaces from the input string or the strings in the input array.

Used in scalar context, returns a scalar. 

  use Acme::Cavaspazi;
  my $input = "with spaces";
  print cavaspazi($input), "\n";

Used in list context, returns a list:

  use Acme::Cavaspazi;
  my @input = ("with spaces", "and more spaces");
  print ":".join(cavaspazi(@input), "\n");

=cut

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

=head1 SEE ALSO

this module ships a binary script called L<cavaspazi> that can be used
to remove spaces from filenames or file contents.

=head1 ACKNOWLEDGEMENTS

This module is a tribute to the resilience of pioneer bioinformaticians
working with Perl to convert files and fix formats.

The bioinformaticians trained by I<Nicola Vitulo> are grateful for the
lack of spaces.

In those foggy times a script called C<cavaspazi.pl> became a pillar
of complex pipelines. It was cool, except it didn't remove spaces.

=cut

"VITULO";
