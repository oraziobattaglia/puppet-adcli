# == Class: adcli::install
#
# Installs the adcli package.
#
# See README.md for more details
#
class adcli::install {

  package { 'adcli':
    ensure => present,
  }
}
