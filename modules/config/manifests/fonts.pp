class config::fonts {
  $fonts = [
    '11-lcdfilter-default.conf',
    '10-sub-pixel-rgb.conf',
    '30-infinality-aliases.conf'
  ];

  $fonts.each |String $font| {
    file { "Enable $font font":
      ensure => link,
      path => "/etc/fonts/conf.d/$font",
      mode => '0644',
      source => "/etc/fonts/conf.avail/$font"

    }
  }

  exec { 'Update font cache':
    command => 'gdk-pixbuf-query-loaders --update-cache'
  }
}
