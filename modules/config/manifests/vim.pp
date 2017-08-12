class config::vim {
  file { '/home/jake/.vimrc':
    ensure => file,
    mode => "0644",
    owner => "jake",
    group => "users",
    source => 'puppet:///modules/config/vimrc'
  } ->

  vcsrepo { '/home/jake/.vim_runtime':
    ensure => latest,
    provider => git,
    user => 'jake',
    source => "https://github.com/amix/vimrc.git",
  } ->

  exec { 'install vim plugins':
    command => "vim +PluginInstall +qall",
    user => "jake",
    environment => "HOME=/home/jake",
    require => Package['vim']
  }
}
