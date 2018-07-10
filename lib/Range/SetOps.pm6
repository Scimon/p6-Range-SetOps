use v6.c;
unit class Range::SetOps:ver<0.0.1>:auth<cpan:SCIMON>;

=begin pod

=head1 NAME

Range::SetOps - Provides set operators geared to work on ranges.

=head1 SYNOPSIS

  use Range::SetOps;
  say 10 (elem) (1.5 .. 15.2);

=head1 DESCRIPTION

The standard Set operators work on Ranges by first converting them to lists and then applying the set operations to these lists.
But Ranges can also represent a Range of possibly values for ehich this type of comparison does not work well.
The Range::SetOps module aims to provide operators based on the Set operators but geared to work on Ranges without list conversion.

=head1 IMPLEMENTED OPERATORS

=end pod

=begin pod

=head1 (elem) and ∈ 

Both implemented for Int's and Rationals in both Int based and Rational ranges. Also works with Date and String based ranges.

=end pod

multi sub infix:<(elem)> (Int:D() $a where * ~~ Int, Range:D $b --> Bool) is export {
    $a >= $b.min && $a <= $b.max;
}

multi sub infix:<(elem)> (Rational:D() $a where * ~~ Rational, Range:D $b --> Bool) is export {
    $a >= $b.min && $a <= $b.max;
}

multi sub infix:<(elem)> ($a, Range:D $b --> Bool) is export {
    $a ge $b.min && $a le $b.max;
}

multi sub infix:<∈> (Int:D() $a where * ~~ Int, Range:D $b --> Bool) is export {
    $a (elem) $b;
}

multi sub infix:<∈> ($a, Range:D $b --> Bool) is export {
    $a (elem) $b;
}

=begin pod

=head1 AUTHOR

Simon Proctor <simon.proctor@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
