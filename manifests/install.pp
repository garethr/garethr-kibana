class kibana::install {
  include 'git'
  vcsrepo { '/opt/kibana':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/rashidkpc/Kibana.git',
    revision => 'kibana-ruby',
    before   => Bundler::Install['/opt/kibana'],
  }
  bundler::install {'/opt/kibana':
  }
}
