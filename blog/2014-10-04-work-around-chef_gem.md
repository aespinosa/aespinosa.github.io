---
title: Workaround chef_gem
---

## Problem

* chef_gem is done at compile time and downloads the internet by default.
* chef server is by default an artifact server

## Idea

Convert the rubygem into a library cookbook as a workaround
