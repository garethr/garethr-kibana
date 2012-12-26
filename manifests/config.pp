class kibana::config {
  file { '/opt/kibana/KibanaConfig.rb':
    ensure  => present,
    content => template('kibana/opt/kibana/KibanaConfig.rb.erb')
  }
}
