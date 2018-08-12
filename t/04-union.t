use v6.c;
use Test;
use Range::SetOps;

my @unions = [
    [ (1..3), (5..6), Set($=(1..3), $=(5..6)) ],
    [ (1..10), (5..6), Set( [$=(1..10)] ) ],
    [ (5..6), (1..10), Set( [$=(1..10)] ) ],
    [ (1..10), (1..10), Set( [$=(1..10)] ) ],
];

for @unions -> [ $a, $b, $expected ] {
    my $got = $a (|) $b;    
    ok so $got ~~ $expected, "{$a.perl} (|) {$b.perl} => {$expected.perl} but got {$got.perl}";
    $got = $a ∪ $b;
    ok so $got ~~ $expected, "{$a.perl} ∪ {$b.perl} => {$expected.perl} but got {$got.perl}";
}

done-testing;
