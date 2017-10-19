class config {
  include 'config::vim'
  include 'config::fonts'
  include 'config::private'

  file { 'Touchpad gestures config':
    ensure => file,
    mode => '0644',
    path => '/etc/libinput-gestures.conf',
    source => 'puppet:///modules/config/libinput-gestures.conf'
  }

  file { 'Terminator config':
    ensure => file,
    mode => '0644',
    path => '/home/jake/.config/terminator/config',
    source => 'puppet:///modules/config/terminator.conf'
  }

  file { 'Uniemoji config':
    ensure => file,
    mode => '0644',
    path => '/home/jake/.config/uniemoji/custom.json',
    source => 'puppet:///modules/config/uniemoji.json'
  }

  file { 'Install SSH config':
    ensure => file,
    mode => '0644',
    owner => 'jake',
    path => '/home/jake/.ssh/assh.yml',
    source => 'puppet:///modules/config/assh.yml'
  }

  file { 'Install global gitignore':
    ensure => file,
    path => '/home/jake/.config/.gitignore',
    mode => '0644',
    source => 'puppet:///modules/config/gitignore_global'
  }
}
