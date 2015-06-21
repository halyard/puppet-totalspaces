require 'spec_helper'

describe 'totalspaces' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "totalspaces class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('totalspaces::params') }
          it { is_expected.to contain_class('totalspaces::install').that_comes_before('totalspaces::config') }
          it { is_expected.to contain_class('totalspaces::config') }
          it { is_expected.to contain_class('totalspaces::service').that_subscribes_to('totalspaces::config') }

          it { is_expected.to contain_service('totalspaces') }
          it { is_expected.to contain_package('totalspaces').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'totalspaces class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('totalspaces') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
