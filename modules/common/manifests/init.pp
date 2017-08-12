class common {
  user { "make me":
    name => "jake",
    allowdupe => false,
    auth_membership => "inclusive",
    comment => "Jake Howard",
    home => "/home/jake",
    uid => "1000",
  } ->

  file { "create home":
    path => "/home/jake",
    ensure => directory,
    owner => "jake"
  }
}
