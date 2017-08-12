class common {
  user { "make me":
    name => "jake",
    allowdupe => false,
    auth_membership => "inclusive",
    comment => "Jake Howard",
    home => "/home/jake",
    shell => "/usr/bin/zsh",
    uid => "1000",
  }
}
