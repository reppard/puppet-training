class tmux{

  #  exec { 'get source':
  #  command => "wget https://raw.githubusercontent.com/reppard/dotfiles/master/tmux.conf /tmp/tmux.conf"
  #}

  #file { '/root/.tmux.conf':
  #  ensure =>  present,
  #}

  package { 'tmux':
    ensure => installed,
  }
}
