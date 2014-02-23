---
comments: true
date: 2007-07-11 15:22:56
layout: post
slug: lecture-notes-on-iteration
title: Lecture notes on iteration
wordpressid: 21
categories: Teaching
---

For my CE 21 class.  The problem discussed earlier was, draw a triangle of stars given the length for a side of the triangle _n_. It can be illustrated as follows for _n = 3_.


> <code>*
>     * *
>     * * *</code>
>     

The next task is to center the triangle:


>   *
>      * *
>     * * *

Then we want to be able to print a diamond


> <code>  *
>      * *
>     * * *
>      * *
>       *</code>

This C++ code is one of the solutions to the problem:


> <code>#include 
>     int main()
>     {
>       int n;
>       std::cin >> n;
>       int i = 1;
>       // upper triangle
>       while( i <= n )
>       {
>         int space = n - i;
>         for(int j = 1 ; j <= space ; j++ )
>         {
>           std::cout << " ";
>         }
>         int j = 1;
>         while( j <= i )
>         {
>           std::cout << "* ";
>           j++;
>         }
>         std::cout << std::endl;
>         i++;
>       }
>       // lower triangle
>       i = n - 1;
>       while( i >= 1 )
>       {
>         int space = n - i;
>         for(int j = 1 ; j <= space ; j++ )
>         {
>           std::cout << " ";
>         }
>         int j = 1;
>         while( j <= i )
>         {
>           std::cout << "* ";
>           j++;
>         }
>         std::cout << std::endl;
>         i--;
>       }
>       return 0;}</code>
> 
> 



For the homework, answer the Challenge section of the [lecture slides](http://allan.88-mph.net/pub/teaching/03-iteration.odp) on iterations:



	
  * Draw a pine tree with 3 sections

	
  * Each section should have _n_ lines of stars

	
  * The start of the next section should have one less star than the end of the previous section

	
  * Add _n_ lines of single asterisks for a stand


Example for _n = 3:_


> 

>     
>     <code>      *
>          * *
>         * * *
>          * *
>         * * *
>        * * * *
>         * * *
>        * * * *
>       * * * * *
>           *
>           *
>           *</code>
> 
> 



Technorati Tags: [ce21](http://technorati.com/tag/ce21), [c++](http://technorati.com/tag/c++), [programming](http://technorati.com/tag/programming), [loops](http://technorati.com/tag/loops), [iterations](http://technorati.com/tag/iterations)
