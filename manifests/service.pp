class kibana::service {
  file { '/etc/init.d/kibana':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

  file { '/etc/init/kibana.conf':
    ensure  => present,
    content => template('kibana/etc/init/kibana.conf.erb')
  }

  service { 'kibana':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
    require    => [
      File['/etc/init.d/kibana'],
      File['/etc/init/kibana.conf'],
    ],
  }

  File['/etc/init/kibana.conf'] ~> Service['kibana']
}
