class kibana::config (
  # Avoid templating config file, to keep in-sync with new versions of kibana
  # Instead, we edit config file shipped with kibana

  # Config file needs IP address between single quotes!
  # TODO: Add a "quoted IP validator"
  $kibana_host = "'0.0.0.0'",
) {
  file_line { '/opt/kibana/KibanaConfig.rb':
      path  => '/opt/kibana/KibanaConfig.rb',
      match => '\s+KibanaHost = .*$',
      line  => "  KibanaHost = $kibana_host",
  }
}
