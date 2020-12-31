# == Class: adcli::join
#
# Uses adcli to join to an Active Directory domain.
#
# See README.md for more details
#
class adcli::join (
  $ad_domain                 = $adcli::ad_domain,
  $ad_join_username          = $adcli::ad_join_username,
  $ad_join_password          = $adcli::ad_join_password,
  $ad_join_ou                = $adcli::ad_join_ou,
  $ad_join_domain_controller = $adcli::ad_join_domain_controller,
  $ad_join_service_names     = $adcli::ad_join_service_names,
  $ad_join_computer_name     = $adcli::ad_join_computer_name,
  $ad_join_os                = $adcli::ad_join_os,
  $ad_join_os_version        = $adcli::ad_join_os_version,
  $ad_join_os_service_pack   = $adcli::ad_join_os_service_pack

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
    if $ad_join_domain_controller != undef {
      $ad_join_domain_controller_command = " --domain-controller='${ad_join_domain_controller}'"
    } else {
      $ad_join_domain_controller_command = ''
    }
    if $ad_join_service_names != [] {
        $ad_join_service_names_command = join([" --service-name='", join($ad_join_service_names, "' --service-name='"), "'"], '')
    } else {
      $ad_join_service_names_command = ''
    }
    if $ad_join_computer_name != undef {
      $ad_join_computer_name_command = " --computer-name='${ad_join_computer_name}'"
    } else {
      $ad_join_computer_name_command = ''
    }
    if $ad_join_os != undef {
      $ad_join_os_command = " --os-name=\'${ad_join_os}\'"
    } else {
      $ad_join_os_command = ''
    }
    if $ad_join_os_version != undef {
      $ad_join_os_version_command = " --os-version=\'${ad_join_os_version}\'"
    } else {
      $ad_join_os_version_command = ''
    }
    if $ad_join_os_service_pack != undef {
      $ad_join_os_service_pack_command = " --os-service-pack=\'${ad_join_os_service_pack}\'"
    } else {
      $ad_join_os_service_pack_command = ''
    }
    exec {'adcli_join':
      command   => "/bin/echo -n \'${ad_join_password}\' | /usr/sbin/adcli join ${ad_join_domain_controller_command} \
${ad_join_computer_name_command} --login-user=\'${ad_join_username}\' --domain=\'${ad_domain}\' --domain-ou=\'${ad_join_ou}\' \
--stdin-password --verbose ${ad_join_os_command} ${ad_join_os_version_command} ${ad_join_os_service_pack_command} \
${ad_join_service_names_command}",
      logoutput => true,
      unless    => '/usr/sbin/adcli testjoin',
    }
  }
}
