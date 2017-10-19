class config::git {
  $global_gitignore = '/home/jake/.config/.gitignore'

  file { $global_gitignore:
    ensure => file,
    mode => '0644',
    source => 'puppet:///modules/config/gitignore_global'
  }
}
