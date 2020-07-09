# frozen_string_literal: true

# Simply handle method missing in search of value in ENV
class Settings
  class << self
    def method_missing(method, *_args, &_block)
      variable_name = method.to_s.upcase
      ENV[variable_name] || raise("Please provide environmental variable #{variable_name}")
    end
  end
end
