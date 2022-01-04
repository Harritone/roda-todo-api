# frozen_string_literal: true

# {TodosSerializer} is responsible for representing a list of todos ({Todo}) in JSON format.
#
# @example Represent multiple todos {Todo} in the JSON format:
#   TodoSerializer.new(todo: Todo.all).render
class TodosSerializer < ApplicationSerializer
  # It returns Hash object with multiple todos ({Todo}) details.
  #
  # @return [Hash] object with multiple todos ({Todo}) details.
  def to_json
    {
      todos: todos
    }
  end

  private

  # It returns array fo todos ({Todo})
  #
  # @return [Array<Todo>] todos ({Todo}) data.
  def todos
    @todos.map do |todo|
      TodoSerializer.new(todo: todo).to_json
    end
  end
end
