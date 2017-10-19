node default {
  Exec {
    path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin']
  }

  file {'Autostart Compton':
    ensure => link,
    path => '/home/jake/.config/autostart/compton.desktop',
    mode => '0644',
    owner => 'jake',
    source => '/usr/share/applications/compton.desktop'
  }

  exec {'Set Java version':
    command => 'archlinux-java set intellij-jdk',
    unless => 'archlinux-java get | grep intellij-jdk'
  }
}
