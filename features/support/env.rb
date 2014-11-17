require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'pry'

Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, :inspector => true, :port => 3010)
end

Capybara.configure do |config|
  config.run_server = true
  config.default_driver = :poltergeist_debug
  #config.default_wait_time = 5
  config.app_host = "file://localhost#{Dir.getwd}/public/"
  config.javascript_driver = :poltergeist
end



