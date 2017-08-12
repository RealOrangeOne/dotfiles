class yaourt::keys () {
  exec { 'gpg --recv-keys F7E48EDB':
    user => 'jake'
  }

  exec { 'pacman-key -r 962DDE58':
  }

  exec { 'pacman-key --lsign-key 962DDE58':
  }

  exec { 'gpg --keyserver pool.sks-keyservers.net --recv-keys 2E1AC68ED40814E0':
    user => 'jake'
  }
}
