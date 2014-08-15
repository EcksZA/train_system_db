class Stops
  attr_reader :station_id, :line_id, :id

  def initialize(attributes)
    @station_id = attributes[:station_id]
    @line_id = attributes[:line_id]
    @id = attributes[:id]
  end

  def self.all
    stops_list = []
    results = DB.exec("SELECT * FROM stops;")
    results.each do |result|
      stops_list << Stops.new({:station_id => result['station_id'].to_i, :line_id => result['line_id'].to_i, :id => result['id'].to_i})
    end
    stops_list
  end

  def save
    results = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{self.station_id}, #{self.line_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_stop)
    self.id == another_stop.id
  end
end
