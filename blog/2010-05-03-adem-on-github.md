---
comments: true
date: 2010-05-03 20:18:18
layout: post
slug: adem-on-github
title: ADEM on github
wordpressid: 273
categories: Soft Hacks
tags: grid computing
---

For my first Ruby project, I reimplemented ADEM from scratch.  ADEM is tool for automatically installing applications on the Open Science Grid via pacman.  Here is a glimpse of the interface.


    
    
    <code>
    ADEM is a tool for deploying and managing software on the Open Science Grid.
    
      Usage:
        adem command [options]
    
      Examples:
        adem config --display
        adem sites --update
        adem app --avail
    
      Further help:
        adem config -h/--help        Configure ADEM
        adem sites -h/--help         Manipulate the site list
        adem app -h/--help           Application installation
        adem help                    This help message
    </code>
    



The original subversion repository is found in [https://svn.ci.uchicago.edu/svn/vdl2/SwiftApps/adem-osg](https://svn.ci.uchicago.edu/svn/vdl2/SwiftApps/adem-osg).  A Github repository is also mirrored in [git://github.com/aespinosa/adem.git](http://github.com/aespinosa/adem)

Happy grid computing!
