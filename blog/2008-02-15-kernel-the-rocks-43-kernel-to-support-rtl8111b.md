---
comments: true
date: 2008-02-15 11:04:40
layout: post
slug: kernel-the-rocks-43-kernel-to-support-rtl8111b
title: Rocks-4.3 kernel to support RTL8111b
wordpressid: 55
tags: clustering,linux
---

To [Beshr](http://allan.88-mph.net/blog/entry/realtek-8111b-ge-on-rocks-43/#comment-9631):

The vanilla install of Rockscluster 4.3 uses version 2.6.9-55EL of the linux kernel.  Native support for the Realtek 8111B (r8168) did not come until 2.6.19.xx.  I downloaded 2.6.23.13 from [kernel.org](http://kernel.org). After rebuilding the kernel, you have to enable the kernel to map the hardware ID of the device to the correct module (r8169).  Here is an archive of the files that  I used to build the driver:

[rocks-boot-drivers.tar.gz](http://ohm.ecce.admu.edu.ph/%7Eaespinosa/rocksclusters/rocks-boot-drivers.tar.gz): I added the r8168 directory and modified the _subdirs_ file to build this module for the kernel. It actually does not build anything since there are no entries in the SOURCE variable of the Makefile. Extract this tarball to your Rocks CVS tree ($ROCKS-SRC-ROOT/src/roll/kernel/src/rocks-boot/enterprise/4/images) The following entry was added to _drivers/r8168/_:

`  
0x10ec  0x8168  "r8169" "RealTek RTL8168B/8111B, RTL8168C/8111C Gigabit Ethernet controller  
`

Where _0x10ec 0x8168_ is the hardware ID of my GigE controller.

Then I followed the instructions [_Creating a Custom Kernel RPM_](http://www.rocksclusters.org/rocks-documentation/4.3/customization-kernel.html) and _[Adding a Device Driver](http://www.rocksclusters.org/rocks-documentation/4.3/customization-driver.html)_ of the _User Guide_.

Good luck in building your cluster!
