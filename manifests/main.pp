node default {
  Exec {
    path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin']
  }

  include stdlib

  include common
  include gnome
  include config
  include shell
  include i3
}
