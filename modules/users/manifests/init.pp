class users {
  group { 'sysadmin':
    ensure => present,
  }

  user { 'fundementals':
    ensure     => present,
    managehome => true,
  }

  user { 'elmo':
    ensure     => present,
    gid        => 'sysadmin',
    home       => '/home/elmo',
    managehome => true,
  }
}
