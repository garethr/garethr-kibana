class kibana(
  $git_hash = 'edb4553',
){
  class { 'kibana::install': } ->
  class { 'kibana::config': } ~>
  class { 'kibana::service': } ->
  Class['kibana']
}
