Role Name
=========

This role utilizes systemd to start docker containers as systemd services.

Requirements
------------

* Docker installed
* Systemd based Linux OS

Role Variables
--------------

Take a look at the service [template](templates/sc.service).
Pay attention when defining environment variables containing a percent sign (`%`) since these are custom specifiers in systemd. Compare [Systemd notes](doc/systemd.md).

Dependencies
------------

none

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
