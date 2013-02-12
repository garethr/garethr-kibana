# = Class: kibana
#
# Installs latest ruby implementation of kibana
#
# == Parameters:
#
# none - all config is pulled from the kibana::config class
#
# == Actions:
#
# Installs ruby kibana, edits configs, starts service
#
# == Requires:
#
# kibana::config

class kibana(
) {
  Class ['kibana::install'] -> Class ['kibana::config']
  Class ['kibana::config']  ~> Class ['kibana::service'] 
  Class ['kibana::service'] -> Class['kibana']

  class { 'kibana::install': }
  class { 'kibana::service': }
}
