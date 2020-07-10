# spec/main_spec.rb

require './bin/main'

describe Game do
  context '#get_input' do
    it 'returns Invalid if name is Integer' do
      ans = get_input(1)
      expect(ans).to eql(puts('Invalid name, try again'))
    end
  end
end
