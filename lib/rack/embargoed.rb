require 'rack'
require 'embargoed'

class Rack::Embargoed
  def initialize(app, config={})
    @app = app

    Embargoed.config.update config

    if config[:app_root].nil? && app.respond_to?(:app_root)
      Embargoed.config.app_root = app.app_root
    end
  end

  def call(env)
    request = Embargoed::Request.new(env)
    settings = Embargoed::MaintenanceFile.find

    if settings && !request.allowed?(settings)
      page_class = Embargoed::MaintenancePage.best_for(env)
      page = page_class.new(settings.reason, env: env)

      page.rack_response(settings.response_code, settings.retry_after)
    else
      @app.call(env)
    end
  end
end
