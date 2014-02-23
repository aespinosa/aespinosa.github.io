---
comments: true
date: 2007-06-16 09:38:48
layout: post
slug: collated-schematic-diagrams
title: Collated schematic diagrams
wordpressid: 18
categories: Theoretical Hacks
---

When I was scouring through my files in my undergraduate years, I decided to compile all of the figures and schematic diagrams from all the lab reports and other technical papers.

My preference in submitting paperwork was typesetting everything in TeX/LaTeX. It is a markup language similar to HTML but with a huge emphasis on math equations. In fact this blog uses a TeX engine to typeset the formula figures.

All schematic diagrams and figures were generated using [Circuit_macros](http://www.ece.uwaterloo.ca/~aplevich/Circuit_macros/) made by [J. Aplevich](http://www.ece.uwaterloo.ca/~aplevich/). It is a collection of m4 macros that generates Pic figures. Pic is a markup language for generating figures and it is part of the Groff document formatting system. The program has a '-t' options which can be used to create TeX-markup figures. It takes a few steps in generating a schematic diagram using this system:



	
  1. Create a .m4 file using the macros found in various Circuit_macros libraries. The package contains vast documentations and examples to get started on your own diagrams. It is also good to consult the gpic document to know various pic primitives such as squares, circles, ellipses, etc.

	
  2. Process it in the commandline using "$> m4 file.m4 | pic -t > out.tex". The _out.tex_ file is then the main figure.  You can now use this in your schematic diagrams.

	
  3. In your TeX documents, the figure can be included using
`\input{out.tex}
\box\graph`


Here are a few examples of what I have made during my undegraduate years.  More can be found in my [Flickr page](http://www.flickr.com/photos/yecartes/tags/electronics).


[![amp](http://farm2.static.flickr.com/1355/554239140_978f3ec961_t.jpg)](http://www.flickr.com/photos/yecartes/554239140/)[![amp](http://farm2.static.flickr.com/1005/554235964_8348cd9128_t.jpg)](http://www.flickr.com/photos/yecartes/554235964/)[![logic](http://farm2.static.flickr.com/1116/554499961_8e8ada3a5d_t.jpg)](http://www.flickr.com/photos/yecartes/554499961/)[![mix](http://farm2.static.flickr.com/1179/554494559_f096730572_t.jpg)](http://www.flickr.com/photos/yecartes/554494559/)


Technorati Tags: [circuit_macros](http://technorati.com/tag/circuit_macros), [tex](http://technorati.com/tag/tex), [latex](http://technorati.com/tag/latex), [typesetting](http://technorati.com/tag/typesetting), [electronics](http://technorati.com/tag/electronics), [schematic diagrams](http://technorati.com/tag/schematic%20diagrams), [circuits](http://technorati.com/tag/circuits)
