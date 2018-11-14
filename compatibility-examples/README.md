# OpenSSH Examples

With some changes in your `~/.ssh/config`, you can use Teleport with anything that supports the `ProxyCommand` directive.

## `~/.ssh/config` changes

Following [the section in the guide](https://gravitational.com/teleport/docs/admin-guide/#using-teleport-with-openssh) add something to your `~/.ssh/config` similar to:

```conf
Host <your proxy>
     StrictHostKeyChecking no
     UserKnownHostsFile /dev/null
     CheckHostIP no
     CertificateFile ~/.tsh/keys/<your proxy>/<username>-cert.pub
     IdentityFile  ~/.tsh/keys/<your proxy>/<username>

Host *.example.com
     StrictHostKeyChecking no
     UserKnownHostsFile /dev/null
     CheckHostIP no
     User <remote_user>
     Port 3022
     ProxyCommand ssh -p 3023 <remote_user>@<your proxy> -s proxy:%h:%p
```

[OpenSSH](https://www.openssh.com), [Net::SSH](https://github.com/net-ssh/net-ssh), [Paramiko](http://www.paramiko.org) and [Ansible](https://www.ansible.com) will be able to parse these options
and route your connection through Teleport.

## Examples

```sh
  $ env HOST=<hostname> ruby example.rb
  $ inspec exec inspec_emacs.rb -t ssh://<hostname>:3022
```
