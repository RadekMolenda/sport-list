require 'spec_helper'

describe Sport do
  let(:data) {
    {
      id: 1,
      title: "title",
      is_virtual: false,
      events: [{id: 1, pos: 2}, {id: 3, pos: 1}],
      pos: 3,
      meetings: []
    }
  }

  let(:sport) { described_class.new(data) }

  describe "attributes" do
    it { expect(sport.id).to eq(1) }
    it { expect(sport.title).to eq("title") }
    it { expect(sport.is_virtual).to be_false }
    it { expect(sport.events).not_to be_empty }
    it { expect(sport.pos).to eq(3) }
    it { expect(sport.meetings).to eq([]) }
  end

  describe "find_event" do
    let(:event_id) { 1 }
    subject { sport.find_event(event_id) }

    it "searches for event" do
      expect(subject).not_to be_nil
    end

    it "returns event" do
      expect(subject).to be_a Event
    end

    context "id not in database" do
      let(:event_id) { 2 }

      it { expect(subject).to be_nil }
    end
  end

  describe "ordered_events" do
    subject { sport.ordered_events }

    it { expect(subject.map(&:id)).to eq([3, 1]) }
  end

end
