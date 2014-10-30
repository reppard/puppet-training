define apache::vhost(
    $user       = $apache::user,
    $group      = $apache::group,
    $vhost      = "${title}.${fqdn}",
    $docroot    = "${apache::docroot}/${title}",
    $options    = 'Indexes MultiViews',
    $errorlog   = "logs/${vhost}-error_log",
    $accesslog  = "logs/${vhost}-access_log common",
    $dirs       = $apache::dirs,
    $vhost_dir  = $apache::vhost_dir,
  ){

  host { $vhost:
    ip => $::ipaddress,
  }

  File {
    ensure => file,
    owner  => $user,
    group  => $group,
    mode   => '0644',
  }

  file { $docroot:
    ensure => directory,
  }

  file { "${docroot}/index.html":
    content => template('apache/index.html.erb'),
  }

  file { "${vhost_dir}/${title}.conf":
    content  => template('apache/vhost.conf.erb'), 
    require => Package[$apache::pkg],
    notify  => Service[$apache::svc],
  }
}
