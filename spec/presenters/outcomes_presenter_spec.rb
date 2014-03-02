require 'spec_helper'

describe OutcomesPresenter do
  let(:sport_list) { double("SportList") }
  let(:presenter) { described_class.new(sport_list, params) }
  let(:params) { {} }

  let(:event) { double("Event",
                       outcomes: outcomes) }
  let(:outcome) { double("Outcome") }
  let(:outcomes) { [outcome] }

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
