class i3::autostart {
  $programs = [
    'pulseaudio',
    'org.gnome.SettingsDaemon.XSettings',
    'org.gnome.SettingsDaemon.DiskUtilityNotify',
    'org.gnome.SettingsDaemon.Keyboard',
    'gsettings-data-convert',
    'nm-applet',
    'lxpolkit',
    'solaar'
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

  file {'Autostart libinput-gestures':
    ensure => link,
    path => '/home/jake/.config/autostart/libinput-gestures.desktop',
    mode => '0644',
    owner => 'jake',
    source => '/usr/share/applications/libinput-gestures.desktop'
  }

  file {'Install powertop service':
    ensure => link,
    path => '/etc/systemd/system/powertop.service',
    mode => '0644',
    owner => 'root',
    source => 'puppet:///modules/i3/powertop.service'
  }
}
