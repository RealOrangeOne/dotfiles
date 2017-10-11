class yaourt::keys () {
  $keys = [
    '8A8F901A',  # Sublime Text
    'D1483FA6C3C07136',  # Tor Browser
    'C6DFFE6ED7166B97',  # Youtube-DL
    '9D5F1C051D146843CDA4858BDE64825E7CBC0D51',  # ArchStrike
  ]

  $keys.each |$key| {
    exec { "gpg --recv-keys $key":
      user => 'jake',
      unless => "gpg --list-keys $key"
    }
    exec { "add $key for root":  # So root can install things
      command => "gpg --recv-keys $key",
      unless => "gpg --list-keys $key"
    }
    exec { "pacman-key -r $key":
      unless => "pacman-key --list-keys $key"
    }
  }
}
