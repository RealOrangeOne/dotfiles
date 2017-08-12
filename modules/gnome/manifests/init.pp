class gnome {
  file { '/home/jake/Templates':
    ensure => directory,
    source => 'puppet:///modules/gnome/Templates',
    owner => "jake",
    group => "users",
    mode => "0755",
    recurse => remote
  }

  exec { 'show battery percentage':
    user => "jake",
    command => 'gsettings set org.gnome.desktop.interface show-battery-percentage true'
  }
}
