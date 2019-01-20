class TrashTalkProcessor
  attr_reader :rules

  def initialize(rules)
    @rules = order_rules_by_score(rules)
  end

  def order_rules_by_score(rules)
    ordered_rules = rules.sort_by {|key| key}.to_h.to_a.reverse.to_h
    return ordered_rules

  end

  def process(checks)
    responses = []
    score_check = 0
    rules.each do |key, value|
      break if key[0] < score_check
      eval_key = format_key(key)
      if (eval eval_key)
        responses << rules[key]
        score_check = key[0]
      end
    end
    if responses.size == 1
      return responses[0].sample
    else
      return responses.sample.sample
    end
  end

  def format_key(key)
    first_pass = key[1].split(" ").each {|word| word.insert(0, "checks.") unless ((word.include?("&") || word.include?("!")))}
    second_pass = first_pass.each {|word| word.delete!("!").insert(0, "!checks.") if word.include?("!")}
    return second_pass.join(" ")
  end

end