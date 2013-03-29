class kibana(
  $manage_ruby = false,
){
  validate_bool($manage_ruby)
  class { 'kibana::install': } ->
  class { 'kibana::config': } ~>
  class { 'kibana::service': } ->
  Class['kibana']
}
