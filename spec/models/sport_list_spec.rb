require 'spec_helper'

describe SportList do
  let(:data) {
    {
      version: "version",
      sports: [{ id: 1 }]
    }
  }

  let(:sport_list) { described_class.new(data) }

  describe "attributes" do
    it { expect(sport_list.version).to eq("version") }
    it { expect(sport_list.sports).not_to be_empty }
  end

  describe "find_sport" do
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
end
