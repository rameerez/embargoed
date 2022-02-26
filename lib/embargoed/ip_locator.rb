require 'maxmind/db'

module Embargoed
  class IPLocator

    def self.get_country_code(ip)
      country_code = "none"

      # Using an Open-Source IP db released under an Apache2 license: https://github.com/geoacumen/geoacumen-country
      db = File.expand_path("../../../public/Geoacumen-Country.mmdb", __FILE__)
      reader = MaxMind::DB.new(db, mode: MaxMind::DB::MODE_MEMORY)

      begin
        record = reader.get(ip)
      rescue => error
        puts error.inspect
      end

      if !record.nil?
        country_code = record['country']['iso_code']
      end

      reader.close

      return country_code
    end

  end
end