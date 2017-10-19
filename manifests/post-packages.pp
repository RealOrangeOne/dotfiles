node default {
  file {'autostart compton':
    ensure => link,
    path => '/home/jake/.config/autostart/compton.desktop',
    mode => '0644',
    owner => 'jake',
    source => '/usr/share/applications/compton.desktop'
  }
}
