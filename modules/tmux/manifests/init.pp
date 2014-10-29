class tmux{

  exec { 'get source':
    command => "/usr/bin/wget -O /tmp/tmux.conf https://raw.githubusercontent.com/reppard/dotfiles/master/tmux.conf"
  }
  ->
  file { '.tmux.conf':
    ensure =>  file,
    path   => '/root/.tmux.conf',
    source => '/tmp/tmux.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0440',
  }

  package { 'tmux':
    ensure => installed,
  }
}
