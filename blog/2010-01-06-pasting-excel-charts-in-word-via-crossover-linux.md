---
comments: true
date: 2010-01-06 01:42:44
layout: post
slug: pasting-excel-charts-in-word-via-crossover-linux
title: Pasting Excel Charts in Word via Crossover Linux
wordpressid: 224
categories: Soft Hacks
tags: linux,productivity,windows
---

Pasting a chart from MS Excel 2007 to Word 2007 will yield a To insert a chart, you must first close any open dialog boxes or cancel editing mode in Microsoft Office Excel error.  This bug is found in [Crossover Linux Pro v8.0.0](http://www.codeweavers.com/products/cxlinux/).  I assume that this will also occur in publicly available versions of [Wine](http://www.winehq.org/).

An alternative solution aside from booting to Windows is to use the _Paste Special_ feature.  Paste it as a _Picture (Enhanced Metafile)_.  This will preserve the vector information of the chart so zooming in and out of the document object wont' be a problem.
