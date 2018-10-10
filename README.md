# puppet-adcli

[![Build Status](https://travis-ci.org/acjohnson/puppet-adcli.svg)](https://travis-ci.org/acjohnson/puppet-adcli)
[![Puppet Forge](https://img.shields.io/puppetforge/v/acjohnson/adcli.svg)](https://forge.puppetlabs.com/acjohnson/adcli)
[![Puppet Forge Downloads](https://img.shields.io/puppetforge/dt/acjohnson/adcli.svg)](https://forge.puppetlabs.com/acjohnson/adcli)
[![Puppet Forge Score](https://img.shields.io/puppetforge/f/acjohnson/adcli.svg)](https://forge.puppetlabs.com/acjohnson/adcli/scores)
[![Issue Stats](http://issuestats.com/github/acjohnson/puppet-adcli/badge/pr?style=flat)](http://issuestats.com/github/acjohnson/puppet-adcli)

#### Table of Contents

1. [Overview](#overview)
2. [Usage](#usage)
3. [Reference](#reference)
4. [Limitations](#limitations)

## Overview

This module will install the [adcli][0] package and Join Active Directory using adcli.

## Usage

This module will run 'adcli join domain' on the target node which creates a computer account in the domain for the local machine, and sets up a keytab.

Example:

```puppet
class {'::adcli':
  ad_domain        => 'ad.example.com',
  ad_join_username => 'username',
  ad_join_password => 'secret',
  ad_join_ou       => 'ou=container,dc=example,dc=com'
}

```

## Reference

`ad_domain`
Defines the Active Directory domain to join
Type: string
Default: undef

`ad_join_username`
Defines the Active Directory username to use during domain join operations.
Type: string
Default: undef

`$ad_join_password`
Defines the Active Directory password to use during domain join operations. hiera-eyaml should be used for secure storage of this password.
Type: string
Default: undef

`$ad_join_ou`
Defines the Active Directory organizational unit to use during domain join operations.
Type: string
Default: undef

`$ad_join_os`
(optional) Populates the Active Directory value for Operating System Name.
Type: string
Default: undef

`$ad_join_os_version`
(optional) Populates the Active Directory value for Operating System Version.
Type: string
Default: undef

`$ad_join_os_service_pack`
(optional) Populates the Active Directory value for Operating System Version.
Type: string
Default: undef

## Limitations

Tested on:
* RHEL & CentOS 6,7

## Credits

* This Puppet module and TravisCI layout is based on [sgnl05-sssd][1] by Gjermund Jensvoll

[0]: https://www.freedesktop.org/software/realmd/adcli/adcli.html
[1]: https://github.com/sgnl05/sgnl05-sssd
