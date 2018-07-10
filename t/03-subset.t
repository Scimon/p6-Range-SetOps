use v6.c;
use Test;
use Range::SetOps;

my @equal = [
    [ (1..3), (1..3) ],
    [ (1.5..3), (1.5..3) ],
    [ (1..3.2), (1..3.2) ],
    [ (1.5..3.2), (1.5..3.2) ],
    [ ("a".."z"), ("a".."z") ],
    [ (Date.new("2018-01-01")..Date.new("2018-12-31")), (Date.new("2018-01-01")..Date.new("2018-12-31")) ],
];

for @equal -> [ $a, $b ] {
    ok $a == $b, "ok {$a.perl} == {$b.perl}";
}

done-testing;

