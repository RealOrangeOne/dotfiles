class config::private () {
  file { 'Check dotfiles':
    ensure => directory,
    path => '/home/jake/.dotfiles'
  }

  file { 'TUpload config':
    ensure => link,
    target => '/home/jake/.dotfiles/.upload',
    path => '/home/jake/.upload',
    mode => '0644'
  }
}
