module Harvest
  module Credentials

    class OAuth < Base

      attr_accessor :token

      def initialize subdomain, token, ssl = true
        @subdomain, @token, @ssl = subdomain, token, ssl
      end
      
      def valid?
        !token.nil? and !subdomain.nil?
      end

      def header
        "Bearer #{@token}"
      end 
    end
  end
end