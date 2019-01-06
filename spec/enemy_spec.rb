require_relative '../lib/enemy.rb'
require_relative '../lib/trash_talk_processor.rb'

describe 'enemy class' do

  let(:nunes) {Enemy.new}
  let(:cyborg) {Enemy.new}
  let(:pair) {[nunes, cyborg].to_set}
  let(:fight_record) {{pair => {:last_fight_winner => nunes,
                                nunes => {:no_of_wins => 1},
                                cyborg => {:no_of_wins => 0}
  }}}
  rules =
      {[1, "fighter_is_champ"] => {
                                  true => [ "The belt belongs to me!" ]
                                  }
      }

  trash_talk_processor = TrashTalkProcessor.new(rules)

  it 'should form a query' do
    nunes_query = nunes.build_query(cyborg, fight_record)
    expect(nunes_query.fighter).to eq(nunes)
    expect(nunes_query.opponent).to eq(cyborg)
    expect(nunes_query.history[:last_fight_winner]).to eq(nunes)
    expect(nunes_query.history[cyborg][:no_of_wins]).to eq(0)
  end

  it 'should trash talk' do
    another_nunes_query = double("another_nunes_query")
    allow(another_nunes_query).to receive(:fighter_is_champ) {true}
    nunes_trash_talk = nunes.trash_talk(another_nunes_query, trash_talk_processor)
    expect(nunes_trash_talk).to eq("The belt belongs to me!")
  end


end