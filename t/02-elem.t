use v6.c;
use Test;
use Range::SetOps;

my @ok = [
    [5,(1..10)], [5,(2.5..10)], [5,(2..10.5)],
    [5.5,(1..10)], [5.5,(2.5..10)], [5.5,(2.7..10)], [5.5,(2.5..10.8)], [5.5,(2.7..10.8)],
    ["a",("a".."z")],
    [Date.new("2018-03-06"),(Date.new("2018-01-01")..Date.new("2018-12-31"))],
    ["5",(1..10)], ["5",(2.5..10)], ["5",(2..10.5)],
    ["5.5",(1..10)], ["5.5",(2.5..10)], ["5.5",(2.7..10)], ["5.5",(2.5..10.8)], ["5.5",(2.7..10.8)],
];

for @ok -> [ $test, $range ] {
    ok $test (elem) $range, "ok {$test.perl} (elem) {$range.gist}";
    ok $test ∈ $range, "ok {$test.perl} ∈ {$range.gist}";
    nok $test !(elem) $range, "nok {$test.perl} !(elem) {$range}";
    nok $test ∉ $range, "nok {$test.perl} ∉ {$range.gist}";

}

my @nok = [
    [0,(1..10)], [0,(2.5..10)], [0,(2..10.5)],
    [0.5,(1..10)], [0.5,(2.5..10)], [0.5,(2.7..10)], [0.5,(2.5..10.8)], [0.5,(2.7..10.8)],
    ["A",("a".."z")],
    [Date.new("2017-03-06"),(Date.new("2018-01-01")..Date.new("2018-12-31"))],
    ["0",(1..10)], ["0",(2.5..10)], ["0",(2..10.5)],
    ["0.5",(1..10)], ["0.5",(2.5..10)], ["0.5",(2.7..10)], ["0.5",(2.5..10.8)], ["0.5",(2.7..10.8)],
];

for @nok -> [ $test, $range ] {
    nok $test (elem) $range, "nok {$test.perl} (elem) {$range.gist}";
    nok $test ∈ $range, "nok {$test.perl} ∈ {$range.gist}";
    ok $test !(elem) $range, "ok {$test.perl} !(elem) {$range}";
    ok $test ∉ $range, "ok {$test.perl} ∈ {$range.gist}";
}


done-testing;
