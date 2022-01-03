# frozen_string_literal: true

# {TokensSerializer} is responsible for representing access and refresh token informations.
#
# @example Represent {User} access and refresh token in the JSON format:
#   tokens = {access_token: 'access-token', refresh_token: 'refresh-token}
#   TokensSerializer.new(tokens: tokens).render
class TokensSerializer < ApplicationSerializer
  # It generates Hash object that contains authorization and refresh token details.
  #
  # @return [Hash] object that contains authorization and refresh token detatils.
  #
  # @example Prepare data that contains authorization and refresh token details.
  #   tokens = {access_token: 'access_token', refresh_token: 'refresh-token'}
  def to_json
    {
      tokens: @tokens
    }
  end
end
