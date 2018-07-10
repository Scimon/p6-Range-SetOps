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

The standard Set operators work on Ranges by first converting them to lists and then applying the set operations to these lists. But Ranges can also represent a Range of possibly values for ehich this type of comparison does not work well. The Range::SetOps module aims to provide operators based on the Set operators but geared to work on Ranges without list conversion.

IMPLEMENTED OPERATORS
=====================

(elem), ∈ and ∉
===============

Both implemented for Int's and Rationals in both Int based and Rational ranges. Also works with Date and String based ranges.

AUTHOR
======

Simon Proctor <simon.proctor@gmail.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Simon Proctor

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
