class check_mk_server::service {
  service {$check_mk_server::service_name:
    ensure     => $check_mk_server::service_ensure,
    enable     => $check_mk_server::service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
