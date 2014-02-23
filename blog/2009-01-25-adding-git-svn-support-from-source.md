---
comments: true
date: 2009-01-25 16:17:52
layout: post
slug: adding-git-svn-support-from-source
title: Adding git-svn support from source
wordpressid: 193
categories: Theoretical Hacks
tags: linux,programming
---

Having workstations where you don't have root access either means contacting support for installation or building your own software from source to get the latest version.

I started using [git](http://git-scm.org) for code produced in my work. The build was successful with a simple "./configure; make ; make install" series of steps except for supporting access to subversion repositories. It was looking for the perl module _SVN::Core_ to be able to function successfully. Googling about it will land you to the [_Alien::SVN_ CPAN module page](http://search.cpan.org/~mschwern/Alien-SVN-1.4.6.0/lib/Alien/SVN.pm). Its dependencies can be installed with the standard "install Module::Name" invocation in the CPAN shell. But the main package does not properly install in this environment. It is probably because of the tarball not containing the standard _Makefile.PL_. It has _Build.PL_ instead. This script generates the Build that compiles the subversion library and its bindings. Then it generates a _Makefile_ from _Makefile.PL_ in the _src/subversion/subversion/bindings/swig/perl/native _directory. Below is the output of the script:

[sourcecode light="true"]
[Alien-SVN-1.4.6.0]$ ./Build
Running make
Running make swig-pl-lib
make: Nothing to be done for `swig-pl-lib'.
Running /usr/bin/perl Makefile.PL INSTALLDIRS=site
Writing Makefile for SVN::_Core
Writing Makefile.client for SVN::_Client
Writing Makefile.delta for SVN::_Delta
Writing Makefile.fs for SVN::_Fs
Writing Makefile.ra for SVN::_Ra
Writing Makefile.repos for SVN::_Repos
Writing Makefile.wc for SVN::_Wc
Running make
gcc -c  -I$HOME/local/include/apr-0
...




The command _/usr/bin/perl Makefile.PL INSTALLDIRS=site_ generates a build environment to install in_ /usr_. This is not favorable for installation in userspace since you do not have permission to write on that directory. So this command will be rerun /_usr/bin/perl Makefile.PL PREFIX=$USERDIR_, where _$USERDIR_ is the destination directory you want to.

Now you can successfully clone subversion repositories!
