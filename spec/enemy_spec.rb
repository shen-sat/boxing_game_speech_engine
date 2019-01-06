require_relative '../lib/enemy.rb'

describe 'enemy class' do

  let(:nunes) {Enemy.new}
  let(:cyborg) {Enemy.new}
  let(:pair) {[nunes, cyborg].to_set}
  let(:fight_record) {{pair => {:last_fight_winner => nunes,
                                nunes => {:no_of_wins => 1},
                                cyborg => {:no_of_wins => 0}
  }}}

	it 'should form a query' do
		nunes_query = nunes.build_query(cyborg, fight_record)
    expect(nunes_query.fighter).to eq(nunes)
    expect(nunes_query.opponent).to eq(cyborg)
    expect(nunes_query.history[:last_fight_winner]).to eq(nunes)
    expect(nunes_query.history[cyborg][:no_of_wins]).to eq(0)


	end
	
end