require 'api_spec_helper'

describe '/api/sports', type: :api do
  before do
    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      to_return(:status => 200, :body => "{}", :headers => {})
  end

  it 'fetches the sports json' do
    get '/api/sports'

    expect(last_response).to be_ok
  end
end
