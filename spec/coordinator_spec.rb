require 'spec_helper'

describe Coordinator do
  context "a 1:4 ratio of low:high priority servers" do
    let(:coordinator){ Coordinator.new(connection, ratio) }
    let(:connection){ double("connection") }
    let(:ratio){"1:4"}

    context "there are no other servers running" do
      # we want the first server to run all cues
      it "returns 'gp'" do
        expect(coordinator.type).to eq("gp")
      end
    end

    context "there is one other server" do
      it "returns 'hp'" do
        expect(coordinator.type).to eq("hp")
      end
    end

    context "there are two other servers" do
      it "returns 'hp'" do
        expect(coordinator.type).to eq("hp")
      end
    end

    context "there are 5 other servers" do
      it 'returns "gp"' do
        expect(coordinator.type).to eq("gp")
      end
    end
  end
end
