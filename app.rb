# frozen_string_literal: true

require 'roda'

require_relative './system/boot'

# The main class for Roda Application.
class App < Roda
  # Adds support for handling different execution invironments (development/test/production)
  plugin :environments

  # Adds support for heartbeats.
  plugin :heartbeat

  configure :development, :production do
    # A powerful logger for Roda
    plugin :enhanced_logger
  end

  # The symbol_matchers plugin allows you to define custom rexeps to use for specific symbols.
  plugin :symbol_matchers

  # Adds ability to automatically handle errors raised by the application.
  plugin :error_handler

  # Allows the default headers for responses.
  plugin :default_headers,
         'Content-Type' => 'application/json',
         'Strict-Transport-Security' => 'max-age=16070400;',
         'X-Frame-Options' => 'deny',
         'X-Content-Type-Options' => 'nosniff',
         'X-XSS-Protection' => '1; mode=block'

  # Adds request routing methods for all http verbs
  plugin :all_verbs
end