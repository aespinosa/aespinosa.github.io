---
comments: true
date: 2006-08-28 09:59:55
layout: post
slug: new-phone-motorla-razr-v3r
title: 'New Phone: Motorla Razr V3r'
wordpressid: 5
---

After several years, I dropped my Nokia 3315 phone for the last time. The LCD got busted and the crystals were scattered all over the screen rendering it useless. Theoretically it still works but you have to guess and interpolate what's happening inside the phone based on its initial power up.  
  
Then I went to greenhills and brought this nifty new Motorola Razr V3r. Scouring deeper into the shops gave me a better deal of almost Php 600 less than the original price found in the first few stalls of the shopping complex.  
  
I took a photo of the razr against a white bond paper over an overcast sky. Shooting the phone under clear sky conditions will give better light while maintaining the soft studio effect.  
  
![](http://static.flickr.com/95/219946616_ea3251182e_m.jpg)  
  
I found a few good sites suggesting how to tweak the phone. This includes the explanation of the Motorola Razr file system. The phone is read under Linux kernel 2.4 and 2.6. My personal 2.6.14 kernel has to be rebuilt and added the cdc-acm.o module. For kernel 2.4.31 (the default Slackware 10.2 kernel) the module is called acm.o. With the module installed in my box, I am able to use a standard USB A to USB mini phone to charge it and read the filesystem.   


> $modinfo cdc-acm   
author: Armin Fuerst, Pavel Machek, Johannes Erdfelt, Vojtech Pavlik  
description: USB Abstract Control Model driver for USB modems and ISDN adapters  


For conveniently accesing the filesystem I installed the latest CVS snapshot of moto4lin[1]. It is a Qt-based application that connects to the motorola device via the USB modem drivers for linux.  


> $cvs -d:pserver:anonymous@moto4lin.cvs.sourceforge.net:/cvsroot/moto4lin login  
$cvs -z3 -d:pserver:anonymous@moto4lin.cvs.sourceforge.net:/cvsroot/moto4lin co -P moto4lin  
$qmake  
$make  
$make install  


[1] [http://moto4lin.sourceforge.net](http://moto4lin.sourceforge.net)  
  
  
  
Technorati Tags: [linux](http://technorati.com/tag/linux), [motorola](http://technorati.com/tag/motorola), [razr](http://technorati.com/tag/razr), [phone](http://technorati.com/tag/phone), [synchronization](http://technorati.com/tag/synchronization)
