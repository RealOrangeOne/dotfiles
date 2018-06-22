class config {
  include 'config::vim'
  include 'config::fonts'
  include 'config::private'
  include 'config::vscode'

  file { 'Touchpad gestures config':
    ensure => file,
    mode => '0644',
    path => '/etc/libinput-gestures.conf',
    source => 'puppet:///modules/config/libinput-gestures.conf'
  }

  file { 'Terminator config directory':
    ensure => directory,
    mode => '0644',
    path => '/home/jake/.config/terminator'
  }
  -> file { 'Terminator config':
    ensure => file,
    mode => '0644',
    path => '/home/jake/.config/terminator/config',
    source => 'puppet:///modules/config/terminator.conf'
  }

  file { 'Uniemoji config directory':
    ensure => directory,
    mode => '0644',
    path => '/home/jake/.config/uniemoji'
  }
  -> file { 'Uniemoji config':
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

  file { 'Git config':
    ensure => file,
    path => '/home/jake/.gitconfig',
    mode => '0644',
    owner => 'jake',
    group => 'users',
    content => template('config/gitconfig.conf.erb')
  }

  file { 'Rofi config directory':
    ensure => directory,
    mode => '0644',
    path => '/home/jake/.config/rofi'
  }
  -> file { 'Rofi config':
    ensure => file,
    mode => '0644',
    path => '/home/jake/.config/rofi/config',
    source => 'puppet:///modules/config/rofi.conf'
  }

  file { 'Touchpad configuration':
    ensure => file,
    mode => '0644',
    path => '/usr/share/X11/xorg.conf.d/30-touchpad.conf',
    source => 'puppet:///modules/config/touchpad.conf'
  }

  file { 'Caret config directory':
    ensure => directory,
    mode => '0644',
    path => '/home/jake/.config/Caret'
  }
  -> file { 'Caret configuration file':
    ensure => file,
    mode => '0644',
    path => '/home/jake/.config/Caret/Preferences.md',
    source => 'puppet:///modules/config/caret-preferences.md'
  }

  file { 'Tilix file temporary location':
    ensure => file,
    path => '/tmp/tilix.conf',
    source => 'puppet:///modules/config/tilix.conf'
  }
  -> exec { 'Load Tilix config':
    command => 'dconf load /etc/gexperts/Tilix/ < /tmp/tilix.conf',
    user => 'jake'
  }

  file { 'Alacritty config':
    ensure => file,
    owner => 'jake',
    path => '/home/jake/.config/alacritty/alacritty.yml',
    source => 'puppet:///modules/config/alacritty.yml'
  }
}
