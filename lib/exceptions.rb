# frozen_string_literal: true

# {Exceptions} module defines error classes that are used in application.
module Exceptions
  # {Exceptions::InvalidParamsError} is an error which is raised when invalid params are passed to the endpoint.
  class InvalidParamsError < StandardError
    attr_reader :object

    # @param [Hash] object that contains details about params errors.
    # @param [String] message of the error.
    def initialize(object, message)
      @object = object

      super(message)
    end
  end

  # {Exceptions::InvalidEmailOrPassword} is an error which is raised during authentication process
  # when email or password is invalid.
  class InvalidEmailOrPassword < StandardError; end
end
