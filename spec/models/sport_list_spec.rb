require 'spec_helper'

describe SportList do
  let(:data) {
    {
      version: "version",
      sports: [{ id: 1, pos: 2 }, { id: 3, pos: 1}]
    }
  }

  let(:sport_list) { described_class.new(data) }

  describe "attributes" do
    it { expect(sport_list.version).to eq("version") }
    it { expect(sport_list.sports).not_to be_empty }
  end

  describe "#ordered_sports" do
    subject { sport_list.ordered_sports }

    it { expect(subject.map(&:id)).to eq([3, 1]) }
  end

  describe "#find_sport" do
    let(:sport_id) { 1 }
    subject { sport_list.find_sport(sport_id) }

    it "searches for sport" do
      expect(subject).not_to be_nil
    end

    it "returns sport" do
      expect(subject).to be_a Sport
    end

    context "id not in database" do
      let(:sport_id) { 2 }

      it { expect(subject).to be_nil }
    end
  end

  describe ".fetch" do
    it "fetches the data" do
      SportsDAO.should_receive(:fetch_for).and_return(data)
      SportList.should_receive(:new).with(data)
      SportList.fetch
    end
  end
end
