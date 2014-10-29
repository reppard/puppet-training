class hosts { 
  host { 'reppard.puppetlabs.vm':
    ensure       => present,
    ip           => '127.0.0.1',
    host_aliases => ['reppard'],
  }
}
