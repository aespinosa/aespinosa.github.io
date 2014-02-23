---
comments: true
date: 2008-06-19 23:37:06
layout: post
slug: tweak-your-delicious-most-visited-sites
title: Tweak your del.icio.us most visited sites
wordpressid: 66
categories: Personal
tags: delicious,firefox
---

The [del.icio.us](http://del.icio.us) [Firefox add-on](https://addons.mozilla.org/en-US/firefox/addon/3615) provides very neat integration into the latest version of Firefox three. I like the synchronization between local bookmarks, shortcuts, etc. The "most visited" tab actually counts how many times you clicked a bookmark and updates the toolbar respectively. The only problem is that for private bookmarks like the ones that initiate javascript link calls do not update the bookmark counters.

One of my favorite links is the [citeulike.org](http://www.citeulike.org)'s add to library shortcuts which initiates a javascript call containing the current url on your browser such as  an overview page of a journal article. This frustrated me for a while but after "grep"-ing my Firefox profile directory for the name of my citeulike bookmark, I edited the citeulike entry in my ~/.mozilla/firefox/$PROFILENAME/delcious.rdf:


    
    <code>
    
        bibliography
        citation
        bookmarking
        research
        reference
        academic
        tagging
        300
        Tue Jul 03 07:49:43 2007 +000000
        Tue Jul 03 07:49:43 2007 +000000
    
    </code>



The code entry above shows the XML entry for a bookmark. Simply change the "NC:VisitCount" tag to a very high value and it will appear at the top of your del.icio.us toolbar most-visited tab.

Enjoy your new favorite bookmark!
