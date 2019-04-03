require_relative '../lib/fight_record_editor.rb'
require_relative '../lib/enemy_builder.rb'
require 'set'

describe 'Fight Record Editor class' do

  #Set up fight record
  miyazaki = EnemyBuilder.new.set_name('miyazaki').build
  kronos = EnemyBuilder.new.set_name('kronos').build
  player = Player.new
  player.name = 'player'
  mk = [miyazaki, kronos].to_set
  kp = [kronos, player].to_set
  mp = [miyazaki, player].to_set
  fight_record = {}
  fight_record[mk] = {}
  fight_record[kp] = {}
  fight_record[mp] = {}
  fight_record[mk][:last_fight_winner] = miyazaki
  fight_record[mk][:last_fight_win_method] = 'KO'
  fight_record[kp][:last_fight_winner] = kronos
  fight_record[kp][:last_fight_win_method] = 'Decision'
  fight_record[mp][:last_fight_winner] = player
  fight_record[mp][:last_fight_win_method] = nil

  it 'should initialize with a fight record' do
    fight_record_editor = FightRecordEditor.new(fight_record)
    expect(fight_record_editor.fight_record).to eq(fight_record)
  end

  it 'display the pairs in the fight record as a menu' do
    fight_record_editor = FightRecordEditor.new(fight_record)
    expect(STDOUT).to receive(:puts).with('[0] miyazaki and kronos')
    expect(STDOUT).to receive(:puts).with('[1] kronos and player')
    expect(STDOUT).to receive(:puts).with('[2] miyazaki and player')
    fight_record_editor.show_menu_pairs
  end


end