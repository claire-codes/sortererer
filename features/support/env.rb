# $LOAD_PATH << File.expand_path('../../../lib', __FILE__)
# require_relative '../../myapp'
# require "Capybara"
# require "Capybara/cucumber"
# require "rspec"
 
 
# World do
#   Capybara.app = MyApp
 
#   include Capybara::DSL
#   include RSpec::Matchers
# end

require_relative "../../myapp"

require "Capybara"
require "Capybara/cucumber"
require "rspec"
require "rack/test"

Capybara.app = MyApp

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium