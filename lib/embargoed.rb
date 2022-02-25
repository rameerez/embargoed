module Embargoed
  require 'embargoed/configuration'
  require 'embargoed/maintenance_file'
  require 'embargoed/maintenance_page'
  require 'embargoed/request'
  require 'embargoed/engine' if defined? Rails

  def self.configure
    yield config
  end

  def self.config
    @config ||= Configuration.new
  end
end
