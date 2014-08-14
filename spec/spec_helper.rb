require 'pg'
require 'rspec'
require 'stations'

DB = PG.connect(:dbname => 'train_system_test')

RSpec.configure do |config|
  config.after(:each) do
  end
end
