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
  plugin :error_handler do |e|
    if e.instance_of?(Exceptions::InvalidParamsError)
      error_object    = e.object
      response.status = 422
    elsif e.instance_of?(Sequel::ValidationFailed)
      error_object    = e.model.errors
      response.status = 422
    else
      error_object    = { error: I18n.t('something_went_wrong') }
      response.status = 500
    end

    respnse.write(error_object.to_json)
  end

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
