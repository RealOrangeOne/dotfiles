class shell {
  $zshrc = '/home/jake/.zshrc'

  $files = [
    'puppet:///modules/shell/.zshrc',
    'puppet:///modules/shell/base.sh',
    'puppet:///modules/shell/applications.sh',
    'puppet:///modules/shell/catfish.sh',
    'puppet:///modules/shell/javascript.sh',
    'puppet:///modules/shell/environment.sh'
  ];

  concat {'zshrc':
    path => $zshrc,
    owner => 'jake',
    group => 'users',
    mode => '0644',
    ensure_newline => true
  }

  $files.each |String $file| {
    concat::fragment {"zshrc concat $file":
      target => $zshrc,
      source => $file
    }
  }

  file { 'nvm config directory':
    ensure => directory,
    owner => 'jake',
    group => 'users',
    mode => '0644',
    path => '/home/jake/.nvm'
  }
  -> file {'nvm':
    path => '/home/jake/.nvm/nvm.sh',
    owner => 'jake',
    group => 'users',
    mode => '0755',
    source => '/usr/share/nvm/init-nvm.sh'
  }

  file { 'Custom binaries':
    ensure => directory,
    source => 'puppet:///modules/shell/bin',
    path => '/home/jake/.bin',
    owner => 'jake',
    group => 'users',
    mode => '0755',
    recurse => remote
  }

  file { 'Global Environment':
    ensure => file,
    mode => '0644',
    owner => 'root',
    group => 'root',
    source => 'puppet:///modules/shell/global-environment',
    path => '/etc/environment'
  }

  file { 'tmux config':
    ensure => file,
    owner => 'jake',
    group => 'users',
    mode => '0755',
    source => 'puppet:///modules/shell/tmux.conf',
    path => '/home/jake/.tmux.conf'
  }
}
