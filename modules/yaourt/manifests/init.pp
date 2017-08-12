class yaourt {
  include 'yaourt::packages'

  include 'yaourt::keys'

  file { '/etc/pacman.conf':
    ensure => file,
    source => 'puppet:///modules/yaourt/pacman.conf'
  }
}
