Puppet module for installing the Kibana logstash interface.
 This module is also available on the [Puppet
Forge](https://forge.puppetlabs.com/garethr/kibana)

[![Build
Status](https://secure.travis-ci.org/garethr/garethr-kibana.png)](http://travis-ci.org/garethr/garethr-kibana)
[![Dependency
Status](https://gemnasium.com/garethr/garethr-kibana.png)](http://gemnasium.com/garethr/garethr-kibana)

## Usage

The module includes a single class:

    include 'kibana'

This clones kibana 2 from https://github.com/rashidkpc/Kibana and starts it running on port 5601 and connects to
an Elasticsearch index running on localhost:9200. More configuration
options for this module should be added soon.
