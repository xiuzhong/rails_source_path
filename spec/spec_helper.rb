require "bundler/setup"
require 'active_support/concern'
require 'rails'
require 'action_controller/railtie'
require 'rspec/rails'
require "rails_source_path"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
