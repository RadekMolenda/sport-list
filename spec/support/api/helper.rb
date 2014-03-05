module ApiHelper
  include Rack::Test::Methods

  def app
    Application
  end
end
