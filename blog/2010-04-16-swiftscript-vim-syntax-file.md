---
comments: true
date: 2010-04-16 01:05:48
layout: post
slug: swiftscript-vim-syntax-file
title: SwiftScript Vim syntax file
wordpressid: 231
categories: Soft Hacks
tags: grid computing,productivity,vim
---

One weekend I was reading an article howto made a Vim syntax file.  In application I decided to make one for the [Swift](http://www.ci.uchicago.edu/swift) workflow system.  Most of the script contains simple word matches for some Swift keywords.   Then I copied the matching rules for comments from the C syntax files in the standard Vim distribution.  For a preview, checkout the screenshot below which uses the [desert256.vim](http://www.vim.org/scripts/script.php?script_id=1243) colorscheme in a gnome-terminal:

[caption id="" align="alignnone" width="448" caption="Fig. a Swift workflow syntax highlighted"][![oops_swift by yecartes, on Flickr](http://farm5.static.flickr.com/4010/4519619784_0a0ea87e46.jpg)](http://www.flickr.com/photos/yecartes/4519619784/)[/caption]

The syntax file can be downloaded from my graduate student [code-shanty page](http://www.ci.uchicago.edu/~aespinosa/patches/swift.vim).
