class Station
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:name]
  end

  def self.all
    list = []
  end
end
