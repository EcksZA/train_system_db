class Station
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    stations_list = []
    results = DB.exec("SELECT * FROM stations")
    results.each do |result|
      stations_list << Station.new({:name => result['name'], :id => result['id'].to_i})
    end
    stations_list
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
end
