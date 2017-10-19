class gnome {
  file { 'Nautilus Templates':
    ensure => directory,
    source => 'puppet:///modules/gnome/Templates',
    path => '/home/jake/Templates',
    owner => 'jake',
    group => 'users',
    mode => '0755',
    recurse => remote
  }
}
