require_relative '../lib/press_conference.rb'

describe 'PressConference class' do

  let(:dillashaw) { double("dillashaw") }
  let(:cejudo) { double("cejudo") }
  let(:fighters) { [dillashaw, cejudo] }
  let(:player) { Player.new }
  let(:fighters_with_player) { [player, cejudo] }

  let(:fight_record) { double("fight_record") }
  let(:query) { double("query") }
  let(:trash_talk_processor) { double("trash_talk_processor") }




  it 'should form a query for fighter from fighter POV' do
    press_conference = PressConference.new(fighters, fight_record, trash_talk_processor)
    stub_puts_statements(press_conference)
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

  it 'should ask fighter for their input if they are a player' do
    press_conference = PressConference.new(fighters_with_player, fight_record, trash_talk_processor)
    expect(player).to receive(:trash_talk)
    stub_puts_statements(press_conference)
    press_conference.give_mic(player, cejudo)
  end

  
  def stub_puts_statements(press_conference)
    #this line just stubs the narration in the give_mic method, thus removing its puts statement from console output
    allow(press_conference).to receive(:narration)
    #this line also stubs the dotted line in the give_mic method and removes its puts statement from console output
    allow(press_conference).to receive(:insert_dotted_line)
  end
  
  

end