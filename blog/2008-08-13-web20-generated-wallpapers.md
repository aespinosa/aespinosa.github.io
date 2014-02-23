---
comments: true
date: 2008-08-13 14:05:33
layout: post
slug: web20-generated-wallpapers
title: Web2.0-generated wallpapers
wordpressid: 143
categories: Soft Hacks
tags: programming,web2.0
---

[caption id="" align="aligncenter" width="450" caption="Blog page background header"][![blog pag background](http://farm4.static.flickr.com/3213/2733902034_5422c21d89.jpg)](http://www.flickr.com/photos/23313643@N00/2733902034/)[/caption]

I decided to create a backround header image for my blog and Multiply page. Tons of randomly writter equations would be nice to have. The Yahoo Image search allows you to specify if you the types of pictures you want like black and white photos, image size, etc. I used the yahoo_collage.pl from [Uppal's blog](http://upster.blogspot.com/2005/03/yahoo-image-search-collage-generator.html) and modified it to exceed the maximum images per query of 50 limit from [Yahoo's image search api](http://developer.yahoo.com/search/image/V1/imageSearch.html). Below is the patch:

    
    <code>*** yahoo_collage.pl	2005-09-16 20:07:50.000000000 -0500
    --- ycollage.pl	2008-08-13 13:56:45.000000000 -0500
    ***************
    *** 1,4 ****
    ! #! /usr/local/bin/perl -w
      ################################################################################
      # Yahoo Image Search Collage Generator
      #
    --- 1,4 ----
    ! #! /usr/bin/perl -w
      ################################################################################
      # Yahoo Image Search Collage Generator
      #
    *************** my $count   = 50;
    *** 33,38 ****
    --- 33,39 ----
      my $file    = undef;
      my $width   = 50;
      my $height  = 50;
    + my $init = 0;
    
      GetOptions(
          'query=s'   => \$query,
    *************** GetOptions(
    *** 41,46 ****
    --- 42,48 ----
          'width=i'   => \$width,
          'height=i'  => \$height,
          'help'      => \$help,
    +     'init=i'      => \$init,
      );
    
      if ($help) {
    *************** if ($help) {
    *** 56,71 ****
    
      die("Must specify a query!\n") unless ($query);
    
    ! if ($count > Yahoo::Search::MaxCount('Image')) {
    !     die("Yahoo! does not allow querying for more than " .
    !         Yahoo::Search::MaxCount('Image') . " results at once!\n");
    ! }
    
      print STDERR "Querying Yahoo for \"$query\"...\n";
    ! my @results = Yahoo::Search->Results(
          Image => $query,
    !     Count => $count,
    ! );
    
      print STDERR "Generating HTML...\n";
    --- 58,86 ----
    
      die("Must specify a query!\n") unless ($query);
    
    ! #if ($count > Yahoo::Search::MaxCount('Image')) {
    ! #    die("Yahoo! does not allow querying for more than " .
    ! #        Yahoo::Search::MaxCount('Image') . " results at once!\n");
    ! #}
    
      print STDERR "Querying Yahoo for \"$query\"...\n";
    ! my $summary = Yahoo::Search->Query(
          Image => $query,
    !     Count => "50",
    ! 	Start => $init,
    ! 	Color => "bw")->CountAvail;
    ! my $i;
    ! my @results;
    ! for($i = $init; $i < $count + $init; $i += 50)
    ! {
    !     my @partial = Yahoo::Search->Results(
    !         Image => $query,
    ! 		Start => $i,
    !         Count => 50,
    !         Color => "bw");
    ! 	push (@results, @partial);
    ! }
    ! print "Generated image $init to $i from $summary\n";
    
      print STDERR "Generating HTML...\n";
    *************** sub generate_html {
    *** 92,99 ****
          my $html_images = "";
    
          foreach my $image_result (@$ra_results) {
    !         $html_images .= "<a href=\"" . $image_result->HostUrl() . "\"> <img src=\"" .
    !                         $image_result->ThumbUrl() . "\" width=$width height=$height></a>";
          }
    
          my $html_credits = qq{Created with <a href="http://upster.blogspot.com">Siddharth Uppal</a>'s
    --- 107,114 ----
          my $html_images = "";
    
          foreach my $image_result (@$ra_results) {
    !         $html_images .= "<img src=\"" .
    !                         $image_result->ThumbUrl() . "\" border=0> ";
          }
    
          my $html_credits = qq{Created with <a href="http://upster.blogspot.com">Siddharth Uppal</a>'s
    *************** sub generate_html {
    *** 104,120 ****
          my $html_page = qq{
              <html>
              <head>
    !         <title>Yahoo Image Search Collage Generator: $query</title>
              </head>
    !         <body><center>
    !         <font face="Trebuchet MS" color="Black" size="4"><b>$query</b></font><br>
    !         <p align="center">$html_images</p>
    !         <font face="Trebuchet MS" color="Black" size="2"><br><b>
    !         To show off your collage, just copy and paste the text below into your blog or website!<br><br>
    !         <textarea rows="25" cols="50">$html_images<br>$html_credits</textarea><br><font size="1"
    !         face="Verdana" color="Gray">
    !         </b><br>$html_credits
    !         </center></body>
              </html>
          };
    
    --- 119,129 ----
          my $html_page = qq{
              <html>
              <head>
    !         <title>$query</title>
              </head>
    !         <body style="width: 1024px;">
    ! 		<p align="center">$html_images</p>
    !         </body>
              </html>
          };</code>


Here are some selected of my generated collages:

[caption id="" align="aligncenter" width="450" caption="latex equation"][![latex equation](http://farm4.static.flickr.com/3125/2759968523_02160fc1be.jpg)](http://www.flickr.com/photos/23313643@N00/2759968523/)[/caption]

[caption id="" align="aligncenter" width="450" caption="modulator"][![modulator](http://farm4.static.flickr.com/3057/2759974911_973da32bcd.jpg)](http://www.flickr.com/photos/23313643@N00/2759974911/)[/caption]

