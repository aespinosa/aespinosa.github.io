---
comments: true
date: 2014-02-16 08:13:39
layout: post
slug: manual-berkshelf-caching-on-chefspec
title: Manual berkshelf caching on chefspec
wordpressid: 354
---

Chefspec 3.2.0 introduced berkshelf integration lately.  However this will
decrease the test speed as chefspec will setup and teardown berkshelf all the
time.  

Below is a snipped to similar
[chefspec#242](https://github.com/sethvargo/chefspec/issues/242) .  But in
addition, I removed the vendoring of the cookbook in development.   Here is my
[rake task](https://github.com/aespinosa/aspnet_skeleton/blob/master/Rakefile#L9-L13)
to do that build:

    task :build do
      File.open("chefignore", "a").write("*aspnet_skeleton*")
      berksfile.install path: "vendor/cookbooks"
      FileUtils.rmdir "vendor/cookbooks/aspnet_skeleton"
    end

This approach has several advantages: [1] chefspec doesn't need to build the
vendored directory everytime rspec is invoked, [2] you can run the test against
the source code directory for a fast TDD feedback cycle, and [3]  build and test
phases for your CI pipeline can be separated.

Here's how chefspec consumes the vendored cookbook_path and
cookbook-in-development
[simultaenously](https://github.com/aespinosa/aspnet_skeleton/blob/master/spec/default_spec.rb#L6):

    RSpec.configure do |config|
      config.cookbook_path = %w(vendor/cookbooks ../)
    end
