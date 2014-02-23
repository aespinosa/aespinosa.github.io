---
comments: true
date: 2007-08-20 20:17:44
layout: post
slug: building-a-12-terabyte-server
title: Building a 1.2 Terabyte server
wordpressid: 27
categories: Hard Hacks
---


At last after several months of processing paperwork through the Purchasing Office, our 1.2 terabyte Beowulf cluster server has finally arrived!  This will be used to replace our recently decommissioned Beowulf cluster deployed last 2001.  It will serve the scientific community of Ateneo de Manila for various numerically intensive problems like bioinformatics, climate modeling, gellation of natural products, coding theory, etc.  The server uses  Promise FastTrak  SX8300 raid controller to be able to create a RAID 5 image of the 6 320 Gb hard disks.  The picture below shows the 6 channel hot swap bay:






[![6 driver hotswap bay](http://farm2.static.flickr.com/1221/1181984796_f8b3324eb1_m.jpg)](http://www.flickr.com/photos/yecartes/1181984796/)




We were having problems in creating the RAID image during the first few days of our installation.  I called the vendor's supplier, PC Trends for basic troubleshooting and support.  They were very responsive with our concerns and replaced our controller with a new one in their site visit.  Now I was able to succesfully create a RAID array (called an LD device in the FastTrak manual).




The next step is installing the operating system itself.  We used the [Rocksclusters system](http://www.rocksclusters.org) [1] developed at the San Diego Supercomputing Center.  I downloaded their latest version, v. 4.3 Mars Hill.  Their solution based based on CentOS 4.4 which in turn is a rebuild of Redhat EL 4 update 4.  In order for the OS to recognize the images, drivers from RAID cd must be installed.  Unfortunately they only built disk drivers (dd images) for the first release of Redhat EL.  Issuing a "frontend dd" on the isolinux boot prompt was not able to successfully recognized this driver disk since they have different update version of the 2.6.9 kernel.   Thus I have to first install the OS without recognizing the RAID device, and then build a disk driver from it using the [Partial Linux source code](http://www.promise.com/upload/Support/Driver/2_partialb14.tgz) driver.




Building the driver was very straightforward since the README file describes how to build the modules.  Their partial source code generates the modules _napa.ko_.  Then the next step is to integrate it with the disk driver image to create a new one dedicated for Rocksclusters.  The first is to create the _modules.cgz _file inside the image.  Assume that we are building for kernel version 2.6.9-xxEL





> DRIVER_ROOT$mkdir -p`uname -r`/i686
DRIVER_ROOT$cp napa.ko `uname -r`/i686
DRIVER_ROOT$ls -1 `uname -r`*/i686/* | cpio -Hcrc -o | gzip -9 > modules.cgz





Mount the pre-built image found on the FastTrak driver CD and copy _modules.cgz_.  Also edit the _install_ file to update the _base_ver_ variable with the kernel version.  Notice I also built a driver for the SMP version of the kernel.





> 
#!/bin/sh
drv_basename=napa
remove_module=
base_ver="2.6.9-5.EL 2.6.9-5.ELsmp"
drvname="${drv_basename}.ko"






Using the _install_ script from the driver image, I installed the kernel module _after_ installing the OS.  I am having a bit of trouble integrating the disk driver during the OS installation itself.  After loading the module at the start of the installation process, the machine restarts.  It is not any of my concern as of the moment to get the disk driver working during the installation.  Now I am able to recognize our RAID controller.  Just take a look at that 1.2 Tb of disk space






[![df -h](http://farm2.static.flickr.com/1416/1181126923_76a798b53a_m.jpg)](http://www.flickr.com/photos/yecartes/1181126923/)





Here are my _modules.cgz_ builds both for [Rocksclusters 4.2.1](http://allan.88-mph.net/pub/modules-rocks421.cgz) and [Rocks 4.3](http://allan.88-mph.net/pub/modules-rocks43.cgz).





Technorati Tags: [cluster](http://technorati.com/tag/cluster), [hpc](http://technorati.com/tag/hpc), [beowulf](http://technorati.com/tag/beowulf), [raid](http://technorati.com/tag/raid), [rocksclusters](http://technorati.com/tag/rocksclusters), [drivers](http://technorati.com/tag/drivers)
