---
comments: true
date: 2006-09-03 19:33:34
layout: post
slug: deriving-equations-for-school-administration
title: Deriving Equations for School Administration
wordpressid: 6
categories: Theoretical Hacks
---

One monday, I represented the student body in lieu of Charles, the COA president.  The agenda was about MVP rules and guidelines.  An issue was raised about the noised levels.  As the science major and head of the science guild, I thought that the rule of benchmarking permits with a karaoke device lacks a quantitative aspect given that we are in a university setting and exercises a high degree of scholarship.  So I was tasked to create a recommended sound levels for student activities.  
  
The decibel scale for sound intensity has a standard comparison to everyday sound environments[1]. 70 dB is the intensity of conversational speech.  With this I played around certain properties.  The first information that was needed was to determine the relationship of sound intensity against distance traveled.  When not using the decibel scale sound intensity is expressed as  
  
[tex] I = \frac{P}{A} [/tex]  
  
where P is power in watts and A is in meters squared.  Assuming that sound travels a distance _R,  _the equation can be reexpressed as  
  
[tex] I = \frac{P}{C r^2} [/tex]  
  
where _C_ is some constant.  Taking this into consideration in the new decibel measurements the new level will be  
  
[tex] \beta = 10 \left{ \log \frac{P}{C} - \log I_0 - 2 \log R \right}[/tex]  
  
This means that if there is an org activity at the MVP basement or roofdeck having an noise level of 85 decibels, the nearest offices (approximately 100 meters away) in Kostka, Faura and dela Costa will perceive a sound intensity attenuated by 20 decibels (20log100).  This sound level of 65 decibel is well below conversational speech.  
  
[1] _Decibel Sound Pressure Level Example Chart.  _[http://home.new.rr.com/trumpetb/audio/dBexamp.html](http://home.new.rr.com/trumpetb/audio/dBexamp.html)  
[2]  	Maron, J and W Hornyak. 1982.  _Physics For Science and 	Engineering_.  Saunders College Publishing  
  
_ _<!--  
@page { size: 8.5in 11in; margin: 0.79in }  
P { margin-bottom: 0.08in }  
--  
	
