require 'spec_helper'

describe EventsPresenter do
  let(:sport_list) { double("SportList") }
  let(:presenter) { described_class.new(sport_list, params) }
  let(:params) { {} }
  let(:sport) { double("Sport",
                       ordered_events: events) }
  let(:sports) { [sport] }
  let(:event) { double("Event") }
  let(:events) { [event] }
  let(:sport_id) { 1 }
  let(:event_id) { 1 }
  describe "#events" do
    let(:params) { { "sport_id" => sport_id } }

    subject { presenter.events }

    it "fetches the sport and returns ordered events" do
      expect(presenter).to receive(:sport).and_return(sport)
      expect(subject).to eq(events)
    end
  end

  describe "#event" do
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

  describe "#events_locals" do
    let(:params) { { "sport_id" => sport_id, "event_id" => event_id } }
    let(:expected) {
      {
        active_id: -1,
        events: events,
        sports: sports,
        sport: sport
      }
    }

    subject { presenter.events_locals }

    before do
      sport_list.stub(:find_sport).with(sport_id).and_return(sport)
      sport_list.stub(:ordered_sports).and_return(sports)
    end

    it { expect(subject).to eq(expected) }

  end
end
