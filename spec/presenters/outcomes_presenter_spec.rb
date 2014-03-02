require 'spec_helper'

describe OutcomesPresenter do
  let(:sport_list) { double("SportList") }
  let(:presenter) { described_class.new(sport_list, params) }
  let(:params) { {} }

  let(:event) { double("Event",
                       outcomes: outcomes) }
  let(:events) { [event] }
  let(:sport) { double("Sport") }
  let(:sports) { [sport] }
  let(:outcome) { double("Outcome") }
  let(:outcomes) { [outcome] }
  let(:sport_id) { 1 }
  let(:event_id) { 1 }
  let(:params) { { "sport_id" => sport_id, "event_id" => event_id } }

  describe "#outcomes" do
    subject { presenter.outcomes }

    it "fetches the sport and returns ordered events" do
      expect(presenter).to receive(:event).and_return(event)
      expect(subject).to eq(outcomes)
    end
  end

  describe "#outcomes_locals" do
    let(:expected) {
      {
        events: events,
        event: event,
        sports: sports,
        sport: sport,
        outcomes: outcomes
      }
    }

    subject { presenter.outcomes_locals }

    before do
      sport_list.stub(:find_sport).with(sport_id).and_return(sport)
      sport_list.stub(:ordered_sports).and_return(sports)
      sport.stub(:ordered_events).and_return(events)
      sport.stub(:find_event).with(event_id).and_return(event)
    end

    it { expect(subject).to eq(expected) }

  end
end
