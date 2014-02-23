---
comments: true
date: 2007-05-16 10:29:45
layout: post
slug: spreadsheet-powered-election-quickcount
title: Spreadsheet-powered Election Quickcount
wordpressid: 16
categories: Theoretical Hacks
---

Last Monday (May 14), millions of Filipinos went to various public schools (precints) to exercise their right of suffrage. It was election time for local officials like mayors, councilors, board members, governors and also senators. Since the mid 80's the National Movement for Free Elections (Namfrel) conducts parallel quickcounts. It is the only institution accredited by the Commission on Elections (Comelec) to conduct such an election.  
  
My father listed me as a Namfrel volunteer in our local province in Bataan. Prior to the elections, we received MS Excel spreadsheets as a tool for the quickcount operation. We totally have no idea on how to deploy the application. From a system adminstrator point of view, getting the thing to work was a nightmare. Namfrel admits their ["Software Problems"](http://technology.inquirer.net/infotech/infotech/view_article.php?article_id=66065) according to an [Inquirer](http://www.inquirer.net) article. Of course volunteers _have_ to modify the programs since we received a _generic template_ with the logo of Muntinlupa City in the upper right corner of the spreadsheet. Some of the things we did prior to the election:  
  


  1. Encode all the precints in the national, local, and partylist spreadsheets. A user's manual for the three files were included on how to do this operation. We received a list of precints as PDF document so we performed some string processing before we were able to cut-and-paste to the spreadsheets.
  2. Encode the local officials
  3. Encode data from Election Returns (ER). This will then generate another spreadsheet data file (ER-data). It was not included in the documentation what the "POST TRANSACTION" will do. This is necessary information for volunteers who are maintaining the system.  

  4. Consolidate generated-data. The spreadsheet file requires where in the local SMB network the generated (ER-data) are located. This will then merge all of the files into a single report for a particular province.
Upon personally encountering such system problems, I have thought of system specific documentation (an INSTALL file for the archive) .But I don't have the MS Excel spreadsheets right now, so there will be minimal screenshots.  Assume a hypothetical provincial race election.  
  


  1. Each town will generate a single election return data. Therefore the three spreadsheet files (LOC-OQC2K7.xls, NAT-OQC2K7.xls, PAT-OQC2K7.xls) should be installed in its own "Town Folder". For example, a Province _X _has 10 towns labeled _T[0-9]. _If the provincial headquarters, we can install the three spreadsheets in two SMB shares per computer as follows
    * \\computer0\T0 and \\computer0\T1  

    * \\computer1\T2 and \\computer1\T3
    * \\computer2\T4 and \\computer2\T5
    * \\computer3\T6 and \\computer3\T7
    * \\computer4\T8 and \\computer4\T9
  2. Follow instructions in *Manual.pdf to encode precints and candidates.
  3. Add the following to the Consolidation Manual:
    * Based on how you have setup file sharing services, enter the mounts in item [1]  

Technorati Tags: [election](http://technorati.com/tag/election), [philippines](http://technorati.com/tag/philippines), [excel](http://technorati.com/tag/excel), [spreadsheet](http://technorati.com/tag/spreadsheet), [quickcount](http://technorati.com/tag/quickcount), [namfrel](http://technorati.com/tag/namfrel)
