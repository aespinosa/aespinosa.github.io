---
comments: true
date: 2007-11-07 13:35:49
layout: post
slug: upgrading-to-gutsy-gibbon
title: Upgrading to Gutsy Gibbon
wordpressid: 32
tags: linux,ubuntu
---

A few weeks ago, I decided to upgrade my desktops from Ubuntu 7.04 Feisty Fawn to 7.10 Gutsy Gibbon. Using the upgrade instructions from  the [Ubuntu website](http://www.ubuntu.com/getubuntu/upgrading), I used the network upgrade method for Ubuntu servers. I did not want to use the update-manager application to manage the upgrade because of a bad upgrade experience from Dapper Drake.  To resolve my previous problem, I performed a complete reinstall of my system.

Most blogs and reviews of Gutsy highlights enhanced 3D Desktop support using compiz.  For my non-Linux friends, below are some screenshots of my desktop:


[![Gutsy workstation](http://farm3.static.flickr.com/2005/1882857063_7de1e63aa8_m.jpg)](http://www.flickr.com/photos/yecartes/1882857063/)


The figure above shows the Shift Switcher plugin.  It cycles through all of the window applications through a nice panel shuffler interface.  Below is the "Mac-like" Scale Window plugin.  It gives an overview of all the windows present on my Desktop.


[![home desktop on gutsy](http://farm3.static.flickr.com/2045/1882679568_8a1ce32911_m.jpg)](http://www.flickr.com/photos/yecartes/1882679568/)


Another key upgrade of Gutsy was the shift from using the teTeX disribution to TeXlive.  These are the package distribution for the LaTeX/ TeX typesetting suite.  As an academic, this is one of the most important applications in my workstation's setup.  Here is an excerpt from the tetex-bin transition package:


> teTeX is no longer developed upstream, and has been replaced by the TeX Live collection.  This is a transitional package to bring former teTeX users a decent selection of TeX Live packages.  It can be safely removed (unless some external packages still depend on tetex-bin).

Note, however, that the functionality of the TeX Live subset that is chosen is not exactly the same as that of tetex-bin, due to the different splitting schemes.


When I upgraded my home desktop, the LaTeX upgrade took most of the upgrade time because it keeps caching the fonts for every package.  Thus, I first remove the tetex-* packages from my office workstation before performing another upgrade.  When the upgrade to Gutsy was finished, I installed the related texlive-* packages.
