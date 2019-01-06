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

end