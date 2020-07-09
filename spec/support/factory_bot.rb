# frozen_string_literal: true

RSpec.configure do |config|
  # Make short `#create` or `#build` factory_girl methods available in specs
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    factories_to_lint = FactoryBot.factories.reject { |factory| factory.name.in? %i[tweet] }

    FactoryBot.lint factories_to_lint
  end
end
