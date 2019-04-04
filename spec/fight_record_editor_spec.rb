require_relative '../lib/fight_record_editor.rb'
require_relative '../lib/enemy_builder.rb'
require 'set'

describe 'Fight Record Editor class' do

  fight_record = {}
  miyazaki = EnemyBuilder.new.set_name('miyazaki').build
  kronos = EnemyBuilder.new.set_name('kronos').build
  player = Player.new
  player.name = 'player'
  mk = [miyazaki, kronos].to_set
  kp = [kronos, player].to_set
  mp = [miyazaki, player].to_set

  #Set up fight record
  before(:each) do
    fight_record[mk] = {}
    fight_record[kp] = {}
    fight_record[mp] = {}
    fight_record[mk][:last_fight_winner] = nil
    fight_record[mk][:last_fight_win_method] = 'KO'
    fight_record[kp][:last_fight_winner] = kronos
    fight_record[kp][:last_fight_win_method] = 'Decision'
    fight_record[mp][:last_fight_winner] = miyazaki
    fight_record[mp][:last_fight_win_method] = nil
  end

  it 'should initialize with a fight record' do
    fight_record_editor = FightRecordEditor.new(fight_record)
    expect(fight_record_editor.fight_record).to eq(fight_record)
  end

  it 'display the pairs in the fight record as a menu' do
    fight_record_editor = FightRecordEditor.new(fight_record)
    expect(STDOUT).to receive(:puts).with('Which pair do you want to edit?')
    expect(STDOUT).to receive(:puts).with('[0] miyazaki and kronos')
    expect(STDOUT).to receive(:puts).with('[1] kronos and player')
    expect(STDOUT).to receive(:puts).with('[2] miyazaki and player')
    fight_record_editor.show_menu_pairs
  end

  it 'should display the fight record for a pair as a numbered menu' do
    fight_record_editor = FightRecordEditor.new(fight_record)
    expect(STDOUT).to receive(:puts).with('Which record do you want to edit?')
    expect(STDOUT).to receive(:puts).with("[0] last_fight_winner: kronos")
    expect(STDOUT).to receive(:puts).with("[1] last_fight_win_method: Decision")
    choice = 1
    fight_record_editor.show_menu_pair_fight_record(choice)
  end

  it 'should edit last fight winner where scenario is last fight winner is a fighter' do
    #Given
    fight_record_editor = FightRecordEditor.new(fight_record)
    selected_pair = 2


    #Then part 1

    expect(STDOUT).to receive(:puts).with('Last fight winner is currently miyazaki')
    expect(STDOUT).to receive(:puts).with('What would you like the value to be?')
    expect(STDOUT).to receive(:puts).with("[0] miyazaki")
    expect(STDOUT).to receive(:puts).with("[1] player")

    #When
    expect(fight_record_editor.fight_record[mp][:last_fight_winner]).to eq(miyazaki)
    last_fight_winner = "1"
    allow(STDIN).to receive(:gets) { last_fight_winner }
    fight_record_editor.edit_last_fight_winner(selected_pair)

    #Then part 2
    expect(fight_record_editor.fight_record[mp][:last_fight_winner]).to eq(player)

  end

  it 'should edit last fight winner where scenario is last fight winner is nil' do
    #Given
    fight_record_editor = FightRecordEditor.new(fight_record)
    choice = 0

    #Then part 1

    expect(STDOUT).to receive(:puts).with('There is currently no last fight winner')
    expect(STDOUT).to receive(:puts).with('What would you like the value to be?')
    expect(STDOUT).to receive(:puts).with("[0] miyazaki")
    expect(STDOUT).to receive(:puts).with("[1] kronos")

    #When
    expect(fight_record_editor.fight_record[mk][:last_fight_winner]).to eq(nil)
    allow(STDIN).to receive(:gets) {"1"}
    fight_record_editor.edit_last_fight_winner(choice)

    #Then part 2
    expect(fight_record_editor.fight_record[mk][:last_fight_winner]).to eq(kronos)

  end


end