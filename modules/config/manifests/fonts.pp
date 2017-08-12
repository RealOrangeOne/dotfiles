class config::fonts {
  $fonts = [
    "11-lcdfilter-default.conf",
    "10-sub-pixel-rgb.conf",
    "30-infinality-aliases.conf"
  ];

  $fonts.each |String $font| {
    file { "font config $font":
      path => "/etc/fonts/conf.d/$font",
      ensure => link,
      mode => "0644",
      source => "/etc/fonts/conf.avail/$font"

    }
  }

  exec { 'update font cache':
    command => "gdk-pixbuf-query-loaders --update-cache"
  }
}
