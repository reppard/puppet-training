class conditionals::in {
  file { '/tmp/os':
    ensure  => file,
    content => $::operatingsystem ? {
      'centos' => "This is a centos system.\n",
      'ubuntu' => "This is an ubuntu system.\n",
      default  => "I'm sorry but ${::operatingsystem} system is not defined.\n",
    }
  }
}
