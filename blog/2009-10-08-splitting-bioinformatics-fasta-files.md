---
comments: true
date: 2009-10-08 19:44:49
layout: post
slug: splitting-bioinformatics-fasta-files
title: Splitting bioinformatics FASTA files
wordpressid: 206
tags: bioinformatics,science
---

I keep forgetting where my scripts were in my home directories.  Below is my ruby script to split a large FASTA [1] sequence into N sequences per file:

[sourcecode language="ruby"]
#!/usr/bin/env ruby
#
# Script: dumpseq.rb
# Description: Parses the a BLAST Fasta file and dumps each sequence to a 
#              file.
# Usage: dumpseq.rb [fasta_file]

require 'fileutils'


fasta_db  = File.new(ARGV[0])

sno = 0
d = 0

file = nil

while true
  x = fasta_db.readline("\n>").sub(/>$/, "")
  x =~ />(.*)\n/
  if sno % 2 == 0 # 2 seqs per query
    file.close if file != nil
    dir = sprintf("D%04d000", d / 1000)
    FileUtils.mkdir_p dir
    # short filenames
    fname = sprintf "SEQ%07d.fasta", d
    d += 1
    file = File.new("#{dir}/#{fname}","w")
  end
  file << x
  sno += 1
  fasta_db.ungetc ?>
end




Its pretty hackish-looking. But then I found out that BioRuby [2] wrappers for parsing FASTA files.

[1] [http://en.wikipedia.org/wiki/Fasta](http://en.wikipedia.org/wiki/Fasta)
[2] [http://www.bioruby.org](http://www.bioruby.org)
