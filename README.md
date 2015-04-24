dpkg
====

A Puppet module for managing dpkg

# Module usage

* [Class: dpkg](manifests/init.pp)
* [Class: dpkg::backup](manifests/backup.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 7 and 8
* Ubuntu 12.04 and 14.04

Any Debian derivative should work out of the box. Using this class on other 
Linux distributions or on *BSD would only make sense in some corner-cases.

For details see [params.pp](manifests/params.pp).
