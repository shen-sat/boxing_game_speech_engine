require_relative '../lib/query.rb'

describe 'Query class' do

  let(:holly) {double("holly")}
  let(:ronda) {double("ronda")}
  let(:pair) {[holly, ronda].to_set}
  let(:fight_record) {{pair => {:last_fight_winner => holly,
                                :last_fight_win_method => 'KO',
                                :last_fight_no_of_rounds => 3,
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
      expect(query.history[:last_fight_win_method]).to eq('KO')
      expect(query.history[:last_fight_no_of_rounds]).to eq(3)

      end

    it 'should successfully assess if an opponent is younger' do
      allow(holly).to receive(:age) {40}
      allow(ronda).to receive(:age) {29}
      query = Query.new(holly, ronda, fight_record)
      expect(query.opponent_is_younger).to eq(true)
      end

  it 'should successfully assess if an opponent is older' do
      allow(holly).to receive(:age) {40}
      allow(ronda).to receive(:age) {29}
      query = Query.new(ronda, holly, fight_record)
      expect(query.opponent_is_older).to eq(true)
    end



  # it 'should successfully assess if an opponent is ranked lower' do
  #   allow(holly).to receive(:rank) {0}
  #   allow(ronda).to receive(:rank) {2}
  #   query = Query.new(holly, ronda, fight_record)
  #   expect(query.opponent_is_lower_ranked).to eq(true)
  #   expect(query.opponent_is_higher_ranked).to eq(false)
  #
  # end

  # it 'should successfully asses if an opponent is ranked higher' do
  #   allow(holly).to receive(:rank) {0}
  #   allow(ronda).to receive(:rank) {2}
  #   query = Query.new(ronda, holly, fight_record)
  #   expect(query.opponent_is_lower_ranked).to eq(false)
  #   expect(query.opponent_is_higher_ranked).to eq(true)
  # end

end