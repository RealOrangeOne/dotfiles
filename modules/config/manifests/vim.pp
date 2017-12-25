class config::vim {
  file { 'vimrc':
    ensure => file,
    mode   => '0644',
    owner  => 'jake',
    group  => 'users',
    path => '/home/jake/.vimrc',
    source => 'puppet:///modules/config/vimrc'
  }

  -> file { 'vimrc for root':
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'users',
    path => '/root/.vimrc',
    source => 'puppet:///modules/config/vimrc'
  }

  -> vcsrepo { 'Vim runtime':
    ensure => latest,
    provider => git,
    user => 'root',
    path => '/usr/share/amix_vimrc',
    source => 'https://github.com/amix/vimrc.git',
  }
}
