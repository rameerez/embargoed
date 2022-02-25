require 'erb'
require 'tilt'
require 'tilt/erb'
require_relative './html'
require_relative '../i18n/internationalization'

module Embargoed
  module MaintenancePage
    class Erb < Embargoed::MaintenancePage::HTML

      def content
        Embargoed::Internationalization.initialize_i18n(@options[:env])
        Tilt.new(File.expand_path(path)).render(self, {reason: reason}.merge(@options))
      end
      
      def self.extension
        'html.erb'
      end

    end
  end
end
