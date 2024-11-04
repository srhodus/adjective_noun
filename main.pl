use strict;
use warnings;

sub trim {
    (my $s = $_[0]) =~ s/^\s+|\s+$//g;
    return $s;
}

sub read_file {
    my @list;
    my ($fn) = @_;
    open my $fh, $fn or die "Couldn't open $fn";
    while (my $tmp = <$fh>) {
        push @list, trim $tmp;
    }
    return @list;
}

my @adj_list = read_file "adjectives.txt";
my @noun_list = read_file "nouns.txt";

my $adj = splice @adj_list, rand @adj_list, 1;
my $noun = splice @noun_list, rand @noun_list, 1;

print "$adj $noun\n";
