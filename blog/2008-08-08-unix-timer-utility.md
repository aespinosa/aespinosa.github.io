---
comments: true
date: 2008-08-08 15:34:41
layout: post
slug: unix-timer-utility
title: Unix timer utility
wordpressid: 135
tags: linux,programming
---

[caption id="" align="aligncenter" width="400" caption="Timer utilities performance on C and Perl of "echo -n""][![Timer microbenchmark](http://farm4.static.flickr.com/3069/2745203142_8e3e868b8c.jpg)](http://www.flickr.com/photos/23313643@N00/2745203142/)[/caption]

The Unix time(1) command can only give a precision of 10 milliseconds by default. But being the engineer who goes insane after precision, I made my own script to be able to get differences in terms of microseconds. My first timer utility was made in C but I got stuck with the insane exec(3) family of functions since you need to fork the process to a child for the parent process to create successful timing. Hence I used Perl with the Time::HiRes library which is a wrapper to <time.h> and <sys/time.h>. Later on, I found out that C itself has the system(3) functioin in <stdlib.h>

Performance-wise you can see that C has a much faster runtime when the program was being invoked. But you can see in the graph above that Perl has much more consistent values so its standard deviation is lower than C. When I tested both programs for my data-intensive computing experiments, I get better results with the Perl utility! Perhaps I forgot to do all the magic the system function in Perl does in my C implementation?

Here is my Perl code:

    
    <code>#!/usr/bin/perl
    
    use Time::HiRes qw ( tv_interval gettimeofday );
    
    $start = [gettimeofday];
    system @ARGV;
    
    $elapsed = tv_interval ( $start );
    print $elapsed, "\n";</code>


Here is my C implementation:

    
    <code>#include 
    #include 
    
    #include 
    #include 
    
    
    int main(int argc, char* argv[])
    {
    	struct timeval start, end, diff;
    	gettimeofday(&start, NULL);
    	char* command = malloc( sizeof(argv) );
    	int i;
    	sprintf(command, "%s", argv[1]);
    	for( i = 2; i < argc; i++ )
    	{
    		sprintf(command, "%s %s", command, argv[i]);
    	}
    	system(command);
    	gettimeofday(&end, NULL);
    	timersub(&end, &start, &diff);
    	printf("%d.%06d\n", diff.tv_sec, diff.tv_usec);
    	return 0;
    }</code>
