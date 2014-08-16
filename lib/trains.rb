class Train
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    trains_list = []
    results = DB.exec("SELECT * FROM trains;")
    results.each do |result|
      trains_list << Train.new({:name => result['name'], :id => result['id'].to_i})
    end
    trains_list
  end

  def save
    results = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_train)
    self.name == another_train.name && self.id == another_train.id
  end

  def edit(user_input)
    DB.exec("UPDATE trains SET name='#{user_input}' WHERE id=#{self.id};")
  end
end
