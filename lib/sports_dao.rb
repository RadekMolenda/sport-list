require 'yajl'
require 'net/http'

class SportsDAO
  def initialize(options)
    @options = options
  end

  def self.fetch_for(options)
    new(options).fetch
  end

  def resource
    "http://www.betvictor.com/live/#{locale}/live/list.json"
  end

  def locale
    options.fetch(:locale, 'en')
  end

  def fetch
    Yajl::Parser.parse(Net::HTTP.get(URI(resource)).force_encoding("UTF-8"))
  end

  private
  attr_reader :options
end
