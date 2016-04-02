---
title: Bootstrapping a Chef Server headlessly
---

The steps for installing a standalone Chef server[^1] involves downloading the
admin and validation private keys to complete the setup. This means that you
need some file transfer mechanism from your server like SSH.  I will show below
how to skip these steps and use existing private keys that is already installed
in your Chef workstation instead.  The advantage of this approach is that you
only have a single key for all your Chef server deployments including a Hosted
Chef server account.

## Preparation

We assume that you already have your workstation's client.pem and validation.pem
downloaded. Obtain their public keys and save them for later

    $ openssl rsa -in ~/.chef/client.pem -pubout > client.pub
    $ openssl rsa -in ~/.chef/validation.pem -pubout > validation.pub

For truly loginless setups, you can safely paste these public keys in the
   startup scripts/ user data field on your Cloud provider.

After following steps 1-4[^1], use the following steps instead:

## Setup the user

1. Create the admin user but redirect the private key destination to
   `/dev/null`.  We don't need it at all

        $ chef-server-ctl user-create username FirstName LastName \
            email@domain password -f /dev/null

2. Delete the use client key.

        $ chef-server-ctl delete-user-key username default

3. Finally, add a default user key again with the `client.pub` string we generated
   earlier. 

        $ chef-server-ctl add-user-key username --key-name default \
            --pub-key-path client.pub


## Setup the organization

We will use a similar approach for the organization's validation key.

1.  Create the organization and send its private key to `/dev/null` as well.

        $ chef-server-ctl org-create orgname OrgFullName -a username -f /dev/null

2.  Delete the validation client key. By default the name of the validation
    client is `<orgname>-validator`.

        $ chef-server-ctl delete-client-key orgname orgname-validator default

3.  Add the validation public key we extracted earlier.

        $ chef-server-ctl add-client-key orgname orgname-validator \
            --key-name default --pub-key-path validation.pub

[^1]: <https://docs.chef.io/install_server.html#standalone.html>
