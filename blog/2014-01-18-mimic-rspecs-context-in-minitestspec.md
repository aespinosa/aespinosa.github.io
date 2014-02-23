---
comments: true
date: 2014-01-18 12:25:06
layout: post
slug: mimic-rspecs-context-in-minitestspec
title: Mimic rspec's "context" in minitest/spec
wordpressid: 352
---

I like spec-style tests as you can describe the scenarios of a test in a more structured manner.  However, I love the xUnit family's assertion calls.  Here's a small helper to create the describe => context synonym:


    def context(*args, &block)
      describe(*args, &block)
    end
