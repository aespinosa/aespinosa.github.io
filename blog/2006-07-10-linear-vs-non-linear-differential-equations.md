---
comments: true
date: 2006-07-10 10:40:13
layout: post
slug: linear-vs-non-linear-differential-equations
title: Linear vs Non-linear differential equations
wordpressid: 3
categories: Theoretical Hacks
---

As students, sometimes you simply drive straight into solving the equation not noticing the behavior of a function.  Then our teacher in control systems, stressed the importance of knowing the behavior of the equation that you have setup.  The analysis of the form can save you tons of design debugging in detecting system instabilities and such.

We were given a simple homework to know what is a _linear_ differential equation.  First I thought of functions of the form
$latex \displaystyle y = mx + b.$

But this is a _linear equation. _I thought this is the definition until my understanding was shattered with an earlier lecture.  Now based on a simple google search I found this nifty site[1]


> Let us put the two ideas together.  A "linear differential equation" is one
in which the unknowns y, y', etc. are never raised to a power more than 1,
nor are they in the denominator of a fraction, nor are they inside another
function such as sin.
Also  y times y' is not allowed, because that would mean two unknowns
multiplied together and in a sense it is a power 2 of unknowns.  In other
words, the simplest type of linear differential equations must be of the
form:

$latex \displaystyle y' = a(x) y + b(x) $

