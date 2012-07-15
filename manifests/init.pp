class check_mk_server (
  $backend_name,
  $ensure             = $check_mk_server::params::ensure,
  $package            = $check_mk_server::params::package,
  $auto_upgrade       = $check_mk_server::params::auto_upgrade,
  $config             = $check_mk_server::params::config,
  $service_name       = $check_mk_server::params::service_name,
  $service_ensure     = $check_mk_server::params::service_ensure,
  $service_enable     = $check_mk_server::params::service_enable,
  $check_config_pool  = $check_mk_server::params::check_config_pool,
  $defaults_config    = $check_mk_server::params::defaults_config,
  $multisite_config   = $check_mk_server::params::multisite_config,
  $nagios3_web_config = $check_mk_server::params::nagios3_web_config,
  $check_mk_binary    = $check_mk_server::params::check_mk_binary
) inherits check_mk_server::params {

  class {'check_mk_server::package':}
  class {'check_mk_server::config':}
  class {'check_mk_server::service':}

  if $ensure == 'present' {
    Class['check_mk_server::package'] -> Class['check_mk_server::config'] ~> Class['check_mk_server::service']
  } else {
    Class['check_mk_server::service'] -> Class['check_mk_server::package']
  }
}
