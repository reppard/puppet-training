class hosts { 
  host { 'reppard.puppetlabs.vm reppard':
    ensure => present,
    ip     => '127.0.0.1',
  }
}
