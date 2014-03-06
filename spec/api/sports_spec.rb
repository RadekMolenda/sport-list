require 'api_spec_helper'

describe 'API', type: :api do
  before do
    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      to_return(:status => 200, :body => File.read('spec/support/short_list.json'), :headers => {})
  end

  describe '/api/sports' do
    before do
      get '/api/sports'
    end

    it 'returns 200' do
      expect(last_response).to be_ok
    end

    it "has two elements" do
      parsed_response = Yajl::Parser.parse(last_response.body)
      expect(parsed_response).to have(2).items
    end

    it "has Football as a first element" do
      parsed_response = Yajl::Parser.parse(last_response.body).first
      expect(parsed_response['title']).to eq("Football")
    end
  end

  describe '/api/sports/:id' do
    before do
      get '/api/sports/100'
    end

    it 'returns 200' do
      expect(last_response).to be_ok
    end

    it 'has three elements' do
      parsed_response = Yajl::Parser.parse(last_response.body)
      expect(parsed_response).to have(2).items
    end

    context "order and data structure" do
      let(:expected) {
        {
          "title" => "Ituano SP v CA Linense",
          "id" => 25544810
        }
      }

      it 'returns events in correct order and formated correctly' do
        parsed_response = Yajl::Parser.parse(last_response.body).first
        expect(parsed_response).to eq(expected)
      end
    end
  end
end
