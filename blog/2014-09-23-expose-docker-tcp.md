---
title: Expose Docker's TCP ports on systemd-based distributions
date: 2014-09-23
---

Useful when spawning Fedora, Centos 7, ArchLinux or CoreOS-based Docker hosts
for development on a Mac.

```
[vagrant@docker ~]$ cat /etc/systemd/system/docker.socket.d/10-tcp.conf 
[Socket]
ListenStream=5555
[vagrant@docker ~]$ 
```

Now on your OSX machine, you can use docker via "docker -H ip-of-vm:5555".

## References
  * <https://wiki.archlinux.org/index.php/systemd#Editing_provided_unit_files>
  * <https://fedoraproject.org/wiki/Systemd#How_do_I_customize_a_unit_file.2F_add_a_custom_unit_file.3F>
