require 'spec_helper'

describe Stops do
  it "initializes the object" do
    stop_1 = Stops.new({:station_id => 2, :line_id => 3})
    expect(stop_1).to be_an_instance_of Stops
  end

  it "lists out the arguments of the object" do
    stop_1 = Stops.new({:station_id => 2, :line_id => 3})
    expect(stop_1.station_id).to eq 2
    expect(stop_1.line_id).to eq 3
  end

  it "creates an empty array to store the stops" do
    expect(Stops.all).to eq []
  end
end
