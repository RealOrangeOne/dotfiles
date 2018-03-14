class yaourt::keys () {
  $keys = [
    '8A8F901A',  # Sublime Text
    'D1483FA6C3C07136',  # Tor Browser
    '9D5F1C051D146843CDA4858BDE64825E7CBC0D51',  # ArchStrike
    '7448C890582975CD'
  ]

  $keys.each |$key| {
    exec {"Add $key key":
      command => "gpg --recv-keys $key",
      user => 'jake',
      unless => "gpg --list-keys $key"
    }
    exec { "Add $key for root":  # So root can install things
      command => "gpg --recv-keys $key",
      unless => "gpg --list-keys $key"
    }
    exec { "Add $key to pacman":
      command => "pacman-key -r $key",
      unless => "pacman-key --list-keys $key"
    }
    exec { "Locally sign $key with pacman":
      command => "pacman-key --lsign-key $key",
      unless => "pacman-key --list-keys $key | grep full"
    }
  }
}
