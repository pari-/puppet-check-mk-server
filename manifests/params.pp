class check_mk_server::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_ensure = 'running'
  $service_enable = true

  case $::operatingsystem {
    'Debian': {
      $package = [ 'check-mk-server', 'check-mk-multisite' ]
      $service_name = 'apache2'
      $check_config_pool = '/etc/check_mk/ccp'
      $defaults_config = '/usr/share/check_mk/modules/defaults'
      $multisite_config = '/etc/apache2/conf.d/check-mk-multisite.conf'
      $nagios3_web_config = '/etc/nagios3/apache2.conf'
      $nagios3_cgi_config = '/etc/nagios3/cgi.cfg'
      $check_mk_binary = '/usr/bin/check_mk'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::operatingsystem}\"")
    }
  }

}
