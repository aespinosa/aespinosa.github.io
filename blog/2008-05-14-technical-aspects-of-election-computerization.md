---
comments: true
date: 2008-05-14 18:50:00
layout: post
slug: technical-aspects-of-election-computerization
title: Technical aspects of election computerization
wordpressid: 64
tags: elections,encryption,philippines
---

I was invited (via Facebook events) to attend the first [CSP Kapihan](http://www.facebook.com/event.php?eid=17965363851&ref=mf) discussing the technical aspects of computerizing the Philippine elections. Dr. Pablo Manalastas and Ms.Ito Gruet gave very interesting ideas and pointed out key concepts that the Comelec missed out in the planned pilot testing in the ARMM elections.   
  
Doc Mana stressed out that the Vendors demonstrating ballot counting equipment simply saw the digital signatures as a burden to them despite the fact that the electronic documents such as ballots or election returns from the precints have to be digitally signed according to the law. His blog discusses what does it mean for a document to be digitally signed in detail. To my law school and lawyer friends, what does the e-commerce bill and election modernization bill really mean by digitally signing?  
  
It was very interesting to note Ms. Ito Gruet's point on the current election process. Of the 25-40 days that consumes the canvassing of votes, only one day is spent in the precint-level tallying. After that, the generated election returns will travel to various levels of canvassing boards to declare winners for municipalities, provinces and the Philippines. The the use of digital recording equipment or optical mark readers will only improve the counting on the election return generation. Clearly the bill describing the modernization of Philippine elections failed to analyze the entire process properly and misidentified the bottlenecks. I like Ms. Ito's group's suggestion to deploy a simple web app that will facilitate submission of election returns. With this we can simplify the communication process and reduce the possiblity of missing election returns as it travels to various boards of canvassers.  
  
I had a fruitful discussion with Doc Mana and Dr. Bill Torres, grandfather of the Philippine internet and president of MozCom Philippines on how to deploy the system. In the process of submitting the encoded election return, the board of election inspector will digitally sign the submission to guarantee the authenticity of the data transmitted. In terms of deployment, we can integrate the DepEd's school computerization program since most of the precints are public schools and the officers are the teacher. When the election season is not around, the computers can be used for their teaching materials. This is an efficient way of utilizing taxpayer's resources for IT infrastructures. For communications, we can use our mobile phones as GPRS modems to send encoded data to the central database.  
  
But with these suggestions comes new challenges to the system. Instead of political magnates using guns, goons and gold to propel their electoral machinery, they will be commissioning hackers to send denial of service attacks to Comelec's web server so that no-one will be able to submit results of the election retur ns. Engineers building the system must be vigilant to prevent these attacks.   
  
Links:  


  * [Facebook | CSP Kapihan](//performancing/content/scribefire.xul) - event information
  * [Digital Signatures on Election Returns](http://blog.360.yahoo.com/blog-0OCENX4haau1oA38TsiK4DP2YLk-?cq=1&p=230) - Pablo Manalastas' detailed discussion on the importance of digital signatures in delivering election results to various levels of canvassing boards.
  * [Computer group assesses planned ARMM automated elections](http://newsinfo.inquirer.net/breakingnews/infotech/view/20080513-136300/Computer-group-assesses-planned-ARMM-automated-elections) - new coverage of CSP Kapihan  

