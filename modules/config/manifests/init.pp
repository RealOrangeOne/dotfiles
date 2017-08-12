class config {
  include 'config::vim'

  file { '/etc/libinput-gestures.conf':
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/config/libinput-gestures.conf'
  }

  file { '/home/jake/.config/terminator/config':
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/config/terminator.conf'
  }

  file { '/home/jake/.config/uniemoji/custom.json':
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/config/uniemoji.json'
  }

  file { '/home/jake/.gitignore_global':
    ensure => file,
    mode => "0644",
    source => 'puppet:///modules/config/gitignore_global'
  }

  git::config { "global ignore" :
    key => 'core.excludesfile',
    value => '/home/jake/.gitignore_global',
    user => "jake"
  }
}
