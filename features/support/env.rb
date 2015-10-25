require_relative "../../list_sorter_app"

require "Capybara"
require "Capybara/cucumber"
require "rspec"
require "rack/test"

Capybara.app = ListSorterApp

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.default_driver = :selenium