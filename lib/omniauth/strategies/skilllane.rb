require 'omniauth-oauth2'
require 'uri'

module OmniAuth
  module Strategies
    class Skilllane < OmniAuth::Strategies::OAuth2

      option :name, :skilllane
      option :client_options, {
        site: 'http://localhost:5000',
        authorize_url: 'http://localhost:5000/connect/authorize',
        token_url: 'http://localhost:5000/connect/token'
      }

      uid {
        raw_info['id']
      }

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/connect/userinfo').parsed
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end