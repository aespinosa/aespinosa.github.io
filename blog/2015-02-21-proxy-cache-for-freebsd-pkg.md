---
title: Caching FreeBSD packages with a proxy server
---

By setting up apt-cacher-ng [^1] in you local development environment, you can save
on precious bandwidth when building Chef recipes (or any  server side stuff) on
your local machine. Below are some of the steps to get this up and running.

##  Install and configure apt-cacher-ng

In a Mac you can get it via homebrew

    brew install apt-cacher-ng

When configuring apt-cacher-ng you need to set the following

1.  Setup the freebsd repository
2.  Set Pigeonhole files for \*.txz files for packages and meta.txz,
    packagesite.txz, digests.txz for metadata files.

TLDR: Place these changes to your vanilla apt-cacher-ng configuration.

```
--- acng.conf.vanilla    2015-02-19 23:50:34.000000000 +0900
+++ acng.conf            2015-02-21 01:40:51.000000000 +0900
@@ -62,6 +62,7 @@
 Remap-epel:   file:epel_mirrors # Fedora EPEL
 Remap-slrep:  file:sl_mirrors # Scientific Linux
 Remap-gentoo: file:gentoo_mirrors.gz /gentoo ; file:backends_gentoo # Gentoo Archives
+Remap-freebsd: pkg.freebsd.org pkgmir.pkg.freebsd.org
 
 # This is usually not needed for security.debian.org because it's always the
 # same DNS hostname. However, it might be enabled in order to use hooks
@@ -170,8 +171,8 @@
 # Pigeonholing files with regular expressions (static/volatile). Can be
 # overriden here but not should not be done permanently because future update
 # of default settings would not be applied later.
-# VfilePattern = (^|.*/)(Index|Packages(\.gz|\.bz2|\.lzma|\.xz)?|InRelease|Release|Release\.gpg|custom\.gpg|mirrors.txt|Sources(\.gz|\.bz2|\.lzma|\.xz)?|release|index\.db-.*\.gz|Contents-[^/]*(\.gz|\.bz2|\.lzma|\.xz)?|pkglist[^/]*\.bz2|rclist[^/]*\.bz2|meta-release[^/]*|Translation[^/]*(\.gz|\.bz2|\.lzma|\.xz)?|MD5SUMS|SHA1SUMS|((setup|setup-legacy)(\.ini|\.bz2|\.hint)(\.sig)?)|mirrors\.lst|repo(index|md)\.xml(\.asc|\.key)?|directory\.yast|products|content(\.asc|\.key)?|media|filelists\.xml\.gz|filelists\.sqlite\.bz2|repomd\.xml|packages\.[a-zA-Z][a-zA-Z]\.gz|info\.txt|license\.tar\.gz|license\.zip|.*\.(db|files|abs)(\.tar(\.gz|\.bz2|\.lzma|\.xz))?|metalink\?repo|.*prestodelta\.xml\.gz|repodata/.*\.(xml|sqlite)(\.gz|\.bz2|\.lzma|\.xz))$|/dists/.*/installer-[^/]+/[^0-9][^/]+/images/.*
-# PfilePattern = .*(\.d?deb|\.rpm|\.drpm|\.dsc|\.tar(\.gz|\.bz2|\.lzma|\.xz)(\.gpg)?|\.diff(\.gz|\.bz2|\.lzma|\.xz)|\.jigdo|\.template|changelog|copyright|\.udeb|\.debdelta|\.diff/.*\.gz|(Devel)?ReleaseAnnouncement(\?.*)?|[a-f0-9]+-(susedata|updateinfo|primary|deltainfo).xml.gz|fonts/(final/)?[a-z]+32.exe(\?download.*)?|/dists/.*/installer-[^/]+/[0-9][^/]+/images/.*)$
+VfilePattern = (^|.*/)((meta|packagesite|digests)\.txz|Index|Packages(\.gz|\.bz2|\.lzma|\.xz)?|InRelease|Release|Release\.gpg|custom\.gpg|mirrors.txt|Sources(\.gz|\.bz2|\.lzma|\.xz)?|release|index\.db-.*\.gz|Contents-[^/]*(\.gz|\.bz2|\.lzma|\.xz)?|pkglist[^/]*\.bz2|rclist[^/]*\.bz2|meta-release[^/]*|Translation[^/]*(\.gz|\.bz2|\.lzma|\.xz)?|MD5SUMS|SHA1SUMS|((setup|setup-legacy)(\.ini|\.bz2|\.hint)(\.sig)?)|mirrors\.lst|repo(index|md)\.xml(\.asc|\.key)?|directory\.yast|products|content(\.asc|\.key)?|media|filelists\.xml\.gz|filelists\.sqlite\.bz2|repomd\.xml|packages\.[a-zA-Z][a-zA-Z]\.gz|info\.txt|license\.tar\.gz|license\.zip|.*\.(db|files|abs)(\.tar(\.gz|\.bz2|\.lzma|\.xz))?|metalink\?repo|.*prestodelta\.xml\.gz|repodata/.*\.(xml|sqlite)(\.gz|\.bz2|\.lzma|\.xz))$|/dists/.*/installer-[^/]+/[^0-9][^/]+/images/.*
+PfilePattern = .*(\.d?deb|\.rpm|\.drpm|\.txz|\.dsc|\.tar(\.gz|\.bz2|\.lzma|\.xz)(\.gpg)?|\.diff(\.gz|\.bz2|\.lzma|\.xz)|\.jigdo|\.template|changelog|copyright|\.udeb|\.debdelta|\.diff/.*\.gz|(Devel)?ReleaseAnnouncement(\?.*)?|[a-f0-9]+-(susedata|updateinfo|primary|deltainfo).xml.gz|fonts/(final/)?[a-z]+32.exe(\?download.*)?|/dists/.*/installer-[^/]+/[0-9][^/]+/images/.*)$
 # 
 # Whitelist for expiration, file types not to be removed even when being
 # unreferenced. Default: many parts from VfilePattern where no parent index
/usr/local/etc/apt-cacher-ng$ vagrant plugin list
```

Finally run apt-cacher-ng like as follows on your mac

   launchctl load /usr/local/opt/apt-cacher-ng/homebrew.mxcl.apt-cacher-ng.plist

## Update your base vagrant box

I am using Chef's FreeBSD 10.1 basebox [^2] from its bento repository [^3] here.  I modify
the Vagrantfile in the basebox as follows.  

```
Vagrant.configure '2' do |config|
  config.vm.provision 'shell', inline: <<-eos
#!/bin/sh
mkdir -p /usr/local/etc/pkg/repos
cat > /usr/local/etc/pkg/repos/freebsd.conf <<EOF
FreeBSD { url: "pkg+http://<ip-of-mac-vagrant-host>:3142/pkg.FreeBSD.org/\\${ABI}/latest" }
EOF
  eos
end
```

The basebox' Vagrantfile is found in
`~/.vagrant.d/boxes/chef-VAGRANTSLASH-freebsd10.1/0/vmware_desktop/Vagrantfile` in my case.


[^1]: <https://www.unix-ag.uni-kl.de/~bloch/acng/>
[^2]: <http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_freebsd-10.1_chef-provisionerless.box>
[^3]: <https://github.com/chef/bento> 
