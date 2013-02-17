class kibana::install {
  wget::fetch { 'download_kibana':
    source      => 'http://github.com/rashidkpc/Kibana/tarball/kibana-ruby',
    destination => '/usr/local/src/kibana-ruby.tar.gz',
    before      => File['/opt/kibana'],
  }

  file { '/opt/kibana':
    ensure => directory,
    before => Exec['untar_kibana'],
  }

  exec { 'untar_kibana':
    command => 'tar --strip-components 1 -xzf /usr/local/src/kibana-ruby.tar.gz',
    cwd     => '/opt/kibana',
    creates => "/opt/kibana/Rakefile",  # Dirty!
    path    => '/bin',
    before  => Exec['bundle_kibana'],
  }

  $ruby_pkgs = $::operatingsystem ? {
    'Ubuntu'  => [ "ruby-bundler", "rubygems" ],
    default   => [ "ruby-bundler", "rubygems" ],
  }

  package { $ruby_pkgs:
    ensure => "installed",
    before => Exec['bundle_kibana'],
  }

  exec { 'bundle_kibana':
    command => '/usr/bin/bundle install --path vendor',
    cwd     => '/opt/kibana',
    creates => '/opt/kibana/vendor',
    timeout => "0",
  }
}
