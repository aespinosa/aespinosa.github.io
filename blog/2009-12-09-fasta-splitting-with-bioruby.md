---
comments: true
date: 2009-12-09 22:33:58
layout: post
slug: fasta-splitting-with-bioruby
title: FASTA splitting with BioRuby
wordpressid: 220
categories: Soft Hacks
tags: bioinformatics,ruby,science
---

In reference to my [previous post](http://amespinosa.wordpress.com/2009/10/08/splitting-bioinformatics-fasta-files/), here's the splitter using BioRuby.  Note that I also changed the outer loop to one file per iteration instead of some crazy rules of when to create the file.

`[sourcecode lang="ruby"]
#!/usr/bin/env ruby
#
# Script: dumpseq.rb [file] [N] [prefix]
# Description: Splits a fasta file evenl across N files.  dumps files in the
#              [prefix]  directory
require 'bio'
require 'fileutils'

include Bio


seqs =  FlatFile.open(ARGV[0])
ncpus = ARGV[1].to_i
prefix = ARGV[2]

# Remove and hardwire n_seqs if you know beforehand the number of sequences in
# a file.  Saves readtime
n_seqs = 0
seqs.each do |seq|
 n_seqs += 1
end
seqs.rewind

overflow = n_seqs % ncpus
split_size = n_seqs / ncpus

ncpus.times do |i|
  filename = sprintf "%s/D%07d/seq%07d.fasta", prefix, i, i
  FileUtils.mkdir_p File.dirname(filename)
  dump = File.new(filename, "w")
  split_size.times do |j|
    dump << seqs.next_entry.to_s
  end
  if i < overflow 
    dump << seqs.next_entry.to_s
  end
  dump.close
end


`
