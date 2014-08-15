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

  it "saves all the stops" do
    stop_1 = Stops.new({:station_id => 2, :line_id => 3})
    stop_1.save
    expect(Stops.all).to eq [stop_1]
  end

  it "makes two equal objects at different addresses equal to each other" do
    stop_1 = Stops.new({:station_id => 2, :line_id => 3})
    stop_1.save
    expect(Stops.all[0]).to eq stop_1
  end

  it "allows for edits to be made to the stop" do
    stop_1 = Stops.new({:station_id => 2, :line_id => 3})
    stop_1.save
    stop_1.edit(3, 5)
    expect(Stops.all[0].station_id).to eq 3
    expect(Stops.all[0].line_id).to eq 5
  end

end
