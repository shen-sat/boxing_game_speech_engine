require_relative '../lib/snapshot.rb'

describe 'Query class' do

  let(:holly) {double("holly")}
  let(:ronda) {double("ronda")}
  let(:pair) {[holly, ronda].to_set}
  let(:fight_record) {{pair => {:last_fight_winner => holly,
                                :last_fight_win_method => 'KO',
                                :last_fight_no_of_rounds => 3,
  }}}

  it 'should initialise with  fighter, opponent, and history attributes' do
    query = Snapshot.new(holly, ronda, fight_record)
    expect(query.fighter).to eq(holly)
    expect(query.opponent).to eq(ronda)
    expect(query.history).to eq(fight_record[pair])
  end

  it 'should have access to all history data' do
    query = Snapshot.new(holly, ronda, fight_record)
    expect(query.history[:last_fight_winner]).to eq(holly)
    expect(query.history[:last_fight_win_method]).to eq('KO')
    expect(query.history[:last_fight_no_of_rounds]).to eq(3)

  end

  it 'should successfully assess if opponent has few fights' do
    allow(holly).to receive(:no_of_fights) {2}
    query = Snapshot.new(ronda, holly, fight_record)
    expect(query.opponent_has_few_fights).to eq(true)
  end

  it 'should successfully assess if opponent is top ranked' do
    allow(ronda).to receive(:rank) {0}
    query = Snapshot.new(holly, ronda, fight_record)
    expect(query.opponent_is_top_ranked).to eq(true)
  end

  it 'should successfully assess if opponent won last fight' do
    query = Snapshot.new(ronda, holly, fight_record)
    expect(query.opponent_won_last_fight).to eq(true)
  end

  it 'should successfully assess if fighter is about to retire' do
    allow(ronda).to receive(:no_of_fights) {31}
    allow(ronda).to receive(:age) {40}
    query = Snapshot.new(ronda, holly, fight_record)
    expect(query.fighter_about_to_retire).to eq(true)
  end

  it 'should successfully assess if fighter is champ' do
    allow(holly).to receive(:rank) {0}
    query = Snapshot.new(holly, ronda, fight_record)
    expect(query.fighter_is_champ).to eq(true)
  end

  it 'should successfully assess if opponent is young' do
    allow(ronda).to receive(:age) {18}
    query = Snapshot.new(holly, ronda, fight_record)
    expect(query.opponent_is_young).to eq(true)
  end

end