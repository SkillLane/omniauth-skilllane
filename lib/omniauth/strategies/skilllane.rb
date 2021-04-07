require 'omniauth-oauth2'
require 'uri'

module OmniAuth
  module Strategies
    class Skilllane < OmniAuth::Strategies::OAuth2

      option :name, :skilllane
      option :client_options, {
        site: 'http://localhost:5000',
        authorize_url: '/connect/authorize',
        token_url: '/connect/token'
      }

      def client_options
        options.client_options.merge(options.client_options)
      end

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