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
But Ranges can also represent a Range of possible values for which this type of comparison does not work well.
The Range::SetOps module aims to provide operators based on the Set operators but geared to work on Ranges without list conversion.

=head1 IMPLEMENTED OPERATORS

The following operators have been implemented for continous numerical ranges and also tested on string and date range.

=item (elem)
=item ∈
=item ∉
=item (cont)
=item ∋
=item ∌

The following operators already work for continuous Ranges as expected.

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

The following Operations will return Sets comprising one or more Ranges.
When the Ranges within the Set overlap they will be combined into one larger Range.

=head1 AUTHOR

Simon Proctor <simon.proctor@gmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

subset SetOfRanges of Set where { $_.keys.all ~~ Range };

sub num_elem( \a, Range:D \b --> Bool ) is pure {
    a >= b.min && a <= b.max;
}

sub non_num_elem( \a, Range:D \b --> Bool ) is pure {
    a ge b.min && a le b.max;
}

multi sub infix:<(elem)> (Int:D \a where * ~~ Int, Range:D \b --> Bool) is export is pure { num_elem( a, b ); }
multi sub infix:<(elem)> (Rational:D \a where * ~~ Rational, Range:D \b --> Bool) is export is pure { num_elem( a, b ); }
multi sub infix:<(elem)> (Numeric:D \a, Range:D \b --> Bool) is export is pure { num_elem( a, b ); }
multi sub infix:<(elem)> (Date:D \a, Range:D \b --> Bool) is export is pure { num_elem( a, b); }
multi sub infix:<(elem)> (Str:D \a, Range:D \b --> Bool) is export is pure {
    my \ra = Rat(a);
    if ( defined ra ) {
        num_elem( ra, b )
    } else {
        non_num_elem( a, b );
    }
}
multi sub infix:<(elem)> (\a, SetOfRanges \b --> Bool ) is export is pure {
    so a (elem) b.keys.any;
}    

multi sub infix:<∈> (Int:D \a where * ~~ Int, Range:D \b --> Bool) is export is pure { num_elem( a, b ); }
multi sub infix:<∈> (Rational:D \a where * ~~ Rational, Range:D \b --> Bool) is export is pure { num_elem( a, b ); }
multi sub infix:<∈> (Numeric:D \a, Range:D \b --> Bool) is export is pure { num_elem( a, b ); }
multi sub infix:<∈> (Date:D \a, Range:D \b --> Bool) is export is pure { num_elem( a, b); }
multi sub infix:<∈> (Str:D \a, Range:D \b --> Bool) is export is pure {
    my \ra = Rat(a);
    if ( defined ra ) {
        num_elem( ra, b );
    } else {
        non_num_elem( a, b );
    }
}
multi sub infix:<∈> (\a, SetOfRanges \b --> Bool ) is export is pure {
    so a (elem) b.keys.any;
}    


multi sub infix:<∉> (Any:D \a, Range:D \b --> Bool) is export is pure { a !(elem) b; }
multi sub infix:<(cont)> (Range:D \a, Any:D \b --> Bool ) is export is pure  { b (elem) a; }
multi sub infix:<∋> (Range:D \a, Any:D \b --> Bool ) is export is pure { b (elem) a; }
multi sub infix:<∌> (Range:D \a, Any:D \b --> Bool ) is export is pure { b !(elem) a; }

multi sub infix:<∉> (Any:D \a, SetOfRanges:D \b --> Bool) is export is pure { a !(elem) b; }
multi sub infix:<(cont)> (SetOfRanges:D \a, Any:D \b --> Bool ) is export is pure  { b (elem) a; }
multi sub infix:<∋> (SetOfRanges:D \a, Any:D \b --> Bool ) is export is pure { b (elem) a; }
multi sub infix:<∌> (SetOfRanges:D \a, Any:D \b --> Bool ) is export is pure { b !(elem) a; }


multi sub infix:<(|)> (Range:D $a, Range $b where $a (<=) $b --> Set ) is export is pure {
    Set( \($b) );
}
multi sub infix:<(|)> (Range:D $a, Range $b where $b (<) $a --> Set ) is export is pure {
    Set( \($a) );
}
multi sub infix:<(|)> (Range:D $a, Range $b --> Set ) is export is pure {
    Set( $a, $b );
}
multi sub infix:<∪> (Range:D $a, Range $b --> Set ) is export is pure {
    $a (|) $b;
}

multi sub infix:<(&)> (Range:D $a, Range:D $b --> Range ) is export {
    3..5;
}
