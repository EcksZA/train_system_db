require 'pg'
require 'rspec'
require 'stations'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
  end
end
