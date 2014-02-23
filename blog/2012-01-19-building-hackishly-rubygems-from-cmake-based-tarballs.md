---
comments: true
date: 2012-01-19 02:06:12
layout: post
slug: building-hackishly-rubygems-from-cmake-based-tarballs
title: Building (hackishly) rubygems from CMake-based tarballs
wordpressid: 276
categories: Soft Hacks
tags: ruby
---

Here is my attempt was making a user-space bundle install of the SimGrid's Ruby bindings.  I created a gemspec for the source tarball in a hackish way.  Basically I just made a system "cmake ." call in the extconf.rb file when building the gem extensions.  Here's the result:

```
$ cat Gemfile
source :rubygems

gem "simgrid-ruby"
$ SIMGRID_ROOT=/opt/simgrid-3.6.2 bundle install --path vendor
...
...
make install
[ 66%] Built target SG_ruby
[100%] Built target SG_rubydag
Install the project...
-- Install configuration: ""
CMake Error at cmake_install.cmake:47 (FILE):
 file cannot create directory: /usr/local/ruby/1.9.1/x86_64-linux.  Maybe
 need administrative privileges.


make: *** [install] Error 1

-edit Gemfile
$ cat Gemfile
source :rubygems

gem "simgrid-ruby", :path => "~/tmp/simgrid-ruby" # where I have
simgrid-ruby.git cloned
$ SIMGRID_ROOT=/opt/simgrid-3.6.2 bundle install
/home/aespinosa/LocalDisk/opt/ruby/lib/ruby/1.9.1/yaml.rb:56:in `':
Using simgrid-ruby (0.0.4890e3f) from source at ~/tmp/simgrid-ruby
Using bundler (1.0.21)
Updating .gem files in vendor/cache
 * simgrid-ruby at `~/tmp/simgrid-ruby` will not be cached.
Your bundle is complete! It was installed into ./vendor
$ cd vendor/ruby/1.9.1/gems/simgrid-ruby-0.0.4890e3f/examples/
$ bundle exec ruby MasterSlave.rb
Tremblay:Master:(1) 0.000000] [ruby/INFO] args[0]=20
[Tremblay:Master:(1) 0.000000] [ruby/INFO] args[1]=50000000
[Tremblay:Master:(1) 0.000000] [ruby/INFO] args[2]=1000000
[Tremblay:Master:(1) 0.000000] [ruby/INFO] args[3]=4
[Tremblay:Master:(1) 0.000000] [ruby/INFO] Master Sending Task_0 to
slave 0 with Compute Size 50000000.0
[Tremblay:Master:(1) 0.215872] [ruby/INFO] Master Sending Task_1 to
slave 1 with Compute Size 50000000.0
[Tremblay:Master:(1) 0.381834] [ruby/INFO] Master Sending Task_2 to
slave 2 with Compute Size 50000000.0
...
...
[Bourassa:Slave:(2) 6.234851] [ruby/INFO] Slave 'slave 0' done
executing task Task_16.
[Fafard:Slave:(4) 6.243210] [ruby/INFO] Slave 'slave 2' done executing
task Task_18.
[Ginette:Slave:(5) 6.759426] [ruby/INFO] Slave 'slave 3' done
executing task Task_19.
[Tremblay:Master:(1) 6.772657] [ruby/INFO] Master : Everything's Done
Simulation time : 6.77266
$
```

Sort of works!  Basically since rubygems installed the entire manifest (I placed
everything in the tarball) on the gem directory, the lib/*.so and lib/*.rb files
somehow fall in place.
Problems arise in the build when the gem installer cannot replace the
RUBYARCHDIR string in the Makefile to install it in isolation
(<https://github.com/rubygems/rubygems/blob/master/lib/rubygems/ext/builder.rb>)

I made a fork of a repository with the gemspec package in
https://github.com/aespinosa/simgrid-ruby .  For now this
hackish-setup satisfies my needs of a user-space installation of
simgrid-ruby bindings.

