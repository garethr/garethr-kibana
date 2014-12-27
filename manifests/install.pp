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
    source   => 'git://github.com/elasticsearch/kibana.git',
    revision => 'master',
    before   => Bundler::Install['/opt/kibana'],
  }
  bundler::install {'/opt/kibana':
  }
}
