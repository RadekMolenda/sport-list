require 'spec_helper'

describe Helpers do
  let(:helper) { Class.new{ include Helpers; }.new }

  describe "#active_copy(obj, active_id)" do
    subject { helper.active_copy(obj, active_id) }

    let(:obj) { double("Obj", id: 1) }
    let(:active_id) { 1 }

    it { expect(subject).to eq('active') }

    context "when active_id is not equal obj.id" do
      let(:active_id) { 2 }
      it { expect(subject).to eq('') }
    end
  end
end
