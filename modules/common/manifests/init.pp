class common {
  user { 'Make me':
    name => 'jake',
    allowdupe => false,
    auth_membership => 'inclusive',
    comment => 'Jake Howard',
    home => '/home/jake',
    uid => '1000',
    shell => '/usr/bin/zsh'
  }
  -> file { 'Create home directory':
    ensure => directory,
    path => '/home/jake',
    owner => 'jake'
  }

  exec {'Set Java version':
    command => 'archlinux-java set intellij-jdk',
    unless => 'archlinux-java get | grep intellij-jdk'
  }
}
