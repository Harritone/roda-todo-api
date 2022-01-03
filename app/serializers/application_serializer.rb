# frozen_string_literal: true

# {ApplicationSerializer} is base class that contains configuration that is
# used accross all serializers for rndering JSON using Oj serializer.
# @see http://www.ohler.com/oj/doc/ OJ Documentation
class ApplicationSerializer
  # It accepts Hash as an argument, sets instance variables based
  # on its keys and returns a new instance of {ApplicationSerializer}.
  #
  # @param [Hash] object that will be used for setting instance variables
  # that will be available inside serializer
  def initialize(object)
    object.each_pair do |key, value|
      instance_variable_set(:"@#{key}", value)
    end
  end

  # It generates JSON using Oj serializer dump method.
  #
  # @return [String] which is complaint with JSON standard.
  def render
    Oj.dump(to_json)
  end
end
