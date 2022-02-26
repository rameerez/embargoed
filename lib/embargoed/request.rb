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

    def path_allowed?
      allowed_paths = []

      allowed_paths.any? do |allowed_path|
        rack_request.path =~ Regexp.new(allowed_path)
      end
    end

    def ip_allowed?
      allowed_ips = ["127.0.0.2"]

      begin
        ip = IPAddr.new(rack_request.ip.to_s)
      rescue ArgumentError
        return false
      end

      allowed_ips.any? do |allowed_ip|
        IPAddr.new(allowed_ip).include? ip
      end
    end
  end
end