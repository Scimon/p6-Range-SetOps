[![Build Status](https://travis-ci.org/Scimon/p6-Range-SetOps.svg?branch=master)](https://travis-ci.org/Scimon/p6-Range-SetOps)

NAME
====

Range::SetOps - Provides set operators geared to work on ranges.

SYNOPSIS
========

    use Range::SetOps;
    say 10 (elem) (1.5 .. 15.2);

DESCRIPTION
===========

The standard Set operators work on Ranges by first converting them to lists and then applying the set operations to these lists. But Ranges can also represent a Range of possible values for which this type of comparison does not work well. The Range::SetOps module aims to provide operators based on the Set operators but geared to work on Ranges without list conversion.

IMPLEMENTED OPERATORS
=====================

The following operators have been implemented for continous numerical ranges and also tested on string and date range. They also work on Sets of Ranges like those returned by the (|) or ∪ operators.

  * (elem)

  * ∈

  * ∉

  * (cont)

  * ∋

  * ∌

The following operators already work for continuous Ranges as expected.

  * (<=)

  * ⊆

  * (>=)

  * ⊇

  * (<)

  * ⊂

  * (>)

  * ⊃

  * ⊅

  * ⊄

  * ⊉

  * ⊈

The following Operations will return Sets comprising one or more Ranges. When the Ranges within the Set overlap they will be combined into one larger Range.

  * (|)

  * ∪

AUTHOR
======

Simon Proctor <simon.proctor@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
