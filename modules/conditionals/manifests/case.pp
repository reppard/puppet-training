class conditionals::case {
  case $::operatingsystem {
    'centos': {
      $content = "This is a centos system.\n"
    }
    'ubuntu': {
      $content = "This is an ubuntu system.\n"
    }
    default: {
      fail("I'm sorry but ${::operatingsystem} system is not defined.\n")
    }
  }

  file { '/tmp/os':
    ensure  => file,
    content => $content,
  }
}
