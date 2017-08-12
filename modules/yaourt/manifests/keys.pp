class yaourt::keys () {
  exec { '/usr/bin/gpg --recv-keys F7E48EDB':
    user => 'jake'
  }

  exec { '/usr/bin/pacman-key -r 962DDE58':
  }

  exec { '/usr/bin/pacman-key --lsign-key 962DDE58':
  }

  exec { '/usr/bin/gpg --keyserver pool.sks-keyservers.net --recv-keys 2E1AC68ED40814E0':
    user => 'jake'
  }
}
