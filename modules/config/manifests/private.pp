class config::private () {
  file { '/home/jake/.dotfiles':
    ensure => directory
  }

  file { '/home/jake/.upload':
    ensure => link,
    target => '/home/jake/.dotfiles/.upload',
    mode => '0644'
  }
}
