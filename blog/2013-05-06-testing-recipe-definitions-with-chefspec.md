---
comments: true
date: 2013-05-06 14:35:12
layout: post
slug: testing-recipe-definitions-with-chefspec
title: Testing recipe definitions with chefspec
wordpressid: 332
categories: Soft Hacks
tags: chef,devops,tdd
---

Last time [1], we wrote chefspec tests to cover the behavior of the nginx::default recipe.  Another component provided by the recipe, is the nginx_site definition.  Similar to the previous approach we cover the definition's resources for each possible track the recipe can go through.  The following is the output when the specs succeed.


> 

>     
>     nginx::default
>       #nginx_site (definition)
>         #enable => true (default)
>           should execute command "/usr/sbin/nxensite foo"
>           should notify "service[nginx]" and "reload"
>         #enable => false
>           should execute command "/usr/sbin/nxdissite foo"
>           should notify "service[nginx]" and "reload"
> 
> 



To go about covering the behavior, we start driving TDD by creating failing specs staring with the default case:


> 

>     
>     context "#nginx_site (definition)" do
>       context "#enable => true (default)" do
>         it { expect(chef_run).to execute_command "/usr/sbin/nxensite foo" }
>         it do
>           expect(chef_run.execute("nxensite foo"))
>           .to notify("service[nginx]", "reload")
>         end
>       end
>     end
> 
> 



The above specs will fail because nginx::default doesn't to make a nginx_site("foo") call.  In minitest or test-kitchen, the approach was to create a test recipe that will conduct this integration test.  However, for isolated chefspecs, this is too heavy weight.  Code diving into the Chef 11.4.4 documentation and code [2], every recipe file is loaded by an instance_eval call on Recipe objects.  Hence we can make this approach to inject a fake recipe.  Below, we created a recipe called "nginx_spec::default" with using the existing run context from the "nginx::default" run.


> 

>     
>     def fake_recipe(run, &block)
>       recipe = Chef::Recipe.new("nginx_spec", "default", run.run_context)
>       recipe.instance_eval(&block)
>     end
>     
>     # call to the spec example
>     
>     recipe = fake_recipe(chef_run) do
>       nginx_site "foo" do
>         enable enabled
>       end
>     end
> 
> 



Next, we create a new ChefSpec::ChefRunner instance by appending our internally-created "nginx_spec::default" recipe to the existing "nginx::default" run.  For this we monkey-patch chefspec to converge the added recipe:


> 

>     
>     class ChefSpec::ChefRunner
>       def append(recipe)
>         runner = Chef::Runner.new(recipe.run_context)
>         runner.converge
>         self
>       end
>     end
>     
>     # usage in our examples:
>     new_run = chef_run.append(recipe)
> 
> 



Now we can change our specs to use this new runner context instead to make our expectations.  Below is the whole context that makes the spec pass:


> 

>     
>     context "#enable => true (default)" do
>       let(:run) do
>         recipe = fake_recipe(chef_run) do
>           nginx_site "foo"
>         end
>         chef_run.append(recipe)
>       end
>     
>       it { expect(run).to execute_command "/usr/sbin/nxensite foo" }
>     
>       it do
>         expect(run.execute("nxensite foo"))
>         .to notify("service[nginx]", "reload")
>       end
>     end
> 
> 



And now we have the nginx_site definition covered.  I made commits on the changes in my fork [3] of the opscode cookbook.  Although the approach is useful, this intrusive monkey-patching to chefspec (which is itself a monkey-patch on chef) shows why folks at Opscode recommend to use LWRPS into new recipe development as you can monitor the state of the new resource itself.  With definitions, you have to track the state of the resources made inside the definition action and provide the necessary spec.  This also has implications when you are driving the recipes via TDD to use the nginx_site definition.  I will cover testing that in another post.



	
  1. [http://amespinosa.wordpress.com/2013/05/01/creating-fast-spec-coverage-on-legacy-recipes/](http://amespinosa.wordpress.com/2013/05/01/creating-fast-spec-coverage-on-legacy-recipes/)

	
  2. [http://rubydoc.info/gems/chef/11.4.4/Chef/DSL/IncludeRecipe#load_recipe-instance_method](http://rubydoc.info/gems/chef/11.4.4/Chef/DSL/IncludeRecipe#load_recipe-instance_method)

	
  3. [https://github.com/aespinosa/cookbook-nginx/commit/81ca51fcfcf8612101486371b3d46bc246fba322](https://github.com/aespinosa/cookbook-nginx/commit/81ca51fcfcf8612101486371b3d46bc246fba322)


