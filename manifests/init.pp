class kibana(
  $git_hash = 'aa50511',
){
  class { 'kibana::install': } ->
  class { 'kibana::config': } ~>
  class { 'kibana::service': } ->
  Class['kibana']
}
