class Line
  attr_reader :name, :id
  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    line_list = []
  end
end
