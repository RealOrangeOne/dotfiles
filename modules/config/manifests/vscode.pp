class config::vscode {
  $extensions = [
    'DavidAnson.vscode-markdownlint',
    'PKief.material-icon-theme',
    'PeterJausovec.vscode-docker',
    'Zignd.html-css-class-completion',
    'akmittal.hugofy',
    'bibhasdn.django-html',
    'bibhasdn.django-snippets',
    'bitzl.vscode-puppet',
    'bogdan-sinitsa.theme-dark-monokai',
    'christian-kohler.npm-intellisense',
    'dbaeumer.vscode-eslint',
    'donjayamanne.jupyter',
    'donjayamanne.python-extension-pack',
    'eamodio.gitlens',
    'eg2.tslint',
    'eg2.vscode-npm-script',
    'formulahendry.code-runner',
    'ionutvmi.path-autocomplete',
    'kalitaalexey.vscode-rust',
    'magicstack.MagicPython',
    'mrmlnc.vscode-less',
    'mrmlnc.vscode-scss',
    'ms-python.python',
    'ms-vscode.sublime-keybindings',
    'rokoroku.vscode-theme-darcula',
    'saviorisdead.RustyCode',
    'steoates.autoimport',
    'truman.autocomplate-shell',
    'wholroyd.jinja',
    'zolocode.editorzoom'
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
    path => '/home/jake/.config/Code/User/settings.json',
    source => 'puppet:///modules/config/vscode-settings.json'
  }

  file { 'VSCode keybindings':
    ensure => file,
    mode => '0644',
    path => '/home/jake/.config/Code/User/keybindings.json',
    source => 'puppet:///modules/config/vscode-keybindings.json'
  }
}
