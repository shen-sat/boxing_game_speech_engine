class TrashTalkProcessor
  attr_reader :rules

  def initialize(rules)
    @rules = order_rules_by_score(rules)
  end

  def order_rules_by_score(rules)
    ordered_rules = rules.sort_by {|rule| rule}.to_h.to_a.reverse.to_h
    return ordered_rules

  end

  def process(queries)
    responses = []
    score_check = 0
    rules.each do |rule, response|
      break if rule[0] < score_check
      if rule_matches_a_query?(rule, queries)
        responses << response
        score_check = rule[0]
      end
    end
    return_a_response(responses)
  end

  def format_key(rule)
    first_pass = rule[1].split(" ").each {|word| word.insert(0, "queries.") unless ((word.include?("&") || word.include?("!")))}
    second_pass = first_pass.each {|word| word.delete!("!").insert(0, "!queries.") if word.include?("!")}
    return second_pass.join(" ")
  end

  def rule_matches_a_query?(rule, queries)
    eval_key = format_key(rule)
    return eval eval_key
  end

  def return_a_response(responses)
    if responses.size == 1
      return responses[0].sample
    else
      return responses.sample.sample
    end
  end

end