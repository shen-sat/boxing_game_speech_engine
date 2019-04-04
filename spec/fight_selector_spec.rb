require_relative '../lib/fight_selector'

describe 'fight selector class' do

  let(:leonardo)  { double("leonardo") }
  let(:raphael)   { double("raphael") }
  let(:donatello) { double("donatello") }
  let(:roster)    { [leonardo, raphael, donatello] }

  it 'should select fighters for press conference' do
    allow(leonardo).to receive(:name) { 'leonardo' }
    allow(leonardo).to receive(:lastname) { 'blue' }
    allow(leonardo).to receive(:nickname) { 'leads' }
    allow(raphael).to receive(:name) { 'raphael' }
    allow(raphael).to receive(:lastname) { 'red' }
    allow(raphael).to receive(:nickname) { 'cool' }
    allow(donatello).to receive(:name) { 'donatello' }
    allow(donatello).to receive(:lastname) { 'purple' }
    allow(donatello).to receive(:nickname) { 'machines' }
    fight_selector = FightSelector.new(roster)
    expect(STDOUT).to receive(:puts).with('Who do you want to select?')
    expect(STDOUT).to receive(:puts).with('First fighter:')
    expect(STDOUT).to receive(:puts).with("[0] leonardo 'leads' blue")
    expect(STDOUT).to receive(:puts).with("[1] raphael 'cool' red")
    expect(STDOUT).to receive(:puts).with("[2] donatello 'machines' purple")
    allow(STDIN).to receive_message_chain(:gets, :chomp, :to_i).and_return(1)
    expect(STDOUT).to receive(:puts).with('Now select second fighter:')
    expect(STDOUT).to receive(:puts).with("[0] leonardo 'leads' blue")
    expect(STDOUT).to receive(:puts).with("[1] donatello 'machines' purple")
    allow(STDIN).to receive_message_chain(:gets, :chomp, :to_i).and_return(1)
    expect(STDOUT).to receive(:puts).with("You chose raphael and donatello")
    expect(fight_selector.select).to eq([raphael, donatello])
  end


end