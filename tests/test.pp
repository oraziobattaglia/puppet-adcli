class {'::adcli':
  ad_domain        => 'ad.example.com',
  ad_join_username => 'username',
  ad_join_password => 'secret',
  ad_join_ou       => 'ou=container,dc=example,dc=com'
}
