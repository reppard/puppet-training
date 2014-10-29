class tmux{

  exec { 'get source':
    command => "/usr/bin/wget -O /tmp/tmux.conf https://raw.githubusercontent.com/reppard/dotfiles/master/tmux.conf"
  }
  ->
  file { '.tmux.conf':
    path   => '/root/.tmux.conf',
    source => '/tmp/tmux.conf',
    ensure =>  present,
  }

  package { 'tmux':
    ensure => installed,
  }
}
