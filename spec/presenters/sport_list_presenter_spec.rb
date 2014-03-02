require 'spec_helper'

describe SportListPresenter do
  let(:sport_list) { double("SportList",
                            ordered_sports: sports) }
  let(:presenter) { described_class.new(sport_list, params) }
  let(:params) { {} }
  let(:sport) { double("Sport",
                       ordered_events: events) }
  let(:sports) { [sport] }
  let(:event) { double("Event",
                       outcomes: outcomes) }
  let(:events) { [event] }
  let(:outcome) { double("Outcome") }
  let(:outcomes) { [outcome] }

  describe "#sports" do
    subject { presenter.sports }

    it { expect(subject).to eq(sports) }
  end

  describe "#sport" do
    let(:sport_id) { 1 }
    let(:params) { { "sport_id" => sport_id } }

    before do
      sport_list.stub(:find_sport).with(sport_id).and_return(sport)
    end

    subject { presenter.sport }

    it { expect(subject).to eq(sport) }
  end

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

  describe "#outcomes" do
    let(:sport_id) { 1 }
    let(:event_id) { 1 }
    let(:params) { { "sport_id" => sport_id, "event_id" => event_id } }

    subject { presenter.outcomes }

    it "fetches the sport and returns ordered events" do
      expect(presenter).to receive(:event).and_return(event)
      expect(subject).to eq(outcomes)
    end
  end
end
