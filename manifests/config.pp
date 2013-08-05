class kibana::config {

  include 'kibana'

  $kibana_host = $kibana::kibana_host

  file { '/opt/kibana/KibanaConfig.rb':
    ensure  => present,
    content => template('kibana/opt/kibana/KibanaConfig.rb.erb')
  }
}
