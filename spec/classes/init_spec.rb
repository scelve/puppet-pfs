require 'spec_helper'
describe 'pfs' do

  context 'with defaults for all parameters' do
    it { should contain_class('pfs') }
  end
end
