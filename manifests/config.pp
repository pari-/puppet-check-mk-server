class check_mk_server::config {
  exec {'rewrite_url_prefix':
    command => "sed -i -e \"s|url_prefix.*|url_prefix                  = \'/${check_mk_server::backend_name}/\'|\" ${check_mk_server::defaults_config}",
    path    => '/bin:/usr/bin',
    onlyif  => "test `grep -q \"${check_mk_server::backend_name}\" ${check_mk_server::defaults_config}; echo \"\$?\"` -eq 1",
  }

  exec {'rewrite_check_mk_alias':
    command => "sed -i -e 's|Alias [^ ]\+ [^ ]\+|Alias /${check_mk_server::backend_name}/check_mk /usr/share/check_mk/web/htdocs|' ${check_mk_server::multisite_config}",
    path    => '/bin/:/usr/bin',
    onlyif  => "test `grep -q \"${check_mk_server::backend_name}\" ${check_mk_server::multisite_config}; echo \"\$?\"` -eq 1",
  }

  exec {'rewrite_nagios3_web_config':
    command => "sed -i -e 's|\(.*\)Alias \(.*\)|\1Alias /${check_mk_server::backend_name}\2|' ${check_mk_server::nagios3_web_config}",
    path    => '/bin/:/usr/bin',
    onlyif  => "test `grep -q \"Alias /${check_mk_server::backend_name}\" ${check_mk_server::nagios3_web_config}; echo \"$?\"` -eq 1",
  }
  
  exec {'rewrite_nagios3_url_html_path':
    command => "sed -i -e 's|url_html_path=\(.*\)|url_html_path=/${check_mk_server::backend_name}/nagios3|' ${check_mk_server::nagios3_cgi_config}",
    path    => '/bin/:/usr/bin',
    onlyif  => "test `grep -q \"url_html_path=/${check_mk_server::backend_name}/nagios3\" ${check_mk_server::nagios3_cgi_config}; echo \"$?\"` -eq 1",
  }

  exec {'reload_check_mk':
    command     => 'check_mk -O',
    path        => '/bin/:/usr/bin',
    refreshonly => true,
  }

  File <<| tag == $check_mk_server::backend_name |>> {
    notify => Exec['reload_check_mk'],
  }
}

