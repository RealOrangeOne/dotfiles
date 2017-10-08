class config {
  include 'config::vim'
  include 'config::git'
  include 'config::fonts'

  file { '/etc/libinput-gestures.conf':
    ensure => file,
    mode => '0644',
    source => 'puppet:///modules/config/libinput-gestures.conf'
  }

  file { '/home/jake/.config/terminator/config':
    ensure => file,
    mode => '0644',
    source => 'puppet:///modules/config/terminator.conf'
  }

  file { '/home/jake/.config/uniemoji/custom.json':
    ensure => file,
    mode => '0644',
    source => 'puppet:///modules/config/uniemoji.json'
  }
}
