---
comments: true
date: 2007-12-07 20:01:34
layout: post
slug: multimeter-recordings-with-the-prologix-gpib-usb-controller
title: Multimeter recordings with the Prologix GPIB-USB controller
wordpressid: 46
categories: Hard Hacks
tags: electronics,engineering,interfacing
---

[![Prologix GPIB-USB controller](http://farm3.static.flickr.com/2159/2092552825_dc74629f33.jpg)](http://www.flickr.com/photos/yecartes/2092552825/)


The department has quite a number of GPIB-interfaceable intstruments but the problem is that we no longer have a workstation with the legacy ISA card slots.  We conducted an archaeology expedition in one of our laboratories and found cards in mint condition!  Deniz Wong of the Chemistry department showed me some of their toys and _their only_ workstation with the interface card.   Even though this machine is very old, it still has great value to their lab because of its capability to instrument with their equipment.

We recently bought two [Prologix v4.2 GPIB-USB controllers](http://prologix.googlepages.com/home).   This removed the need to find legacy workstations to be able to log data.  All we need now are USB ports.  The controller is basically an IEEE 488 to USB B adapter.  Version 2.6 of the Linux kernel has a built in driver for it (ftd_sio).  In my Gutsy workstation, it creates a serial device name "ttyUSB0".  Using serial communications software, I was able to talk to the device.


[![Test setup](http://farm3.static.flickr.com/2304/2092546737_0e4f06e290.jpg)](http://www.flickr.com/photos/yecartes/2092546737/)


To test the controller, I tried to record voltage readings from a 5-18 volt power supply as shown in the Figure above.  The numerical reading below is the current DC level of one of the power supplies made by students in the ECE 21 Workshop class.  The controller was setup in _device mode_ or _listen mode_ which as activated using the "++mode 0" command in the serial terminal.  The [HP 34401A](http://www.home.agilent.com/agilent/product.jspx?cc=US&lc=eng&pageMode=OV&pid=1000001295%3Aepsg%3Apro&ct=PRODUCT&id=1000001295%3Aepsg%3Apro) multimeter was then set to _talk mode_ to send data to the device controller.  According to the manual, the HP-IB address should be set to address 31 to activate talk mode.  HP-IB was also selected as the interface in the settings  instead of the default RS-232.  To simulate fluctuating voltage reading, I swung the resistance knob to vary the data recordings.  Below is a plot of the terminal session:


[![Sample HP 34401A log](http://farm3.static.flickr.com/2012/2092546745_cd1f21c468.jpg)](http://www.flickr.com/photos/yecartes/2092546745/)


The next would be to consider the sampling time in obtaining the data to incorporate a voltage versus time reading.  These recordings will be useful in obtaining the natural response of the circuits.
