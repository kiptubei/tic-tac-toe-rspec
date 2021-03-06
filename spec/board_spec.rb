# spec/board_spec.rb

require './lib/board'
require './lib/game'
require './lib/player'

describe Board do
  subject { Board.new(order) }


  describe '#row_check?' do
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

  describe '#column_check?' do
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

  describe '#diagonal_checkI?' do
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

  describe '#diagonal_checkII?' do
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

  describe '#input_validation?' do
    let(:order) { 3 }

    it 'returns array if valid move is made' do
      expect(subject.move_empty?(1).class).to eql(Array)
    end

    it 'returns an Integer value if repeated move is made' do
      place = subject.move_empty?(1)
      subject.place_move(place, 'X')
      expect(subject.move_empty?(1)).to eql(1)
    end

    it 'returns Integer value if Invalid move is made' do
      expect(subject.move_empty?(10)).to eql(10)
    end
  end
end
