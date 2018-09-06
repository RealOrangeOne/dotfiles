class config::vscode {
  $extensions = [
    'PKief.material-icon-theme',
    'PeterJausovec.vscode-docker',
    'Zignd.html-css-class-completion',
    'bitzl.vscode-puppet',
    'bogdan-sinitsa.theme-dark-monokai',
    'christian-kohler.npm-intellisense',
    'dbaeumer.vscode-eslint',
    'eamodio.gitlens',
    'eg2.tslint',
    'eg2.vscode-npm-script',
    'formulahendry.code-runner',
    'ionutvmi.path-autocomplete',
    'magicstack.MagicPython',
    'mrmlnc.vscode-less',
    'mrmlnc.vscode-scss',
    'ms-python.python',
    'ms-vscode.sublime-keybindings',
    'rokoroku.vscode-theme-darcula',
    'steoates.autoimport',
    'truman.autocomplate-shell',
    'wholroyd.jinja',
    'zolocode.editorzoom',
    'formulahendry.auto-close-tag',
    'James-Yu.latex-workshop',
    'ban.spellright',
    'editorconfig.editorconfig',
    'batisteo.vscode-django',
    'davidanson.vscode-markdownlint',
    'vsciot-vscode.vscode-arduino',
    'vscoss.vscode-ansible',
    'rust-lang.rust'
  ];

  $extensions.each |String $extension| {
    exec { "Install $extension extension for VSCode":
      command => "code --install-extension $extension",
      unless => "code --list-extensions | grep $extension",
      user => 'jake'
    }
  }

  file { 'VSCode config':
    ensure => file,
    mode => '0644',
    owner => 'jake',
    path => '/home/jake/.config/Code/User/settings.json',
    source => 'puppet:///modules/config/vscode-settings.json'
  }

  file { 'VSCode keybindings':
    ensure => file,
    mode => '0644',
    owner => 'jake',
    path => '/home/jake/.config/Code/User/keybindings.json',
    source => 'puppet:///modules/config/vscode-keybindings.json'
  }
}
