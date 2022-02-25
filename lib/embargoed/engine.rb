require 'embargoed'
require 'rack/embargoed'
require 'rails'

# For Rails 3
if defined? Rails::Engine
  module Embargoed
    class Engine < Rails::Engine
      initializer 'embargoed.add_to_middleware_stack' do |app|
        unless Embargoed.config.skip_middleware
          app.config.middleware.use(Rack::Embargoed)
        end
      end
    end
  end
end
