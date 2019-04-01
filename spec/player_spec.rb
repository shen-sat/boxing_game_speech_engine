require_relative '../lib/player.rb'

describe 'Player class' do

  let(:player) { Player.new }


  it 'should trash talk by getting input' do
    allow(STDIN).to receive(:gets) {"I will win"}
    input = player.trash_talk
    expect(input).to eq("I will win")

  end

end