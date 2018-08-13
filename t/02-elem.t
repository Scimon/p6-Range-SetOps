use v6.c;
use Test;
use Range::SetOps;

plan 344;

my @ok = [
    [5,(1..10)], [5,(2.5..10)], [5,(2..10.5)],
    [5.5,(1..10)], [5.5,(2.5..10)], [5.5,(2.7..10)], [5.5,(2.5..10.8)], [5.5,(2.7..10.8)],
    ["a",("a".."z")],
    [Date.new("2018-03-06"),(Date.new("2018-01-01")..Date.new("2018-12-31"))],
    ["5",(1..10)], ["5",(2.5..10)], ["5",(2..10.5)],
    ["5.5",(1..10)], ["5.5",(2.5..10)], ["5.5",(2.7..10)], ["5.5",(2.5..10.8)], ["5.5",(2.7..10.8)],
    [5,Set($=(1..3),$=(5..6))],[5,Set($=(1..3),$=(4.5..6))],[5,Set($=(1..3),$=(5..6.7))],
    [5.5,Set($=(1..3),$=(5..6))],[5.5,Set($=(1..3),$=(5.2..6))],[5.5,Set($=(1..3),$=(5..6.7))],
    [5,Set($=(1..3),$=(3.2..5.4),$=(6..10.7))],
];

for @ok -> [ $test, $range ] {
    ok $test (elem) $range, "ok {$test.perl} (elem) {$range.gist}";
    ok $test ∈ $range, "ok {$test.perl} ∈ {$range.gist}";
    nok $test !(elem) $range, "nok {$test.perl} !(elem) {$range.gist}";
    nok $test ∉ $range, "nok {$test.perl} ∉ {$range.gist}";

    ok $range (cont) $test, "ok {$range.gist} (cont) {$test.perl}";
    ok $range ∋ $test, "ok {$range.gist} ∋ {$test.perl}";
    nok $range !(cont) $test, "nok {$range.gist} !(cont) {$test.perl}";
    nok $range ∌ $test, "nok {$range.gist} ∌ {$test.perl}";
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

    nok $range (cont) $test, "ok {$range.gist} (cont) {$test.perl}";
    nok $range ∋ $test, "ok {$range.gist} ∋ {$test.perl}";
    ok $range !(cont) $test, "nok {$range.gist} !(cont) {$test.perl}";
    ok $range ∌ $test, "nok {$range.gist} ∌ {$test.perl}";
}

