module Harvest
  module Credentials

    class Basic < Base

      attr_accessor :username, :password, :ssl
      
      def initialize(subdomain, username, password, ssl = true)
        @subdomain, @username, @password, @ssl = subdomain, username, password, ssl
      end
      
      def valid?
        !subdomain.nil? && !username.nil? && !password.nil?
      end
      
      def basic_auth
        Base64.encode64("#{username}:#{password}").delete("\r\n")
      end

      def header
        "Basic #{basic_auth}"
      end
    end
  end
end