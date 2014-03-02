require 'spec_helper'

describe EventsPresenter do
  let(:sport_list) { double("SportList") }
  let(:presenter) { described_class.new(sport_list, params) }
  let(:params) { {} }
  let(:sport) { double("Sport",
                       ordered_events: events) }
  let(:event) { double("Event") }
  let(:events) { [event] }

  describe "#events" do
    let(:sport_id) { 1 }
    let(:params) { { "sport_id" => sport_id } }

    subject { presenter.events }

    it "fetches the sport and returns ordered events" do
      expect(presenter).to receive(:sport).and_return(sport)
      expect(subject).to eq(events)
    end
  end

  describe "#event" do
    let(:sport_id) { 1 }
    let(:event_id) { 1 }
    let(:params) { { "sport_id" => sport_id, "event_id" => event_id } }

    subject { presenter.event }

    before do
      sport.stub(:find_event).with(event_id).and_return(event)
    end

    it "fetches event" do
      expect(presenter).to receive(:sport).and_return(sport)
      expect(subject).to eq(event)
    end
  end
end
