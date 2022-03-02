require 'ipaddr'

module Embargoed
  class Request
    def initialize(env)
      @rack_request = Rack::Request.new(env)
    end

    def allowed?
      path_allowed? || ip_allowed?
    end

    private

    attr_reader :rack_request

    PROHIBITED_COUNTRIES = %w[RU BY]

    def path_allowed?
      allowed_paths = []

      allowed_paths.any? do |allowed_path|
        rack_request.path =~ Regexp.new(allowed_path)
      end
    end

    def ip_allowed?
      begin
        ip = IPAddr.new(rack_request.ip.to_s)
      rescue ArgumentError
        return false
      end

      ip_country_code = IPLocator.get_country_code(ip)

      !PROHIBITED_COUNTRIES.include? ip_country_code
    end
  end
end