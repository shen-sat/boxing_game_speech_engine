require_relative '../lib/press_conference.rb'

describe 'PressConference class' do

  let(:dillashaw) { double("dillashaw") }
  let(:cejudo) { double("cejudo") }
  let(:fighters) { [dillashaw, cejudo] }

  let(:fight_record) { double("fight_record") }
  let(:query) { double("query") }
  let(:trash_talk_processor) { double("trash_talk_processor") }


  it 'should form a query for fighter from fighter POV' do
    press_conference = PressConference.new(fighters, fight_record, trash_talk_processor)
    expect(dillashaw).to receive(:build_query).with(cejudo, fight_record).ordered { query }
    expect(dillashaw).to receive(:trash_talk).with(query, trash_talk_processor).ordered
    press_conference.give_mic(dillashaw, cejudo)
    end
  
  it 'should give each fighter a chance to trash talk' do
    press_conference = PressConference.new(fighters, fight_record, trash_talk_processor)
    expect(press_conference).to receive(:give_mic).with(dillashaw, cejudo).ordered
    expect(press_conference).to receive(:give_mic).with(cejudo, dillashaw).ordered
    press_conference.start
  end
  
  

end