class apache {
  package { 'httpd':
    ensure => installed,
    before => Service['httpd'],
  }

  file { '/var/www':
    ensure => directory,
  }

  file { '/var/www/html':
    ensure => directory,
  }

  file { '/var/www/html/index.html':
    ensure => file,
    source => 'puppet:///modules/apache/index.html',
  }

  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    source  => 'puppet:///modules/apache/httpd.conf',
    require => Package['httpd'],
  }

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }
}
