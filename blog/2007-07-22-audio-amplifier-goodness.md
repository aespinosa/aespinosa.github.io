---
comments: true
date: 2007-07-22 00:27:27
layout: post
slug: audio-amplifier-goodness
title: Audio amplifier goodness
wordpressid: 23
categories: Hard Hacks,Teaching
---

For the third and fourth activity in my TCOM 121.2 Telecommunications laboratory class, I asked the students to prepare  a 200 gain (46 dB) audio amplifier using the [LM386](http://www.national.com/mpf/LM/LM386.html) with a bandwidth of 20-20kHz.

I required the students to perform simulations by creating a SPICE netlist.   The learning curve required is very steep to meet a 1-2 week deadline for performing the activity.  I pointed them to the [sci.electronics.cad](http://groups.google.com/group/sci.electronics.cad) Usenet newsgroup to search from the SPICE .subckt model since the IC cannot be found by default in the library components of [MultiSim](http://www.ni.com/academic/multisim.htm) or Electronics Workbench.  There were sample demonstrations on how to generate the netlist and use the model file using LTSpice in the laboratory.  My classes' were very resourceful.  To accomodate the steep learning curve, they were able to find an LTSpice symbol associated with the LM386 subckt model and was able to generate simulations using the conventional schematic capture method.

They implemented their audio amplifier circuits on a standard issued prototyping breadboard.  Some were able to get gains of up to 190+ but others are still struggling to exceed a 3dB gain (hence the lab extension).  After reaching the 43-46 dB gain milestone, they celebrated their accomplishment by playing with the circuit.  Most of the students plugged the output of the amplifier to a speaker.  Thus sounds were produced based on the frequency input in the function generator.  One of my students, Dale Dy played a rendition of "Happy Birthday" using various frequencies from our signal generator and his groups' LM386 Audio Amplifier:



[youtube=http://www.youtube.com/watch?v=IMfZtBkPvDs]




Technorati Tags: [LM386](http://technorati.com/tag/LM386), [audio amplifier](http://technorati.com/tag/audio amplifier), [circuits](http://technorati.com/tag/circuits), [telecommunications](http://technorati.com/tag/telecommunications)
