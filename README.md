Squall [![Squall Build Status][Build Icon]][Build Status]
=========================================================

A Ruby library for working with the [OnApp REST API][].

Squall has been tested on MRI 1.8.7, MRI 1.9.2, MRI 1.9.3 Preview 1,
Rubinius 2.0.0pre, and JRuby 1.6.2.

Documentation is available in [RDoc][] format.

[Build Status]: http://travis-ci.org/site5/squall
[Build Icon]: https://secure.travis-ci.org/site5/squall.png?branch=master
[OnApp REST API]: https://help.onapp.com/manual.php?m=2
[RDoc]: http://rdoc.info/github/site5/squall/master/frames

Install
-------

    gem install squall

Usage
-----

Configure:

    require 'squall'

    Squall.config do |c|
      c.base_uri 'https://onappurl.com'
      c.username 'username'
      c.password 'topsecret'
    end

Show the info for a VM:

    vm = Squall::VirtualMachine.new
    vm.show 1

Create a new VM:

    vm = Squall::VirtualMachine.new

    params = {
      :label             => 'testmachine',
      :hypervisor_id     => 5,
      :hostname          => 'testmachine',
      :memory            => 512,
      :cpus              => 1,
      :cpu_shares        => 10,
      :primary_disk_size => 10
    }

    vm.create params

Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a
  commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2011 Site5 LLC. See LICENSE for details.
