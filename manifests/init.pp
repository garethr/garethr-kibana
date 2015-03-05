class kibana(
  $manage_ruby = false,
  $revision    = 'v4.0.0',
){
  validate_bool($manage_ruby)
  class { 'kibana::install': } ->
  class { 'kibana::config': } ~>
  class { 'kibana::service': } ->
  Class['kibana']
}
