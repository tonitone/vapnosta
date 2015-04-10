# vapnosta

**VA**grant**P**hp**NO**ode**STA**ack

Basic setup for PHP and NODE development with the following components:

* Ubuntu trusty 64
* php
 * php5-fpm
 * php5-gd
 * php5-mcrypt
 * php5-xdebug
 * composer
* nginx
* mysql
* node v0.12.2
* vim
 * gmarik/Vundle.vim
 * moll/vim-node
 * shawncplus/phpcomplete.vim
 * jistr/vim-nerdtree-tabs
 * nicoraffo/conque

## Requirements

* [Vagrant](http://www.vagrantup.com)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Installation

```sh
git clone [git-repo-url] vapnosta
cd vapnosta
# set your document_root in `setup.yaml`
# add more nginx.xyz.vhost-Files in `vhosts/`
vagrant up
vagrant ssh
# view your site localhost:8080
```

## Todo

Help me to improve

* Send mail
* PHPUnit
* ... any ideas?

## License

MIT

**Feel free**
