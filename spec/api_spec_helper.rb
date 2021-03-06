require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'
require 'webmock/rspec'
require 'rack/test'
require 'support/api/helper'

require "./app.rb"

RSpec.configure do |config|
  config.include ApiHelper, :type => :api
end
