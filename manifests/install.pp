class kibana::install (
  $source = 'https://github.com/rashidkpc/Kibana.git',
) {
  include 'git'

  if $kibana::manage_ruby == true {
    class { 'ruby':
      gems_version => latest,
    }
  }

  vcsrepo { '/opt/kibana':
    ensure   => present,
    provider => git,
    source   => $source,
    revision => 'kibana-ruby',
    before   => Bundler::Install['/opt/kibana'],
  }
  bundler::install {'/opt/kibana':
  }
}
