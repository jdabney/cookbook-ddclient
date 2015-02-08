require 'chefspec'

describe 'ddclient::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs  package ddclient' do
    expect(chef_run).to install_package('ddclient')
  end

  it 'enables a ddclient' do
    expect(chef_run).to enable_service('ddclient')
  end

  it 'starts service ddclient' do
    expect(chef_run).to start_service('ddclient')
  end

  it 'creates a ddclient configs with attributes' do
    expect(chef_run).to create_template('/etc/ddclient.conf').with(
      source:'ddclient.conf.erb',
      user:   'root',
      group:  'root',
      mode: '0600'
    )
  end

  it 'creates a ddclient startup options with attributes' do
    expect(chef_run).to create_template('/etc/default/ddclient').with(
      source: 'ddclient.erb',
      user:   'root',
      group:  'root',
      mode: '0600'
    )
  end
end
