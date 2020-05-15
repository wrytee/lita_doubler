require "spec_helper"

describe Lita::Handlers::Doubler, lita_handler: true do
  let(:robot) { Lita::Robot.new(registry) }

  subject { described_class.new(robot) }

  describe ':double' do
    # allow extra whitespace
    it { is_expected.to route('Lita double 2') }
    it { is_expected.to route('Lita double     22') }
    # allow mixed casing.
    it { is_expected.to route('Lita doUble 4') }

    # Ignore numbers that don't look like integers.
    it {is_expected.to_not route('Lita double two') }
    it {is_expected.to_not route('Lita double 1e4') }

    it 'doubles numbers when asked to' do
      send_message 'Lita double 2'
      expect(replies.last).to eq('2 + 2 = 4')
    end
  end
end
