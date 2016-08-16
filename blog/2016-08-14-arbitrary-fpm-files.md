---
title: Arbitrary files in fpm-built packages
---


This approach was originally shared in the [FPM Mailing list](https://groups.google.com/forum/#!topic/fpm-users/Ic8px0h0nHY).

The example below creates a symlink file inside my ffi-rmzq-core debian package:

```
mq = FPM::Package::Gem.new
mq.input 'ffi-rzmq-core'

FileUtils.mkdir_p mq.staging_path 'var/lib/gems/2.1.0/gems/ffi-rzmq-core-1.0.5/ext'

mq.dependencies << "libzmq3"

# The actual shared object in the libzmq3 Debian package
FileUtils.ln_s '/usr/lib/x86_64-linux-gnu/libzmq.so.3.1.0', mq.staging_path('var/lib/gems/2.1.0/gems/ffi-rzmq-core-1.0.5/ext/libzmq.so')

mq.convert(FPM::Package::Deb).output './foo.deb'
```

The key to this approach is messing around with the `FPM::Package#staging_path`
and insert the files you need there.  In theory, you can merge two input package
types in fpm by making them share the `#staging_path`.  I will write a post about it
once I used this approach in an actual project.
