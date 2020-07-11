# spec/player_spec.rb

require './lib/player'

describe Player do
  subject { Player.new('player1', 'X') }

  describe '#increment_score' do
    context '#increments_player_score' do
      it 'increments by 1 when player scores' do
        expect(subject.increment_score).to eql(1)
      end
    end
  end
end
