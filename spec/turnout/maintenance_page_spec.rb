require 'spec_helper'

describe Embargoed::MaintenancePage do
  describe '.all' do
    its(:all) { should_not include Embargoed::MaintenancePage::Base }
    its(:all) { should eql [Embargoed::MaintenancePage::HTML, Embargoed::MaintenancePage::Erb, Embargoed::MaintenancePage::JSON] }
  end

  describe '.best_for' do
    let(:env) { Rack::MockRequest.env_for('/', 'HTTP_ACCEPT' => content_type) }
    subject { Embargoed::MaintenancePage.best_for(env) }

    context 'with "*/*" accept header' do
      let(:content_type) { '*/*' }

      it { should eql Embargoed::MaintenancePage::HTML }
    end

    context 'with "text/html" accept header' do
      let(:content_type) { 'text/html' }

      it { should eql Embargoed::MaintenancePage::HTML }
    end

    context 'with "text/json" accept header' do
      let(:content_type) { 'text/json' }

      it { should eql Embargoed::MaintenancePage::JSON }
    end

    context 'with "image/gif" accept header' do
      let(:content_type) { 'image/gif' }

      it { should eql Embargoed::MaintenancePage::HTML }
    end
  end
end
