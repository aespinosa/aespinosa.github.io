---
title: Really unit testing Chef recipes
date: 2014-06-29
---

## Chefspec

* Simple to get started
* Build the resource collection
* Monkeypatch a provider's :perform_action method to do nothing.
* More complete
* A lot of monkey patching on assertions

## Unit testing recipes

* You want to assert the resource collection after compiling the recipe.
  Borrowed from the description of rspec-puppet.
* if else logic
* Need to stub the whole chef
  * run_context
  * node object

Test according to the Chef run cycle.  An overview from
<http://docs.opscode.com/essentials_nodes_chef_run.html>.  Actual code is in
<https://github.com/opscode/chef/blob/master/lib/chef/run_context/cookbook_compiler.rb#L70-L76>.

Fake that in the run context. So do that in the unit test as well to stub the
run_context

* <https://github.com/aespinosa/asp.net-skeleton/blob/master/cookbook/test/isolated_test.rb>


## Advantages

* Fast tests
* really isolated recipes
* understanding of chef's innards
* 

## Disadvantages

* too much to stub
* Reflects on the design of chef?
* Are the tests here telling us something?
