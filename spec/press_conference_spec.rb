require_relative '../lib/press_conference.rb'

describe 'PressConference class' do

  let(:fighter) { double("fighter") }
  let(:opponent) { double("opponent") }
  let(:fighters) { [fighter, opponent] }

  let(:fight_record) { double("fight_record") }
  let(:query) { double("query") }
  let(:trash_talk_processor) { double("trash_talk_processor") }


  it 'should form a query for fighter from fighter POV' do
    press_conference = PressConference.new(fighters, fight_record, trash_talk_processor)
    expect(fighter).to receive(:build_query).with(opponent, fight_record) { query }
    expect(fighter).to receive(:trash_talk).with(query, trash_talk_processor)
    press_conference.give_mic(fighter, opponent)

  end

end