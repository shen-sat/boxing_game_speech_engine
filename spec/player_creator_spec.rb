require_relative '../lib/player_creator.rb'

describe 'Player Creator class' do





  it 'should create a default player with no relevant args' do
    command_line_args = "irrelevant-args"
    player_creator = PlayerCreator.new(command_line_args)

    player = player_creator.create

    expect(player.name).to eq('Sugar')
    expect(player.lastname).to eq('Shamps')
    expect(player.nickname).to eq('Shambles')
    expect(player.age).to eq(18)
    expect(player.rank).to eq(20)
    expect(player.no_of_fights).to eq(1)
  end

  it 'should create an inputted player with relevant args' do
    command_line_args = "player"
    player_creator = PlayerCreator.new(command_line_args)
    # allow(STDIN).to receive(:gets) {'Balboa'}
    # allow(STDIN).to receive(:gets) {'Fictional'}
    # allow(STDIN).to receive(:gets) {'28'}
    # allow(STDIN).to receive(:gets) {'20'}
    # allow(STDIN).to receive(:gets) {'10'}
    allow(STDIN).to receive(:gets).and_return('Rocky', 'Balboa', 'Fictional', '19', '30', '2')

    player = player_creator.create

    expect(player.name).to eq('Rocky')
    expect(player.lastname).to eq('Balboa')
    expect(player.nickname).to eq('Fictional')
    expect(player.age).to eq(19)
    expect(player.rank).to eq(30)
    expect(player.no_of_fights).to eq(2)

  end



end