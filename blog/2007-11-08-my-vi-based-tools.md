---
comments: true
date: 2007-11-08 18:44:57
layout: post
slug: my-vi-based-tools
title: My Vi-based tools
wordpressid: 35
tags: linux
---

Ever since I conquered the steep learning curve of the mode-based text-editing of _vi_ (pronounced vee-eye), there is no other text editor for me.  It completely binds my hands on the keyboard without the need to use the most (almost!).  For those who are not yet into the religious practice of advocating text-editors, here is a short description of vi from [Wikipedia](http://en.wikipedia.org/wiki/Vi):


> vi is a screen-oriented text editor written by Bill Joy in 1976 for an early BSD release.

The name vi is derived from the shortest unambiguous abbreviation for the command visual in ex; the command in question switches the line editor ex to visual mode. The name vi is pronounced /vee-eye/,[1] though other pronunciations such as /vaÉª/ are also used.

vi is generally understood to be a modal editor: it operates in either insert mode (where typed text becomes part of the document) or command mode (where keystrokes are interpreted as commands that control the edit session). Typing 'i' while in command mode switches the editor to insert mode. Typing 'i' again at this point places an 'i' character in the document. How the 'i' keystroke is processed depends on the editor mode. (From insert mode, pressing the escape key switches the editor back to command mode.)

vi can process compound commands that embed text for insertion in the document. For example, the command:
`
20i Hello world!
`
would insert 20 lines in the document with the text 'Hello world!'. Rather than grapple with the notion of two mode switches while executing this command, some users view vi as a stateful filter. After processing the third character, vi changes state and begins processing input as text to be added to the file. On processing the escape, vi returns to the state in which it is ready to receive a new command.

Whether viewed as modal or stateful, vi's processing of the same keystroke in different ways depending on the history of the edit session distinguishes it from editors which are generally considered non-modal.

An advantage of a modal editor is that the use of keyboard chords (multiple keys pressed simultaneously, typically a modifier plus a letter key) is reduced or eliminated. Instead, in command mode, single keystrokes serve as commands. This results in the user's hands not having to take up awkward positions, which some find results in faster work.


I mostly use [ViM](http://www.vim.org) (Vi Improved), one of the most successful implementations of vi as my default text editor.  Version 7 has new features that I have not yet explored such as tabbed buffers, spell check.  I am currently reading _[Hacking Vim: A Cookbook to get the Most out of the Latest Vim Editor](http://www.citeulike.org/user/aespinosa/article/1884268)_ to get a deeper understanding of the text editor such as using Vimdiff and integrating tools such as subversion.

Of course it is inevitable that you have to go outside of the text editor such as web browsing (the normal way), programming using big IDEs, etc.  For this I have my personal list of Vi plugin implementations:



	
  * [_VIMperator_](http://vimperator.mozdev.org) is a browser-addon for Firefox, which makes it look and behave like the ViM text editor. It has similar key bindings, and you could call it a modal web browser, as key bindings differ according to which mode you are in.Â  The shortcuts are very convenient specially if you are cycling through a couple of web pages.Â  For example 5gt will focus on the fifth tab window in the browser. 20G will jump to line 20 of the web page.Â  A noticable difference in using the plugin was that all pop-up windows are now opened as tabs.

	
  * [_It's All Text!_](https://addons.mozilla.org/en-US/firefox/addon/4125) enables Firefox to edit textareas in an external editor.Â  Just simply right-click on the text area and select "It's All Text!".Â  Then I configured the plugin to use ViM as the text editor.

	
  * [_viPlugin_](http://satokar.com/viplugin/) adds vi(m) functionality as a layer on top of an open editor (e.g. CDT, RDT, Aptana, JDT, etc.)


Below is an overview screenshot of the above vi-related tools:


[![vi-enabled tools](http://farm3.static.flickr.com/2050/1917032000_27fc551393_m.jpg)](http://www.flickr.com/photos/yecartes/1917032000/)
