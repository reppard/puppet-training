class apache (
    $documentroot = '/var/www/html',
  ){
  case $::osfamily {
    'redhat':{
      $httpd_user     = 'apache'
      $httpd_group    = 'apache'
      $httpd_pkg      = 'httpd'
      $httpd_svc      = 'httpd'
      $httpd_conf     = 'httpd.conf'
      $httpd_confdir  = '/etc/httpd/conf'
      $httpd_docroot  = '/var/www/html'
      $httpd_dirs     = ['/var/www','/var/www/html']
    }
    'debian':{
      $httpd_user    = 'www-data'
      $httpd_group   = 'www-data'
      $httpd_pkg     = 'apache2'
      $httpd_svc     = 'apache2'
      $httpd_conf    = 'apache2.conf'
      $httpd_confdir = '/etc/apache2'
      $httpd_docroot = '/var/www'
      $httpd_dirs    = '/var/www'
    }
    default: { fail("Your ${::osfamily} system is not supported.\n")}
  }

  File {
    ensure => file,
    owner  => $httpd_user,
    group  => $httpd_group,
    mode   => '0644',
  }

  package { $httpd_pkg:
    ensure => installed,
  }

  file { $httpd_dirs:
    ensure => directory,
  }

  file { "${documentroot}/index.html":
    content => template('apache/index.html.erb'),
  }

  file { "${httpd_confdir}/${httpd_conf}":
    owner   => 'root',
    group   => 'root',
    source  => "puppet:///modules/apache/${httpd_conf}",
    require => Package[$httpd_pkg],
    notify  => Service[$httpd_svc],
  }

  service { $httpd_svc:
    ensure => running,
    enable => true,
  }
}
