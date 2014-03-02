require 'spec_helper'

describe SportsDAO do
  let(:locale) { 'en' }

  subject { SportsDAO.fetch_for({locale: locale}) }

  before do
    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json")
      .to_return(:status => 200, :body => File.read("spec/support/list.json"), :headers => {})
  end

  it { expect(subject).to be_a Hash }

  context "different locale" do
    let(:locale) { 'it' }
    let(:data) { double('data') }
    before do
      stub_request(:get, "http://www.betvictor.com/live/it/live/list.json").to_return(:status => 200, :body => "{\"data\": \"some data\" }")
    end

    it "fetches the data for different locale" do
      expect(subject).to eq({"data" => "some data"})
    end
  end
end
