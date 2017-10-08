class config::git {
  file { '/home/jake/.gitignore_global':
    ensure => file,
    mode => '0644',
    source => 'puppet:///modules/config/gitignore_global'
  }

  git::config { 'global ignore' :
    key => 'core.excludesfile',
    value => '/home/jake/.gitignore_global',
    user => 'jake'
  }
}
