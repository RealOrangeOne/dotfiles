class i3::autostart {
  $programs = [
    'gnome-keyring-pkcs11',
    'gnome-keyring-secrets',
    'gnome-keyring-ssh',
    'mousewheelzoom',
    'pulseaudio',
    'org.gnome.SettingsDaemon.XSettings',
    'org.gnome.SettingsDaemon.XRANDR',
    'org.gnome.SettingsDaemon.DiskUtilityNotify',
    'org.gnome.SettingsDaemon.Keyboard',
    'gsettings-data-convert'
  ];

  $programs.each |String $program| {
    file { "autostart $program":
      ensure => link,
      path => "/home/jake/.config/autostart/$program.desktop",
      mode => '0744',
      owner => 'jake',
      source => "/etc/xdg/autostart/$program.desktop"
    }
  }
}
