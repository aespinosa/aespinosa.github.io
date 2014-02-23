---
comments: true
date: 2007-03-23 01:49:20
layout: post
slug: ajss-codeinvaders
title: 'AJSS: CodeInvaders!'
wordpressid: 10
categories: Theoretical Hacks
---

During the 2006 ACM-ICPC World Finals in San Antonio, Texas, there is an intermediate programming contest sponsored by IBM. The Java Challenge showcases the latest offerings from IBM and try it out in a tournament style. The name of the tournament was CodeInvaders. It was released in the IBM AlphaWorks site last June 2006. Here is a short description from its AlphaWorks page:  
  


> [CodeInvaders](http://www.alphaworks.ibm.com/tech/codeinvaders) is a Javaâ„¢-based, real-time programming game based on the Eclipse platform. It uses the Eclipse platform and a simple API that allows users unfamiliar with Java to easily compete while they learn the language. CodeInvaders Challenge gives users the opportunity to pit their Java programming skills against other players in a battle of space conquest. Each player writes a Java class that represents and controls a spaceship. Each ship (class) is placed in a simulated battle along with ships from other players.  


  


![](http://farm1.static.flickr.com/156/430506819_ddfaf2008a_m.jpg)  
  


One of our ACM coaches, [Dr. Vergara](http://curry.ateneo.net/%7Ejpv) realized that this platform can be used to teach Java and object oriented programming for kids in the high school range. This summer, we teamed up ([Akie Mejia](http://rfmejia.blogspot.com/), me,Doc V) will conduct a Java programming workshop for the Ateneo Junio Summer Seminar (AJSS). I installed Eclipse and the CodeInvaders plugin into Doc V's computer and demonstrated how to use the program. Then we will meet sometime next week to discuss how we plan to approach the workshop and have some fun programming our own spaceships.  
  
In preparation, I made improvements to our initial solution in the ACM which uses a rent-seeking economy paradigm. In the game, you get points if your spaceships beam energy to their home planets. So the Linden BoyZ simply beamed all the energy of the mothership and drones to the home planet and obtained the maximum possible score of 280 points. Most of the contestants during the World Finals used this approach. Everybody in the tournament arena just laughed when all teams used this strategy at the same time.  
  


![](http://farm1.static.flickr.com/180/430506454_b9e17f2d3a_m.jpg)  


  
The main improvement compared to our previous strategy is that I applied a "look before you leap" approach. For the spaceships to move around the field, it requires some key units of energy. Before the game starts, each ship has a pre allocated amount of energy. Other energy sources are randomly scattered in the field which can be obtained by the ships. Therefore, in order to increase the maximum possible score, the programmer must design the ships to gather energy. The energy consumed from traveling in space is used by the ship's thrusters. For every amount of thrust used, energy is used per unit of time.   
  
The thrust will them change the ship's accelaration _a_. Assuming that the ships will have an initial velocity _v_ of 0 to go to the energy source, the time _t_ to reach the source can be computed through the kinematic equation  
  
[tex] d = \frac{1}{2} a t^2 [/tex]  
  
where _d _is the distance from the ship to the energy source. The energy consumed to travel this distance and back is then computed by dimensional analysis.  
  
Results:  
  
Creating a simulation of 6 teams using my strategy gave me the following scores:  
  


![](http://farm1.static.flickr.com/186/430505490_bb099ee8c9_m.jpg)  


  
  
As evidently observed from the screenshot, I was able to surpass the maximum possible score of 280! The sourcecode for the MySpaceShip.java will be posted later on (the participants of AJSS) might use it. :D  


  
  
Technorati Tags: [spaceinvaders ateneo ajss java javachallenge icpc worldfinals challenge](http://technorati.com/tag/spaceinvaders%20ateneo%20ajss%20java%20javachallenge%20icpc%20worldfinals%20challenge)
