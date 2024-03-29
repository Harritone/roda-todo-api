# frozen_string_literal: true

# {TodoParams} validates POST /api/v1/todos and PUT api/v1/todos/:id params
#
# @example When params are valid:
#   TodoParams.new.permit!(name: 'Buy milk.', description: 'Please buy milk.')
#
# @example When params are invalid:
#   TodoParams.new.permit!({})
class TodoParams < ApplicationParams
  # @!method params
  #   It stores rules for validating POST /api/v1/todos and PUT /api/v1/todos/:id endpoints params using dry-validation DSL.
  params do
    required(:name).filled(:string)
    required(:description).filled(:string)
  end
end
