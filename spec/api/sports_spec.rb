require 'api_spec_helper'

describe 'API', type: :api do
  before do
    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      to_return(:status => 200, :body => File.read('spec/support/short_list.json'), :headers => {})
  end

  describe '/api/sports' do

    it 'returns 200' do
      get '/api/sports'

      expect(last_response).to be_ok
    end

    it "has two elements" do
      get '/api/sports'
      parsed_response = Yajl::Parser.parse(last_response.body)
      expect(parsed_response).to have(2).items
    end

    it "has Football as a first element" do
      get '/api/sports'
      parsed_response = Yajl::Parser.parse(last_response.body).first
      expect(parsed_response['title']).to eq("Football")
    end
  end
end
