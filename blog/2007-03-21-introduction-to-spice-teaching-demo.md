---
comments: true
date: 2007-03-21 01:01:08
layout: post
slug: introduction-to-spice-teaching-demo
title: 'Introduction to SPICE: teaching demo'
wordpressid: 9
categories: Theoretical Hacks
---

I applied a couple of weeks ago to join the faculty of the [ECCE Department](http://www.ateneo.edu/index.php?p=1552) in [Ateneo de Manila](http://www.ateneo.edu). For my demo teaching class, I decided to give a short lecture on using SPICE for DC circuit analsysis of simple resistor networks.   
  
Lecture Prerequisites:  


  1. Familiarity with basic electronic concepts. The topics for this introduction will contain DC analysis of passive devices (e.g. resistors, inductors, capacitors). A short lecture on basic circuit analysis might be included if I am able to obtain a copy of [Electric Circuit Analysis](http://eu.wiley.com/WileyCDA/WileyTitle/productCd-0471365718.html) by Johnson and Johnson  

  2. Minor background on operating a CLI (command-line-interface) environment. The lecture will demonstrate the use of ngspice [1] on a Linux terminal.  

  
SPICE stands for "Simulation Program with Integrated Circuit Emphasis". Most simulation tools such as Electronic WorkBench, MultiSim and LTSpice generate SPICE code from the schematics diagrams that were drawn by the designer. For a quick overview of SPICE here, is a short description from Wikipedia [1]:  


> Integrated circuits, unlike board-level designs composed of discrete parts, are impossible to [breadboard](http://en.wikipedia.org/wiki/Breadboard) before manufacture. Further, the high costs of photolithographic masks and other manufacturing prerequisites make it essential to design the circuit to be as close to perfect as possible before the integrated circuit is first built. Simulating the circuit with SPICE is the industry-standard way to verify circuit operation at the transistor level before committing to manufacturing an integrated circuit.
> 
> Board-level designs can often be breadboarded, but designers may want more information about the circuit than is available from a single mock-up. For instance, performance is affected by component manufacturing tolerances and it is helpful for designers to simulate with SPICE to predict the effect of variations of those values. Even with a breadboard, some aspects may not be accurate compared to the final printed wiring board, such as parasitic resistances and capacitances. In these cases it is common to perform [Monte Carlo](http://en.wikipedia.org/wiki/Monte_Carlo_method) simulations using SPICE, a task which is impractical using calculations by hand.
> 
> Circuit simulation programs, of which SPICE and derivatives are the most prominent, take a text [netlist](http://en.wikipedia.org/wiki/Netlist) describing the circuit elements ([transistors](http://en.wikipedia.org/wiki/Transistors), [resistors](http://en.wikipedia.org/wiki/Resistors), [capacitors](http://en.wikipedia.org/wiki/Capacitors), etc.) and their connections, and translate this description into equations to be solved. The general equations produced are nonlinear [differential algebraic equations](http://en.wikipedia.org/wiki/Differential_algebraic_equation) which are solved using [implicit integration methods](http://en.wikipedia.org/w/index.php?title=Implicit_integration_methods&action=edit), [Newton's method](http://en.wikipedia.org/wiki/Newton%27s_method) and [sparse matrix](http://en.wikipedia.org/wiki/Sparse_matrix) techniques.  


Materials will be posted later on (I hope). The class will be held on March 21, 2007 (GMT+0800) in Faura Hall Rm 319 (see [my Google Calendar](http://www.google.com/calendar/embed?src=yecartes%40gmail.com))  
  
[1]"SPICE." _Wikipedia, the free encyclopedia. _[http://en.wikipedia.org/wiki/SPICE](http://en.wikipedia.org/wiki/SPICE)  
[2] _Ngspice circuit simulator. _http://www.ngspice.org  
  
  
Technorati Tags: [spice](http://technorati.com/tag/spice), [simulation](http://technorati.com/tag/simulation), [circuit analysis](http://technorati.com/tag/circuit%20analysis), [electronics](http://technorati.com/tag/electronics), [ateneo ecce](http://technorati.com/tag/ateneo%20ecce)
