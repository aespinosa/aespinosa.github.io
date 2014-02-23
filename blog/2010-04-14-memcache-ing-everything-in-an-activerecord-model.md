---
comments: true
date: 2010-04-14 01:04:18
layout: post
slug: memcache-ing-everything-in-an-activerecord-model
title: memcache-ing everything in an ActiveRecord model.
wordpressid: 226
categories: Soft Hacks
tags: ruby
---

I was writing a script that was interactive with a database.  The script was being invoked 400 times by a java program.  It wasn't too happy forking too many processes at a time.  First I thought that mysql can only handle so many remote connections.  Here is my attempt to reduce database load to almost 0 percent.

[cache_fu](http://github.com/defunkt/cache_fu) was too dependent on being installed in Rails environment.  Commenting out the code which referred to Rails variables made the ruby interpreter not complain.  But according to the memcached server logs, nothing was being cached at all!  I ended up using the low-level access API [fauna](http://blog.evanweaver.com/files/doc/fauna/memcached/files/README.html).

Wrapping all the ActiveRecord::Base.find...() operations in the fauna-documented recipe, all of the SELECT * statements are now being cached.  But the problem that remains is that the models still make 'SHOW FIELDS..' queries to the database whenever the object is first invoked.  And since the script is being invoked 400 times, only bandwidth and round trip times were saved by the caching effort.

I poked through the metaprogramming examples in the pick-axe book and resulted to overriding my models like this:

`[sourcecode lang="ruby"]
require 'memcached'
require 'digest/md5'
require 'active_record'

class Variation < ActiveRecord::Base
  def self.digest
    Digest::MD5.hexdigest(self.to_s).to_s
  end

  def self.columns=(cached_columns)
    @cached_columns= cached_columns
    def self.columns
      @cached_columns
    end
    @cached_columns
  end
end

cache = Memcached.new
begin
  Variation.columns = cache.get(Variation.digest)
rescue Memcached::NotFound
  Variation.columns
  cache.set(Variation.digest, Variation.columns)
end
cache = nil


`

Now everything is cached!
