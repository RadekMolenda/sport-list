require 'spec_helper'

describe Outcome do
  let(:data) {
    {
      id: 18775230900,
      description: "Hibernian",
      price_decimal: 17.0,
      price: "16/1",
      price_id: 121108272302,
      print_order: 1,
      opponent_id: 2376800,
      deduction: 1,
      sp: false,
      nr: false,
      market: "Match Betting - 90 Mins"
    }
  }

  subject { described_class.new(data) }

  describe "attributes" do
    it { expect(subject.id).to eq(18775230900) }
    it { expect(subject.description).to eq("Hibernian") }
    it { expect(subject.price_decimal).to eq(17.0) }
    it { expect(subject.price).to eq("16/1") }
    it { expect(subject.price_id).to eq(121108272302) }
    it { expect(subject.print_order).to eq(1) }
    it { expect(subject.opponent_id).to eq(2376800) }
    it { expect(subject.deduction).to eq(1) }
    it { expect(subject.sp).to eq(false) }
    it { expect(subject.nr).to eq(false) }
    it { expect(subject.market).to eq("Match Betting - 90 Mins") }
  end
end
