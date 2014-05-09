---
title: Workarounds to converge test-kitchen on Windows guests
---

Below are a few hacks I did to get "test-kitchen converge" runs to test my
windows cookbooks.

## Invoke the cmd.exe interpreter explicitly

By default test-kitchen relies on ssh to run commands.  Logging in via
cygwin-ssh gives you a plain bourne shell.  This has its own issues in running
the chef-client.

EDIT: I need to test this workflow again on Vagrant 1.6.x that has native support
for windows guest.

```
--- a/lib/kitchen/provisioner/chef_zero.rb   2014-05-08 00:12:12.971562743 +0900
+++ b/lib/kitchen/provisioner/chef_zero.rb   2014-05-08 00:10:44.612041428 +0900
@@ -69,7 +69,7 @@
         end

         if local_mode_supported?
-          ["#{sudo('chef-client')} -z"].concat(args).join(" ")
+          ["#{sudo('cmd /c chef-client')} -z"].concat(args).join(" ")
         else
           [
             chef_client_zero_env,
```

Related blockers.

  * Ticket concerning invoking the chef-client script inside cygwin <https://tickets.opscode.com/browse/CHEF-4290>
  * Main windows issue tracker for test-kitchen <https://github.com/test-kitchen/test-kitchen/issues/158>

## Change the base path

Otherwise the chef-client can't recognize the paths it receives from
test-kitchen.

```
---
provisioner:
  name: chef_zero
  sudo: false
  root_path: c:/Windows/Temp
```

## References
1.  Windows 2012 R2 base image used for testing <https://github.com/joefitzgerald/packer-windows>
