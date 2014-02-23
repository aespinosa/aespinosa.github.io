---
comments: true
date: 2008-05-14 18:07:00
layout: post
slug: compizs-scale-plugin-in-hardy-heron
title: Compiz's Scale plugin in Hardy Heron
wordpressid: 63
tags: linux,ubuntu
---

I recently upgraded my workstation and Asus EEE to Ubuntu 8.04.  To save on screen space on my UMPC, the top button was set to autohide. The bottom panel was removed and replaced by the avant-window-navigator also in auto-hide mode so I can have larger window icons.  The final step was modifying the behavior of the scale plugin to activate whenever I place my mouse cursor at the TopRight of the screen.

[caption id="" align="aligncenter" width="360" caption="Compiz session activating the Scale plugin window picker "][![](http://farm3.static.flickr.com/2028/2449812655_47be8ee0e3.jpg)](http://www.flickr.com/photos/24267941@N00/2449812655)[/caption]




The Scale plugin of Compiz shows all the thumbnails of opened windows in the current workspace.  It looks like something in Mac OS X.  The screenshot below shows a sample activation of the Scale plugin window picker using the default Shift-Alt-Up:

To enabled the mouse gesture behavior of the plugin, simple open the gconf-editor program and go to /apps/compiz/plugins/scale/allscreens/options.  The initiate_edge name-key pair is by default set as an array so that you can combine multiple-key definitions like Ctrl-Alt-BottomRight.  But indicating only a mouse gesture does not work.  The workaround I did was to unset the key.  Aftewards, it will change from an array list into a text field.  Then write TopRight or whatever mouse gesture you want to activate the window picker.

To unset the initiate_edge key-value pair, simple right click on the entry and choose the "Unset Key" option.
