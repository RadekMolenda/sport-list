require 'simplecov'
SimpleCov.start

require 'webmock/cucumber'
require 'capybara'
require 'capybara/cucumber'
require_relative '../../app'

Capybara.app = Application
