class devices::laptop {
  package {[
    'ethtool',
    'smartmontools',
    'tlp',
    'nvidia',
    'nvidia-settings',
    'bumblebee',
    'bbswitch'
  ]:
    ensure => installed
  }
  -> service {'tlp':
    enable => true
  }
  -> user { 'Update user groups':
    name => 'jake',
    groups => [
      'input',
      'users',
      'wheel',
      'bumblebee'
    ]
  }
  -> service { 'bumblebeed':
    enable => true
  }
  -> kmod::load { 'nvidia': }

  file { 'TLP config':
    ensure => file,
    mode   => '0644',
    path => '/etc/default/tlp',
    source => 'puppet:///modules/devices/tlp.conf'
  }
}
