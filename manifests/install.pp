# == Class: ipmi::install
#
# This class should be considered private.
#
class ipmi::install {
  package { $ipmi::params::ipmi_package:
    ensure => present,
  }
  ->
  file_line { 'init_default_start':
    ensure => present,
    path   => '/etc/init.d/openipmi',
    line   => '# Default-Start: 2 3 4 5',
    match  => '^# Default-Start',
  }
  ->
  file_line { 'init_default_stop':
    ensure => present,
    path   => '/etc/init.d/openipmi',
    line   => '# Default-Stop: 0 1 6',
    match  => '^# Default-Stop',
  }
}
