use v6.c;
use Test;
use Range::SetOps;

#plan 1;

my @intersections = [
    [[(1..5),(3..10)],Set([$(3..5)])],
    [[(1..3),(4..10)],Set.new()],
    [[(1..3),Set($(1..7),$(2..3))],Set([$(2..3)])],
];

for @intersections -> [@list, $expect] {
    my $got = [(&)] @list;
    is-deeply( $got, $expect, "[(&)] {@list.perl} == {$expect.perl}" );
    $got = [∩] @list;
    is-deeply( $got, $expect, "[∩] {@list.perl} == {$expect.perl}" );
}

done-testing;
