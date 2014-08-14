require 'pg'
require 'rspec'
require './lib/stations'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
  end
end
