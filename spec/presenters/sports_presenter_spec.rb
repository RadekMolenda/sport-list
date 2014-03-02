require 'spec_helper'

describe SportsPresenter do
  let(:sport_list) { double("SportList",
                            ordered_sports: sports) }
  let(:presenter) { described_class.new(sport_list, params) }
  let(:params) { {} }
  let(:sport) { double("Sport") }
  let(:sports) { [sport] }

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

  describe "#sport_locals" do
    let(:expected) {
      {
        active_id: -1,
        sports: sports
      }
    }

    subject { presenter.sports_locals }

    it { expect(subject).to eq(expected) }
  end
end
