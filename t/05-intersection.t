use v6.c;
use Test;
use Range::SetOps;

plan 1;

my @intersections = [
    [(3..5),[(1..5),(3..10)]],
];

for @intersections -> [$expect, @list] {
    my $got = [(&)] @list;
    is-deeply( $got, $expect, "[(&)] {@list.perl} == {$expect.perl}" );
}
