# == Class: adcli::join
#
# Uses adcli to join to an Active Directory domain.
#
# See README.md for more details
#
class adcli::join (
  $ad_domain        = $adcli::ad_domain,
  $ad_join_username = $adcli::ad_join_username,
  $ad_join_password = $adcli::ad_join_password,
  $ad_join_ou       = $adcli::ad_join_ou,
  $ad_join_os       = $adcli::ad_join_os,
  $ad_join_os_version = $adcli::ad_join_os_version,
  $ad_join_os_service_pack = $adcli::ad_join_os_service_pack

) {
  if $ad_domain == undef {
    notify {'For Active Directory join to work you must specify the ad_domain parameter.':}
  }
  elsif $ad_join_username == undef {
    notify {'For Active Directory join to work you must specify the ad_join_username parameter.':}
  }
  elsif $ad_join_password == undef {
    notify {'For Active Directory join to work you must specify the ad_join_password parameter.':}
  }
  elsif $ad_join_ou == undef {
    notify {'For Active Directory join to work you must specify the ad_join_ou parameter.':}
  }
  else {
    if $ad_join_os != undef {
      $ad_join_os_command = " --os-name=\'${ad_join_ou}\'"
    }
    if $ad_join_os_version != undef {
      $ad_join_os_version_command = " --os-version=\'${ad_join_os_version}\'"
    }
    if $ad_join_os_service_pack != undef {
      $ad_join_os_service_pack_command = " --os-service-pack=\'${ad_join_os_service_pack}\'"
    }
#    notify {" ad_join_ou parameter: $ad_domain":}
#    notify {" ad_join_os parameter: $ad_join_os":}
#    notify {" ad_join_os_version parameter: $ad_join_os_version":}
#    notify {" ad_join_os_service_pack parameter: $ad_join_os_service_pack":}
    exec {'adcli_join':
      command   => "/bin/echo -n \'${ad_join_password}\' | /usr/sbin/adcli join --login-user=\'${ad_join_username}\' \
--domain=\'${ad_domain}\' --domain-ou=\'${ad_join_ou}\' --stdin-password --verbose --os-name=\'${ad_join_os}\'       \
--os-version=\'${ad_join_os_version}\' --os-service-pack=\'${ad_join_os_service_pack}\'",
      logoutput => true,
      creates   => '/etc/krb5.keytab',
    }
  }
}
