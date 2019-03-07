# == Class: adcli::params
#
# Default paramater values for puppet-adcli module
#
# See README.md for more details
#
class adcli::params {

  # ----------------------------------------------------------------------------
  #  Parameters :: adcli
  # ----------------------------------------------------------------------------

  $ad_domain                 = undef
  $ad_join_username          = undef
  $ad_join_password          = undef
  $ad_join_ou                = undef
  $ad_join_domain_controller = undef
  $ad_join_os                = undef
  $ad_join_os_version        = undef
  $ad_join_os_service_pack   = undef


  if $::osfamily == 'RedHat' and $::operatingsystemmajrelease < '6' {
    fail("Unsupported platform: puppet-adcli does not currently support RedHat ${::operatingsystemmajrelease}")
  }
}
