require 'spec_helper'

describe Stops do
  it "initializes the object" do
    stop_1 = Stops.new({:station_id => 2, :line_id => 3})
    expect(stop_1).to be_an_instance_of Stops
  end
end
