require 'spec_helper'

describe Event do
  let(:data) {
    {
      id: 44017910,
      is_virtual: false,
      outcomes: [],
      event_id: 470252100,
      title: "Athletic Bilbao v Granada CF",
      score: "4 - 0",
      start_time: 1393615800000,
      meeting: "ESP La Liga Primera",
      meeting_id: 6320610,
      american_format: false,
      event_type: "GAMEEVENT",
      pos: 10,
      status: "Second Half",
      status_type: "text",
      total_outcomes: 0
    }
  }

  let(:event) { described_class.new(data) }

  describe "attributes" do
    subject { event }
    it { expect(subject.id).to eq(44017910) }
    it { expect(subject.is_virtual).to eq(false) }
    it { expect(subject.outcomes).to eq([]) }
    it { expect(subject.event_id).to eq(470252100) }
    it { expect(subject.title).to eq("Athletic Bilbao v Granada CF") }
    it { expect(subject.score).to eq("4 - 0") }
    it { expect(subject.start_time).to eq(1393615800000) }
    it { expect(subject.meeting).to eq("ESP La Liga Primera") }
    it { expect(subject.meeting_id).to eq(6320610) }
    it { expect(subject.american_format).to eq(false) }
    it { expect(subject.event_type).to eq("GAMEEVENT") }
    it { expect(subject.pos).to eq(10) }
    it { expect(subject.status).to eq("Second Half") }
    it { expect(subject.status_type).to eq("text") }
    it { expect(subject.total_outcomes).to eq(0) }
  end

end
