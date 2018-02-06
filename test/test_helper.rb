require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

module ActionDispatch
  class ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end

module ActionController
  class ActionController::TestCase
    include Devise::Test::ControllerHelpers
  end
end

