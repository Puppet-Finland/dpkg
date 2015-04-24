#
# == Class: dpkg::params
#
# Defines some variables based on the operating system
#
class dpkg::params {

    case $::osfamily {
        'Debian': { }
        default: {
            fail("Unsupported operating system ${::osfamily}")
        }
    }
}
