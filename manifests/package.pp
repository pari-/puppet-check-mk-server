class check_mk_server::package {
  if $check_mk_server::ensure == 'present' {
    $package_ensure = $check_mk_server::auto_upgrade ? {
      true  => 'latest',
      false => 'installed',
    }
  } else {
    $package_ensure = 'purged'
  }

  package {$check_mk_server::package:
    ensure          => $package_ensure,
    provider        => 'aptbpo',
    install_options => { '-t' => 'squeeze-backports' },
  }
}
