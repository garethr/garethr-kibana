require 'spec_helper'

describe 'kibana', :type => :class do

  context 'no parameters' do
    it { should create_class('kibana::config')}
    it { should create_class('kibana::install')}
    it { should create_class('kibana::service')}

    it { should contain_file('/opt/kibana/KibanaConfig.rb').with_content(/KibanaPort = 5601/)}
    it { should contain_file('/opt/kibana/KibanaConfig.rb').with_content(/Elasticsearch = "localhost:9200"/)}

    it { should contain_file('/etc/init/kibana.conf')}
    it { should contain_file('/etc/init.d/kibana')}
    it { should contain_service('kibana').with_ensure('running').with_enable('true') }
  end

end
