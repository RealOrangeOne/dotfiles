class common {
  user { 'Make me':
    name => 'jake',
    allowdupe => false,
    auth_membership => 'inclusive',
    comment => 'Jake Howard',
    home => '/home/jake',
    uid => '1000',
  }
  -> file { 'Create home directory':
    ensure => directory,
    path => '/home/jake',
    owner => 'jake'
  }
}
