class yaourt::files () {
  file { '/etc/pacman.conf':
    ensure => file,
    source => 'puppet:///modules/yaourt/pacman.conf'
  }

  file { '/home/jake/.yaourtrc':
    ensure => file,
    mode => "0644",
    owner => "jake",
    group => "users",
    source => 'puppet:///modules/yaourt/.yaourtrc'
  }
}
