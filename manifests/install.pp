class kibana::install {
  include 'git'

  if $kibana::manage_ruby == true {
    class { 'ruby':
      gems_version => latest,
    }
  }

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
