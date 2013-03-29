class kibana(
  $manage_ruby = false,
){
  class { 'kibana::install': } ->
  class { 'kibana::config': } ~>
  class { 'kibana::service': } ->
  Class['kibana']
}
