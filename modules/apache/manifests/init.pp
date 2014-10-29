class apache {
  File {
    ensure => file,
    owner  => 'apache',
    group  => 'apache',
    mode   => '0644',
  }

  package { 'httpd':
    ensure => installed,
  }

  file { '/var/www':
    ensure => directory,
  }

  file { '/var/www/html':
    ensure => directory,
  }

  file { '/var/www/html/index.html':
    source => 'puppet:///modules/apache/index.html',
  }

  file { '/etc/httpd/conf/httpd.conf':
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/apache/httpd.conf',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

  service { 'httpd':
    ensure => running,
    enable => true,
  }
}
