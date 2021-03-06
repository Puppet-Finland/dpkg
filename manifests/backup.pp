#
# == Class: dpkg::backup
#
# Dump the list of installed packages into the local backup directory. This 
# class depends on the 'localbackups' class.
#
# == Parameters
#
# [*ensure*]
#   Status of the backup job. Either 'present' or 'absent'. Defaults to 
#   'present'.
# [*output_dir*]
#   The directory where to output the files. Defaults to /var/backups/local.
# [*hour*]
#   Hour(s) when the package list is backed up. Defaults to '5'.
# [*minute*]
#   Minute(s) when the package list is backed up. Defaults to '50'.
# [*weekday*]
#   Weekday(s) when the package list is backed up. Defaults to * (all weekdays).
# [*email*]
#   Email address where notifications are sent. Defaults to the top-scope 
#   variable $::servermonitor.
#
# == Examples
#
#   class { 'dpkg::backup':
#       ensure     => 'present',
#       output_dir => '/my/backup/dir',
#       hour       => '18',
#       minute     => '15',
#       weekday    => '*',
#   }
#
class dpkg::backup
(
    $ensure = 'present',
    $output_dir = '/var/backups/local',
    $hour = '05',
    $minute = '50',
    $weekday = '*',
    $email = $::servermonitor

) inherits dpkg::params
{

    # This class will only work on Debian family of operating systems
    if $::osfamily == 'Debian' {

        include ::dpkg

        $cron_command = "dpkg --get-selections|gzip > ${output_dir}/dpkg-selections.txt.gz"

        cron { 'dpkg-backup-cron':
            ensure      => $ensure,
            command     => $cron_command,
            user        => root,
            hour        => $hour,
            minute      => $minute,
            weekday     => $weekday,
            environment => ["MAILTO=${email}"],
        }
    }
}
