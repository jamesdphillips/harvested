module Harvest
  module Credentials

    class Base

      attr_accessor :subdomain, :ssl
      
      def valid?
        true
      end
      
      def host
        "#{ssl ? "https" : "http"}://#{subdomain}.harvestapp.com"
      end

      def header
        ''
      end
    end
  end
end