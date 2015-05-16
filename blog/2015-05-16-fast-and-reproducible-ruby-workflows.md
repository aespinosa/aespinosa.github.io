---
title: Faster and Reproducible Ruby Development Workflows
---

If you're doing development and cloning ruby based repositories, sometimes you
want to cleanup your ruby gems spec or vendor/bundle directory.  It is important
to do a clean 'bundle install' so you won't experience "it works on my machine"
syndrome.

However, downloading gems from rubygems.org all the time is not the best
experience in the world if you have a large Gemfile or rubygems.org is down
itself.

Java developers have had this feature in maven with 'proxy repositories'.
Fortunately, you can do this same thing with [Sonatype
Nexus](https://sonatype.org/nexus).  Following the described documentation on
proxy gem repositories[^1], Have something like this configured for
rubygems.org:


```
Repository ID: rubygems
Repository Name: rubygems.org
Repository Type: proxy
Repository Policy: undefined
Repository Format: rubygems
Contained in groups: 

Remote URL: https://rubygems.org
```

Likewise, you can have this in your ~/.gemrc

```
---
:sources:
- http://127.0.0.1:8081/nexus/content/repositories/rubygems/
```

And ~/.bundle/config

```
---
BUNDLE_MIRROR__HTTPS://RUBYGEMS__ORG/: http://nexus.dev:8081/nexus/content/repositories/rubygems/
```

Now, all gem downloads will be cached in nexus. The next time you do a 'git
clean -fdx && bundle install', you don't have to wait to download the Internet
to get your Ruby builds working.  This setup is useful especially for CI servers
like Jenkins so that the next subsequent build times will be siginificantly
less.

[^1]: <http://books.sonatype.com/nexus-book/reference/ruby-proxying-registries.html>
  
