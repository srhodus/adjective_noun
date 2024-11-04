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

# my $adj_file = "adjectives.txt";
# open my $f0, $adj_file or die "Couldn't open $adj_file";
# while (my $tmp = <$f0>) {
#     push @adj_list, trim $tmp;
# }
# 
# my $noun_file = "nouns.txt";
# open my $f1, $noun_file or die "Couldn't open $noun_file";
# while (my $tmp = <$f1>) {
#     push @noun_list, trim $tmp;
# }

my $adj = splice @adj_list, rand @adj_list, 1;
my $noun = splice @noun_list, rand @noun_list, 1;

print "$adj $noun\n";
