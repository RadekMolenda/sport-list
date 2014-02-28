require 'spec_helper'

describe Sport do
  let(:data) {
    {
      id: 1,
      title: "title",
      is_virtual: false,
      events: [],
      pos: 3,
      meetings: []
    }
  }
  subject { described_class.new(data) }

  describe "attributes" do
    it { expect(subject.id).to eq(1) }
    it { expect(subject.title).to eq("title") }
    it { expect(subject.is_virtual).to be_false }
    it { expect(subject.events).to eq([]) }
    it { expect(subject.pos).to eq(3) }
    it { expect(subject.meetings).to eq([]) }
  end


end
