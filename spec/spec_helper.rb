$LOAD_PATH << File.expand_path('../lib', __dir__)

require 'async'
require 'async/io'
require 'async/rspec'

require 'e8r'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random
  config.warnings = true

  config.include_context(Async::RSpec::Reactor, type: :reactor)
end
