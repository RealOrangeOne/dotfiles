node default {
  Exec {
    path => ['/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin']
  }

  include stdlib

  include common
  include yaourt
  include gnome
  include config
  include shell
}
