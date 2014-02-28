require 'spec_helper'

describe SportsDAO do
  subject { SportsDAO.fetch_for }

  before do
    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json")
      .to_return(:status => 200, :body => File.read("spec/support/list.json"), :headers => {})
  end

  it { expect(subject).to be_a Hash }
end
