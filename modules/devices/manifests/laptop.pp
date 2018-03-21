class devices::laptop {
  package {[
    'ethtool',
    'smartmontools',
    'tlp'
  ]:
    ensure => installed
  }
  -> service {'tlp':
    enable => true
  }

  file { 'TLP config':
    ensure => file,
    mode   => '0644',
    path => '/etc/default/tlp',
    source => 'puppet:///modules/devices/tlp.conf'
  }
}
