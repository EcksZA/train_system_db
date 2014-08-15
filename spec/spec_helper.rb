require 'pg'
require 'rspec'
require './lib/stations'
require './lib/lines'
require './lib/stops'
require './lib/trains'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stops *;")
    DB.exec("DELETE FROM trains *;")
  end
end
