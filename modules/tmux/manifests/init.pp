class tmux {
  file { '/root/.tmux.conf':
    ensure =>  present,
    source => 'https://raw.githubusercontent.com/reppard/dotfiles/master/tmux.conf',
  }

  package { 'tmux':
    ensure => installed,
  }
}
