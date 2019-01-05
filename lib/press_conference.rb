class PressConference
  attr_reader :query_builder

  def initialize
    @query_builder = QueryBuilder.new
  end
end