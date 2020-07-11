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

  describe '#move' do
    context 'check if_players recieves prompt ,enter 1 at prompt' do
      it 'expects a player move' do
        allow(subject.move).to receive(:gets)
      end
    end
  end
end
