class i3::autostart {
  $programs = [
    'gnome-keyring-pkcs11',
    'gnome-keyring-secrets',
    'gnome-keyring-ssh',
    'pulseaudio',
    'org.gnome.SettingsDaemon.XSettings',
    'org.gnome.SettingsDaemon.DiskUtilityNotify',
    'org.gnome.SettingsDaemon.Keyboard',
    'gsettings-data-convert',
    'tracker-extract',
    'tracker-miner-apps',
    'tracker-miner-fs',
    'tracker-miner-rss',
    'tracker-store',
    'nm-applet'
  ];

  $programs.each |String $program| {
    file { "Autostart $program":
      ensure => link,
      path => "/home/jake/.config/autostart/$program.desktop",
      mode => '0644',
      owner => 'jake',
      source => "/etc/xdg/autostart/$program.desktop"
    }
  }

  file {'Autostart Compton':
    ensure => link,
    path => '/home/jake/.config/autostart/compton.desktop',
    mode => '0644',
    owner => 'jake',
    source => '/usr/share/applications/compton.desktop'
  }
}
