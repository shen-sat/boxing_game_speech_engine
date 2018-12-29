require_relative '../lib/rule_checker.rb'

describe 'RuleChecker class' do

  let(:holly) {double("holly")}
  let(:ronda) {double("ronda")}
  let(:query) {{:fighter => holly,
                :opponent => ronda,
                :history => {
                    :last_fight_winner => holly
                }
  }}


  it 'should initialise with query and create fighter, opponent, fight record and pair attributes' do
    rule_checker = RuleChecker.new(query)
    expect(rule_checker.fighter).to eq(holly)
    expect(rule_checker.opponent).to eq(ronda)
    expect(rule_checker.history).to eq(query[:history])
  end

  it 'should check for older opponent' do
    rule_checker = RuleChecker.new(query)
    allow(rule_checker).to receive(:opponent_is_older) {false}
    expect(rule_checker.opponent_is_older).to eq(false)
  end

end