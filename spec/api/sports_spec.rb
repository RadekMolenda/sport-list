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

    it 'has two events' do
      parsed_response = Yajl::Parser.parse(last_response.body)
      expect(parsed_response).to have(2).items
    end

    context "events order and event data structure" do
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

  describe '/api/sports/:sport_id/events/:event_id' do
    before do
      get '/api/sports/100/events/25544810'
    end

    it "returns 200" do
      expect(last_response).to be_ok
    end

    it "has three outcomes" do
      parsed_response = Yajl::Parser.parse(last_response.body)
      expect(parsed_response).to have(3).items
    end

    context "outcome data structure" do
      let(:expected) { {
        "description"=> "Ituano SP",
        "market"=> "Match Betting - 90 Mins",
        "price"=> "4/6"
      } }
      it "is correct" do
        parsed_response = Yajl::Parser.parse(last_response.body).first
        expect(parsed_response).to eq(expected)
      end
    end
  end
end
