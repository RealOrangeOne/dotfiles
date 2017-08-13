class i3 {
  include 'i3::autostart'

  file { "i3 config":
    path => '/home/jake/.config/i3/config',
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/i3/i3.conf'
  }
}
