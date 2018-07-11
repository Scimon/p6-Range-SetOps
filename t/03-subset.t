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
    ok $b == $a, "ok {$b.perl} == {$a.perl}";
    ok $a (<=) $b, "ok {$a.perl} (<=) {$b.perl}";
    ok $b (<=) $a, "ok {$b.perl} (<=) {$a.perl}";
    ok $a ⊆ $b, "ok {$a.perl} ⊆ {$b.perl}";
    ok $b ⊆ $a, "ok {$b.perl} ⊆ {$a.perl}";
    ok $a (>=) $b, "ok {$a.perl} (>=) {$b.perl}";
    ok $b (>=) $a, "ok {$b.perl} (>=) {$a.perl}";
    ok $a ⊇ $b, "ok {$a.perl} ⊇ {$b.perl}";
    ok $b ⊇ $a, "ok {$b.perl} ⊇ {$a.perl}";
}

my @subsets = [
      [ (2..3), (1..3) ],
      [ (2.5..3), (1.5..3) ],
      [ (1..2.2), (1..3.2) ],
      [ (2.5..3.1), (1.5..3.2) ],
      [ ("f".."t"), ("a".."z") ],
      [ (Date.new("2018-02-01")..Date.new("2018-10-09")), (Date.new("2018-01-01")..Date.new("2018-12-31")) ],

];

for @subsets -> [ $a, $b ] {
    ok $a (<) $b, "ok {$a.perl} (<) {$b.perl}";
    ok $a ⊂ $b, "ok {$a.perl} (<) {$b.perl}";
    ok $a (<=) $b, "ok {$a.perl} (<=) {$b.perl}";
    ok $a ⊆ $b, "ok {$a.perl} ⊆ {$b.perl}";
    ok $b !(<) $a, "ok {$b.perl} !(<) {$a.perl}";
    ok $b ⊄ $a, "ok {$b.perl} ⊄ {$a.perl}";
    ok $b (>) $a, "ok {$b.perl} (>) {$a.perl}";
    ok $b ⊃ $a, "ok {$b.perl} ⊃ {$a.perl}";
    ok $b (>=) $a, "ok {$b.perl} (>=) {$a.perl}";
    ok $b ⊇ $a, "ok {$b.perl} ⊇ {$a.perl}";    
    ok $a !(>) $b, "ok {$a.perl} !(>) {$b.perl}";
    ok $a ⊅ $b, "ok {$a.perl} ⊅  {$b.perl}";
}

my @no-intersection = [
      [ (2..3), (4..5) ],
      [ (2.5..3), (3.5..5) ],
      [ (1..2.2), (3..3.2) ],
      [ (2.5..3.1), (3.2..5.2) ],
      [ ("a".."t"), ("s".."z") ],
      [ (Date.new("2018-02-01")..Date.new("2018-10-09")), (Date.new("2018-10-10")..Date.new("2018-12-31")) ],
    
];

for @no-intersection -> [ $a, $b ] {
    ok $a !(<) $b, "ok {$a.perl} !(<) {$b.perl}";
    ok $a ⊄ $b, "ok {$a.perl} ⊄ {$b.perl}";
    ok $b !(<) $a, "ok {$b.perl} !(<) {$a.perl}";
    ok $b ⊄ $a, "ok {$b.perl} ⊄ {$a.perl}";
    ok $a !(>) $b, "ok {$a.perl} !(>) {$b.perl}";
    ok $a ⊅ $b, "ok {$a.perl} ⊅  {$b.perl}";
    ok $b !(>) $a, "ok {$b.perl} !(>) {$a.perl}";
    ok $b ⊅ $a, "ok {$b.perl} ⊅  {$a.perl}";
    ok $a !(<=) $b, "ok {$a.perl} !(<=) {$b.perl}";
    ok $a ⊉ $b, "ok {$a.perl} ⊉ {$b.perl}";
    ok $b !(<=) $a, "ok {$b.perl} !(<=) {$a.perl}";
    ok $b ⊉ $a, "ok {$b.perl} ⊉ {$a.perl}";
    ok $a !(>=) $b, "ok {$a.perl} !(>=) {$b.perl}";
    ok $a ⊈ $b, "ok {$a.perl} ⊈ {$b.perl}";
    ok $b !(>=) $a, "ok {$b.perl} !(>=) {$a.perl}";
    ok $b ⊈ $a, "ok {$b.perl} ⊈ {$a.perl}";
}


done-testing;

