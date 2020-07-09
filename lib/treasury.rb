# frozen_string_literal: true

# Simply handle method missing in search of value in ENV or swarm secret
class Treasury
  class << self
    def method_missing(method, *_args, &_block)
      variable_name = method.to_s.upcase
      ENV[variable_name] ||
        File.read("/run/secrets/#{method}").strip ||
        raise("Please provide environmental variable #{variable_name} or swarm secret #{method} if production env")
    end
  end
end