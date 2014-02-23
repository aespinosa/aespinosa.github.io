---
comments: true
date: 2012-05-30 01:55:35
layout: post
slug: behavior-driven-development-of-research-code
title: Behavior-driven development of research code
wordpressid: 279
categories: Soft Hacks,Theoretical Hacks
tags: BDD,programming,science
---

I've been reading a lot of papers on optimizing DAG-based workflows and supporting papers on scheduling for my research. Most of the time, I just characterized existing software code on existing systems. This is my first time writing scheduler code from scratch. I started by [programming by wishful thinking](http://pragprog.com/book/bmsft/everyday-scripting-with-ruby) but got stumped on how a scheduler workflow actually looks like.

In parallel, I have been reading the [The Cucumber Book](http://pragprog.com/book/hwcuc/the-cucumber-book) for use in a [startup I'm bootstrapping](http://www.wikonec.com) with some friends. I thought that maybe it can help my graduate thought process as well. So I decided to drive my scientific-methodish thinking on a Gherkin file. So here it goes:


    
    
    Feature: Pipeline workflow optimizations
      We hypothesize that a optimizing a pipeline will have a better load balance
      than a data-aware scheduler.
    
      Scenario: Load balance comparison of DAG optimization and data-aware scheduler
        Given A pipeline workload with parametarized data
        """
        1->a->1.1->a.a->1.2
        2->b->2.1->b.a->2.2
        """
        When We obtain the load from a data-aware scheduler
        And We obtain the load from the DAG-optimized version
        Then DAG-optimized load is more balanced
    



Here I used the "Then" clause to describe my hypothesis and the "Given" and "When" clauses to describe the experiment that attempts to verify the hypothesis. In my BDD thought process based on the chapter, "Working with Legacy Code", if "Then" succeeds we accept the hypothesis else we reject the hypothesis and write new Given and When steps.

If you take a look at my [Git commit history](https://github.com/aespinosa/dag-optimizations/commits/master), I wrote a lower-level .feature file first that describes how a data-aware schedule should work. Taking a short walk and looking back at my Gherkin features, my 'stakeholder hat' started to kick in when I read the features again. Hopefully I'm [Cuking from the outside](http://blog.mattwynne.net/2010/08/31/outside-in-vs-inside-out-comparing-tdd-approaches/) correctly.

