use v6.c;
use Test;
use Range::SetOps;

plan 32;

my @unions = [
    [ (1..3), (5..6), Set($=(1..3), $=(5..6)) ],
    [ (1..10), (5..6), Set( [$=(1..10)] ) ],
    [ (5..6), (1..10), Set( [$=(1..10)] ) ],
    [ (1..10), (1..10), Set( [$=(1..10)] ) ],
    [ (1..3), Set( $=(2..7), $=(8..11) ), Set( $=(1..7), $=(8..11) ) ],
    [ (5..8), Set( $=(2..7), $=(9..11) ), Set( $=(2..8), $=(9..11) ) ],
    [ (9..13), Set( $=(2..7), $=(8..11) ), Set( $=(2..7), $=(8..13) ) ],
    [ (6..10), Set( $=(2..7), $=(8..11) ), Set( [$=(2..11)] ) ],
    [ (14..17), Set( $=(2..7), $=(8..11) ), Set( $=(2..7), $=(8..11), $=(14..17) ) ],
    [ Set( $=(2..7), $=(8..11) ), (1..3), Set( $=(1..7), $=(8..11) ) ],
    [ Set( $=(2..7), $=(9..11) ), (5..8), Set( $=(2..8), $=(9..11) ) ],
    [ Set( $=(2..7), $=(8..11) ), (9..13), Set( $=(2..7), $=(8..13) ) ],
    [ Set( $=(2..7), $=(8..11) ), (6..10), Set( [$=(2..11)] ) ],
    [ Set( $=(2..7), $=(8..11) ), (14..17), Set( $=(2..7), $=(8..11), $=(14..17) ) ],
    ];

for @unions -> [ $a, $b, $expected ] {
    my $got = $a (|) $b;    
    is-deeply $got,  $expected, "{$a.perl} (|) {$b.perl} => {$expected.perl} but got {$got.perl}";
    $got = $a ∪ $b;
    is-deeply $got, $expected, "{$a.perl} ∪ {$b.perl} => {$expected.perl} but got {$got.perl}";
}

is-deeply ((2..7) (|) (8..11) (|) (9..13)), Set( $=(2..7), $=(8..13) ), "Chained (|) Union";
is-deeply ([(|)] (2..7), (8..11), (9..13)), Set( $=(2..7), $=(8..13) ), "Meta Op (|) Union";

is-deeply ((2..7) ∪ (8..11) ∪ (9..13)), Set( $=(2..7), $=(8..13) ), "Chained ∪ Union";
is-deeply ([∪] (2..7), (8..11), (9..13)), Set( $=(2..7), $=(8..13) ), "Meta Op ∪ Union";
