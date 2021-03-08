# enables factorybot syntax methods like:
#   - FactoryBot.build => build
#   - FactoryBot.create => create
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
