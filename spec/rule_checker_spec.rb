require_relative '../lib/rule_checker.rb'

describe 'RuleChecker class' do

  let(:holly) {double("holly")}
  let(:ronda) {double("ronda")}
  let(:pair) {[holly, ronda].to_set}
  let(:fight_record) {{pair => {:last_fight_winner => nil,
                                holly => {:no_of_wins => 1},
                                ronda => {:no_of_wins => 0}
  }}}

    it 'should initialise with  fighter, opponent, and history attributes' do
      rule_checker = RuleChecker.new(holly, ronda, fight_record)
      expect(rule_checker.fighter).to eq(holly)
      expect(rule_checker.opponent).to eq(ronda)
      expect(rule_checker.history).to eq(fight_record[pair])
    end

    # it 'should check for older opponent' do
    #   rule_checker = RuleChecker.new(query)
    #   allow(rule_checker).to receive(:opponent_is_older) {false}
    #   expect(rule_checker.opponent_is_older).to eq(false)
    # end

end