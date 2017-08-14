class i3 {
  include 'i3::autostart'

  file { "i3 config":
    path => '/home/jake/.config/i3/config',
    ensure => file,
    mode => "0644",
    owner => "jake",
    group => "users",
    source => 'puppet:///modules/i3/i3.conf'
  }

  file { "i3status-rust config":
    path => '/home/jake/.config/i3/status.toml',
    ensure => file,
    mode => "0644",
    owner => "jake",
    group => "users",
    source => 'puppet:///modules/i3/i3status-rust.toml'
  }

  file { "i3status config":
    path => '/home/jake/.config/i3status/config',
    ensure => file,
    mode => "0644",
    owner => "jake",
    group => "users",
    source => 'puppet:///modules/i3/i3status.conf'
  }
}
