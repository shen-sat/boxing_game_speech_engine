require_relative '../lib/query.rb'

describe 'Query class' do

  let(:holly) {double("holly")}
  let(:ronda) {double("ronda")}
  let(:pair) {[holly, ronda].to_set}
  let(:fight_record) {{pair => {:last_fight_winner => holly,
                                holly => {:no_of_wins => 1},
                                ronda => {:no_of_wins => 0}
  }}}

    it 'should initialise with  fighter, opponent, and history attributes' do
      query = Query.new(holly, ronda, fight_record)
      expect(query.fighter).to eq(holly)
      expect(query.opponent).to eq(ronda)
      expect(query.history).to eq(fight_record[pair])
    end

    it 'should have access to all history data' do
      query = Query.new(holly, ronda, fight_record)
      expect(query.history[:last_fight_winner]).to eq(holly)
      expect(query.history[ronda][:no_of_wins]).to eq(0)

    end

  it 'should successfully assess if an opponent is ranked lower' do
    allow(holly).to receive(:rank) {0}
    allow(ronda).to receive(:rank) {2}
    query = Query.new(holly, ronda, fight_record)
    expect(query.opponent_is_lower_ranked).to eq(true)
    expect(query.opponent_is_higher_ranked).to eq(false)

  end

  it 'should successfully asses if an opponent is ranked higher' do
    allow(holly).to receive(:rank) {0}
    allow(ronda).to receive(:rank) {2}
    query = Query.new(ronda, holly, fight_record)
    expect(query.opponent_is_lower_ranked).to eq(false)
    expect(query.opponent_is_higher_ranked).to eq(true)
  end

end