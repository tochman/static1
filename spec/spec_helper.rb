require 'rspec'
require 'capybara'
require 'capybara-webkit'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'pry'
require 'rack/test'

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Capybara::DSL
 
end

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

module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end