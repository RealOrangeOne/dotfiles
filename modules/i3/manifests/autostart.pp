class i3::autostart {
  $programs = [
    "gnome-keyring-pkcs11",
    "gnome-keyring-secrets",
    "gnome-keyring-ssh",
    "mousewheelzoom",
  ];

  $programs.each |String $program| {
    file { "autostart $program":
      path => "/home/jake/.config/autostart/$program",
      ensure => link,
      mode => "0744",
      owner => "jake",
      source => "/etc/xdg/autostart/$program"

    }
  }
}
