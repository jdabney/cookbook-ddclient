require 'chefspec'

describe 'ddclient::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  it 'installs a package with the default action' do
    expect(chef_run).to install_package('default_action')
  end
end