require 'spec_helper'
describe 'adcli' do
  describe 'on RedHat 6.7' do
    let(:facts) do
      {
        :osfamily => 'RedHat',
        :operatingsystemrelease => '6.7',
        :operatingsystemmajrelease => '6',
        :rubyversion => '1.9.3'
      }
    end
    let(:params) do
      {
        :ad_domain => 'ad.example.com',
        :ad_join_username => 'userid',
        :ad_join_password => 'secret',
        :ad_join_ou => 'cn=computers,dn=ad,dn=example,dn=com'
      }
    end

    context 'with defaults for all parameters' do
      it { is_expected.to contain_class('adcli::install') }
      it { is_expected.to contain_class('adcli::join') }
      it { is_expected.to contain_package('adcli').with_ensure('present') }
      it { is_expected.to contain_exec('adcli_join') }
    end
  end

  describe 'on RedHat 7.2' do
    let(:facts) do
      {
        :osfamily => 'RedHat',
        :operatingsystemrelease => '7.2',
        :operatingsystemmajrelease => '7',
        :rubyversion => '1.9.3'
      }
    end
    let(:params) do
      {
        :ad_domain => 'ad.example.com',
        :ad_join_username => 'userid',
        :ad_join_password => 'secret',
        :ad_join_ou => 'cn=computers,dn=ad,dn=example,dn=com'
      }
    end

    context 'with defaults for all parameters' do
      it { is_expected.to contain_class('adcli::install') }
      it { is_expected.to contain_class('adcli::join') }
      it { is_expected.to contain_package('adcli').with_ensure('present') }
      it { is_expected.to contain_exec('adcli_join') }
    end
  end
end
