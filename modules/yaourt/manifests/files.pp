class yaourt::files () {
  file { 'Pacman config':
    ensure => file,
    source => 'puppet:///modules/yaourt/pacman.conf',
    path => '/etc/pacman.conf'
  }

  file { 'Yaourt config':
    ensure => file,
    mode => '0644',
    owner => 'jake',
    group => 'users',
    source => 'puppet:///modules/yaourt/.yaourtrc',
    path => '/home/jake/.yaourtrc'
  }
}
