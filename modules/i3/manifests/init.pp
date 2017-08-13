class i3 {
  include 'i3::autostart'

  file { "i3 config":
    path => '/home/jake/.config/i3/config',
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/i3/i3.conf'
  }

  file { "i3blocks config":
    path => '/home/jake/.i3blocks.conf',
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/i3/i3blocks.conf'
  }

  file { "i3status config":
    path => '/home/jake/.config/i3/status.toml',
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/i3/i3status.toml'
  }
}
