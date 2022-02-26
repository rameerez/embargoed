require 'rack'
require 'embargoed'

class Rack::Embargoed
  def initialize(app, config={})
    @app = app
  end

  def call(env)
    request = Embargoed::Request.new(env)

    if !request.allowed?
      page_class = Embargoed::MaintenancePage.best_for(env)
      page = page_class.new("Reason", env: env)

      page.rack_response(503, 7200)
    else
      @app.call(env)
    end
  end
end
