require 'spec_helper'

describe SportList do
  let(:data) {
    {
      version: "version",
      sports: []
    }
  }

  subject { described_class.new(data) }

  describe "attributes" do
    it { expect(subject.version).to eq("version") }
    it { expect(subject.sports).to eq([]) }
  end
end
