class apache (
    $user      = $apache::params::httpd_user,
    $group     = $apache::params::httpd_group,
    $pkg       = $apache::params::httpd_pkg,
    $svc       = $apache::params::httpd_svc,
    $conf      = $apache::params::httpd_conf,
    $confdir   = $apache::params::httpd_confdir,
    $docroot   = $apache::params::httpd_docroot,
    $dirs      = $apache::params::httpd_dirs,
    $vhost_dir = $apache::params::vhost_dir,
  ) inherits apache::params {

  File {
    ensure => file,
    owner  => $user,
    group  => $group,
    mode   => '0644',
  }

  package { $pkg:
    ensure => installed,
  }

  file { $dirs:
    ensure => directory,
  }

  file { "${docroot}/index.html":
    content => template('apache/index.html.erb'),
  }

  file { "${confdir}/${conf}":
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/apache/${conf}",
    require => Package[$pkg],
    notify  => Service[$svc],
  }

  service { $svc:
    ensure => running,
    enable => true,
  }
}
