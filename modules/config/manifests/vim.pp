class config::vim {
  file { 'vimrc':
    ensure => file,
    mode   => '0644',
    owner  => 'jake',
    group  => 'users',
    path => '/home/jake/.vimrc',
    source => 'puppet:///modules/config/vimrc'
  }

  -> vcsrepo { 'Vim runtime':
    ensure => latest,
    provider => git,
    user => 'jake',
    path => '/home/jake/.vim_runtime',
    source => 'https://github.com/amix/vimrc.git',
  }
}
