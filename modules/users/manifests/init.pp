class users {
  user { 'fundementals':
    ensure     => present,
    managehome => true,
  }
}
