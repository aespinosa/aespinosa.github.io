---
title: Discrete Integrator
mathjax: on
---

Notes on reading p. 39 of J. Hellerstein, et. al.'s *Feedback Control of
Computing Systems* [^1] about "Linear, Time-Invariant Different Equations".


$$ y(k+1) = \sum_{i=0}^k u(i)$$

$$ y(k) = \sum_{i=0}^{k-1} u(i)$$

$$ y(k + 1) = u(k) + \sum_{i=0}^{k-1} u(i)$$

With substitution we can get to Equation 2.3 in the book:

$$ y(k + 1) = u(k) + y(k)$$

[^1]: <https://amzn.com/047126637X>
