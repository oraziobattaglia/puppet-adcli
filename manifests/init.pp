# == Class: adcli
#
# Installs the adcli package and Joins Active Directory using adcli.
#
# === Parameters
#
# [*ad_domain*]
#   Active Directory domain to join using adcli.
#   Required: true
#   Default: undef
#
# [*ad_join_username*]
#   Username to use during AD join operation.
#   Required: true
#   Default: undef
#
# [*ad_join_password*]
#   Password to use during AD join operation.
#   Required: true
#   Default: undef
#
# [*ad_join_ou*]
#   OU to use for computer account creation during AD join operation.
#   Required: true
#   Default: undef
#
# === Examples
#
# class {'::adcli':
#   ad_domain        => 'ad.example.com',
#   ad_join_username => 'username',
#   ad_join_password => 'secret',
#   ad_join_ou       => 'ou=container,dc=example,dc=com'
# }
#
# === Authors
#
# Aaron Johnson <acjohnson@pcdomain.com>
#
# === Copyright
#
# Copyright 2016 Aaron Johnson
#
class adcli (
  Optional[String] $ad_domain                 = undef,
  Optional[String] $ad_join_username          = undef,
  Optional[String] $ad_join_password          = undef,
  Optional[String] $ad_join_ou                = undef,
  Optional[String] $ad_join_domain_controller = undef,
  Array $ad_join_service_names                = [],
  Optional[String] $ad_join_computer_name     = undef,
  Optional[String] $ad_join_os                = undef,
  Optional[String] $ad_join_os_version        = undef,
  Optional[String] $ad_join_os_service_pack   = undef,
) {

  if $facts['os']['family'] == 'RedHat' and $facts['os']['release']['major'] < '6' {
    fail("Unsupported platform: puppet-adcli does not currently support RedHat ${facts['os']['release']['major']}")
  }

  anchor { 'adcli::begin': }
  -> class { '::adcli::install': }
  -> class { '::adcli::join': }
  -> anchor { 'adcli::end': }

}
