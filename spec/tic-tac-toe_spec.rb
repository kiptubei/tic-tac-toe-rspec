# spec/board_spec.rb

require './lib/board'
require './lib/game'
require './lib/player'

describe Board do
  subject { Board.new(order) }
  before {@player1 = Player.new('Player1','X')}
  before {@player2 = Player.new('Player2','0')}
  before { @game =Game.new([@player1, @player2], 3) }

  context '#row_check?' do
    let(:order) { 3 }

    it 'returns true if there is a row win combination' do
      place = subject.move_empty?(1)
      subject.place_move(place, 'X')
      place = subject.move_empty?(2)
      subject.place_move(place, 'X')
      place = subject.move_empty?(3)
      subject.place_move(place, 'X')

      expect(subject.row_check?('X')).to eql(true)
    end
  end

  context '#column_check?' do
    let(:order) { 3 }
    it 'returns true if there is a column win combination' do
      place = subject.move_empty?(1)
      subject.place_move(place, 'X')
      place = subject.move_empty?(4)
      subject.place_move(place, 'X')
      place = subject.move_empty?(7)
      subject.place_move(place, 'X')

      expect(subject.column_check?('X')).to eql(true)
    end
  end

  context '#diagonal_checkI?' do
    let(:order) { 3 }
    it 'returns true if there is a diagonal win combination: diagonal I' do
      place = subject.move_empty?(1)
      subject.place_move(place, 'X')
      place = subject.move_empty?(5)
      subject.place_move(place, 'X')
      place = subject.move_empty?(9)
      subject.place_move(place, 'X')

      expect(subject.diagonal_check?('X')).to eql(true)
    end
  end

  context '#diagonal_checkII?' do
    let(:order) { 3 }
    it 'returns true if there is a diagonal win combination: diagonal II' do
      place = subject.move_empty?(3)
      subject.place_move(place, 'X')
      place = subject.move_empty?(5)
      subject.place_move(place, 'X')
      place = subject.move_empty?(7)
      subject.place_move(place, 'X')

      expect(subject.diagonal_check?('X')).to eql(true)
    end
  end

  context '#input_validation?' do
    let(:order) { 3 }

    it 'returns array if valid move is made' do
      expect(subject.move_empty?(1).class).to eql(Array)
    end

    it 'returns Integer value if repeated move is made' do
      place = subject.move_empty?(1)
      subject.place_move(place, 'X')
      expect(subject.move_empty?(1)).to eql(1)
    end

    it 'returns Integer value if Invalid move is made' do
      expect(subject.move_empty?(10)).to eql(10)
    end
  end

  context '#draw_and win_condition' do
    it 'returns 0 when game is drawn' do
      expect(@game.display_result(nil,0)).to eql(0)
      end

    it 'returns 1 when game is won' do
      expect(@game.display_result(@player1,1)).to eql(1)
    end
  end

  context '#increments_player_score' do
    it 'returns 1 when player scores' do
      expect(@player1.increment_score).to eql(1)
    end
  end
  
end
