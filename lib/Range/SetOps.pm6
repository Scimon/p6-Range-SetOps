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

The following operators have been implemented for continous numerical ranges and also tested on string and date range.

=item (elem)
=item ∈
=item ∉
=item (cont)
=item ∋
=item ∌

The following operators already work for continuous Ranges.

=item (<=)
=item ⊆
=item (>=)
=item ⊇
=item (<)
=item ⊂
=item (>)
=item ⊃
=item ⊅
=item ⊄
=item ⊉
=item ⊈

=head1 AUTHOR

Simon Proctor <simon.proctor@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

sub num_elem( $a, Range:D $b --> Bool ) {
    $a >= $b.min && $a <= $b.max;
}

sub non_num_elem( $a, Range:D $b --> Bool ) {
    $a ge $b.min && $a le $b.max;
}

multi sub infix:<(elem)> (Int:D $a where * ~~ Int, Range:D $b --> Bool) is export { num_elem( $a, $b ); }
multi sub infix:<(elem)> (Rational:D $a where * ~~ Rational, Range:D $b --> Bool) is export { num_elem( $a, $b ); }
multi sub infix:<(elem)> (Numeric:D $a, Range:D $b --> Bool) is export { num_elem( $a, $b ); }
multi sub infix:<(elem)> (Date:D $a, Range:D $b --> Bool) is export { num_elem( $a, $b); }
multi sub infix:<(elem)> (Str:D $a, Range:D $b --> Bool) is export {
    my $ra = Rat($a);
    if ( defined $ra ) {
        num_elem( $ra, $b )
    } else {
        non_num_elem( $a, $b );
    }
}

multi sub infix:<∈> (Int:D $a where * ~~ Int, Range:D $b --> Bool) is export { num_elem( $a, $b ); }
multi sub infix:<∈> (Rational:D $a where * ~~ Rational, Range:D $b --> Bool) is export { num_elem( $a, $b ); }
multi sub infix:<∈> (Numeric:D $a, Range:D $b --> Bool) is export { num_elem( $a, $b ); }
multi sub infix:<∈> (Date:D $a, Range:D $b --> Bool) is export { num_elem( $a, $b); }
multi sub infix:<∈> (Str:D $a, Range:D $b --> Bool) is export {
    my $ra = Rat($a);
    if ( defined $ra ) {
        num_elem( $ra, $b );
    } else {
        non_num_elem( $a, $b );
    }
}

multi sub infix:<∉> (Any:D $a, Range:D $b --> Bool) is export { $a !(elem) $b; }
multi sub infix:<(cont)> (Range:D $a, Any:D $b --> Bool ) is export { $b (elem) $a; }
multi sub infix:<∋> (Range:D $a, Any:D $b --> Bool ) is export { $b (elem) $a; }
multi sub infix:<∌> (Range:D $a, Any:D $b --> Bool ) is export { $b !(elem) $a; }

multi sub infix:<(&)> (Range:D $a, Range:D $b --> Range ) is export {
    3..5;
}
