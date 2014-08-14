class Line
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    line_list = []
    results = DB.exec("SELECT * FROM lines;")
    results.each do |result|
      line_list << Line.new({:name => result['name'], :id => result['id'].to_i})
    end
    line_list
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_line)
    self.name == another_line.name && self.id == another_line.id
  end
end
