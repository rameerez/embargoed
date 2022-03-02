require 'spec_helper'

describe Embargoed::Request do
  let(:path) { '/' }
  let(:ip) { '127.0.0.1' }
  let(:env) { Rack::MockRequest.env_for(path, 'REMOTE_ADDR' => ip) }
  let(:request) { Embargoed::Request.new(env) }

  describe '#allowed?' do
    let(:file_name) { 'missing' }
    let(:file_path) { File.expand_path("../../fixtures/#{file_name}.yml", __FILE__) }

    subject { request.allowed? }

    context 'when country is Russia' do
      before { allow(Embargoed::IPLocator).to receive(:get_country_code).and_return('RU') }

      it { should be false }
    end

    context 'when country is Belarus' do
      before { allow(Embargoed::IPLocator).to receive(:get_country_code).and_return('BY') }

      it { should be false }
    end

    context 'when country is another' do
      before { allow(Embargoed::IPLocator).to receive(:get_country_code).and_return('BR') }

      it { should be true }
    end

    # TODO: implement settings/maintenance file feature
    xcontext 'with a maintenance file that sets allowed_paths and allowed_ips' do
      let(:settings) { Embargoed::MaintenanceFile.new(file_path) }

      subject { request.allowed?(settings) }

      # maintenance.yml contains
      #   allowed_paths: [/uuddlrlrba.*]
      #   allowed_ips: [42.42.42.0/24]}
      let(:file_name) { 'maintenance' }

      context 'request for /letmein' do
        it { should be false }
      end

      context 'request for /uuddlrlrbastart' do
        let(:path) { '/uuddlrlrbastart' }
        it { should be true }
      end

      context 'request from 42.42.40.40' do
        let(:ip) { '42.42.40.40' }
        it { should be false }
      end

      context 'request from 10.0.0.42' do
        let(:ip) { '10.0.0.42' }
        it { should be true }
      end
    end
  end
end
