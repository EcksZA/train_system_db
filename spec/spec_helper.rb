require 'pg'
require 'rspec'
require './lib/stations'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
<<<<<<< Updated upstream
=======
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
>>>>>>> Stashed changes
  end
end
