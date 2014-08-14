class Station
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    stations_list = []
    results = DB.exec("SELECT * FROM stations;")
    results.each do |result|
      stations_list << Station.new({:name => result['name'], :id => result['id'].to_i})
    end
    stations_list
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_station)
    self.name == another_station.name && self.id == another_station.id
  end

  def edit(user_input)
    DB.exec("UPDATE stations SET name='#{user_input}' WHERE id=#{self.id};")
  end

  def remove
    DB.exec("DELETE FROM stations WHERE name='#{self.name}'")
  end
end
