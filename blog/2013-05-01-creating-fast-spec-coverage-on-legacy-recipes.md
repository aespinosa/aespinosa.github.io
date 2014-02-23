---
comments: true
date: 2013-05-01 14:32:00
layout: post
slug: creating-fast-spec-coverage-on-legacy-recipes
title: creating fast spec coverage on legacy recipes
wordpressid: 300
tags: chef,devops
---

As techniques in testing Chef recipes are still evolving, most of use inherit large untested cookbook codebases from eons ago (translates to a few months in Chef's community speed).   After watching Chefconf 2013 livestreams, I decided to give chefspec [3] a try.  However, most of the write-ups about chefspec cover pretty basic.  Here, I will write how I covered our legacy chef repository with fast tests.  For this example, I will be writing coverage for opscode's nginx recipe [1] .

First we begin by covering examples for all resources that gets created by default.


> 

>     
>     describe 'nginx::default' do
>       it "loads the ohai plugin"
>       it "starts the service"
>     end
> 
> 



Then, we create contexts for each test case in the recipe logic.


> 

>     
>     describe 'nginx::default' do
>       it "loads the ohai plugin"
>     
>       it "builds from source when specified"
>     
>       context "install method is by package" do
>         context "when the platform is redhat-based" do
>           it "includes the yum::epel recipe if the source is epel"
>           it "includes the nginx::repo recipe if the source is not epel"
>         end
>         it "installs the package"
>         it "enables the service"
>         it "includes common configurations"
>       end
>     
>       it "starts the service"
>     end
> 
> 



Now we have a general idea of what tests to write from the rspec documentation run:


> 

>     
>      rspec spec/default_spec.rb
>     
>     nginx::default
>       loads the ohai plugin (PENDING: Not yet implemented)
>       builds from source when specified (PENDING: Not yet implemented)
>       starts the service (PENDING: Not yet implemented)
>       install method is by package
>         installs the package (PENDING: Not yet implemented)
>         enables the service (PENDING: Not yet implemented)
>         includes common configurations (PENDING: Not yet implemented)
>         when the platform is redhat-based
>           includes the yum::epel recipe if the source is epel (PENDING: Not yet implemented)
>           includes the nginx::repo recipe if the source is not epel (PENDING: Not yet implemented)
>     
>     Pending:
>       nginx::default loads the ohai plugin
>         # Not yet implemented
>         # ./spec/default_spec.rb:4
>       nginx::default builds from source when specified
>         # Not yet implemented
>         # ./spec/default_spec.rb:6
>       nginx::default starts the service
>         # Not yet implemented
>         # ./spec/default_spec.rb:18
>       nginx::default install method is by package installs the package
>         # Not yet implemented
>         # ./spec/default_spec.rb:13
>       nginx::default install method is by package enables the service
>         # Not yet implemented
>         # ./spec/default_spec.rb:14
>       nginx::default install method is by package includes common configurations
>         # Not yet implemented
>         # ./spec/default_spec.rb:15
>       nginx::default install method is by package when the platform is redhat-based includes the yum::epel recipe if the source is epel
>         # Not yet implemented
>         # ./spec/default_spec.rb:10
>       nginx::default install method is by package when the platform is redhat-based includes the nginx::repo recipe if the source is not epel
>         # Not yet implemented
>         # ./spec/default_spec.rb:11
>     
>     Finished in 0.00977 seconds
>     8 examples, 0 failures, 8 pending
> 
> 



Progress can be found in [2] where i tested everything.  Next I will be writing on how I tested the nginx nginx_site definitions.



	
  1. [http://community.opscode.com/cookbooks/nginx](http://community.opscode.com/cookbooks/nginx)

	
  2. [https://github.com/aespinosa/cookbook-nginx](https://github.com/aespinosa/cookbook-nginx)

	
  3. [https://github.com/acrmp/chefspec](https://github.com/acrmp/chefspec)

	
  4. [https://www.destroyallsoftware.com/screencasts/catalog/untested-code-part-1-introduction](https://www.destroyallsoftware.com/screencasts/catalog/untested-code-part-1-introduction)


Disclaimer: I came from an xUnit-testing background so I maybe interchanging "test cases" with "examples" and other purist stuff.  Also I may need to proof read on how my spec examples speak.
