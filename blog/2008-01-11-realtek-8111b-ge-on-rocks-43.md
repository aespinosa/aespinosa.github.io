---
comments: true
date: 2008-01-11 16:05:15
layout: post
slug: realtek-8111b-ge-on-rocks-43
title: Realtek 8111B GE on Rocks 4.3
wordpressid: 49
tags: clustering,linux
---

I am currently building a new Beowulf cluster using [Rocks 4.3](http://www.rocksclusters.org).  It uses the linux kernel version 2.6.9-55EL.  After building the master node, it is time to install on the compute nodes.  In normal conditions where everything is smooth, the Rocks kickstart system boots the compute nodes from the network via  a dhcp-tftp-kickstart combination.  But our Rocks cannot load the network driver.  Upon identification of the driver, I downloaded the Realtek 8111B (r8168) from the [vendor's site](http://http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PNid=13&PFid=5&Level=5&Conn=4&DownTypeID=3&GetDown=false#2).  I followed the instructions on how to add a custom device driver to the kernel in the rocks documentation. It basically creates an initrd.img file where the kernel modules is installed.  But the boot sequence does not load the kernel module properly.  I had a couple of email exchanges with Greg Bruno, one of Rock's developers over the mailing list to diagnose the problem.  But building a custom kernel module for the _current_ kernel have not solved the missing module.

Upon further investigation, the driver for my NIC was incorporated into the r8169 module of the vanilla kernel.  So I downloaded kernel version 2.6.23.13.  First the kernel*.rpm packages must be built and installed in the /home/install rocks repository.  Next, the rocks-boot package should be rebuilt in order to incorporate the new kernel.  But since Centos uses an older version of the kernel, the hardware id of my NIC is not associated to the r8169 kernel module.  So I created a dummy device driver in the rocks-boot repository.  In the Makefile, I removed the source file to be compiled and simply added in an entry for my driver in the _pcimap_.

Now my compute nodes was able to grab the kickstart file and install an entire operating system in 10 minutes!
