class Tea
  attr_reader :id,
              :name,
              :description,
              :keywords,
              :origin,
              :brew_time,
              :temperature

  def initialize(attributes)
    @id = attributes[:_id]
    @name = attributes[:name]
    @description = attributes[:description]
    @keywords = attributes[:keywords]
    @origin = attributes[:origin]
    @brew_time = attributes[:brew_time]
    @temperature = attributes[:temperature]
  end
end
