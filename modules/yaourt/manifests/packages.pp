class yaourt::packages () {
  package {[
    'firefox'
  ]:
    ensure => latest
  }
}
