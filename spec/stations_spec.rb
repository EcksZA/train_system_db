require 'spec_helper'
require 'stations'

describe Station do
  it "initializes the stations object" do
    station_1 = Station.new({:name => "Rosebank"})
    expect(station_1).to be_an_instance_of Station
  end

  it "outputs the name of the station of the station" do
    station_1 = Station.new({:name => "Rosebank"})
    expect(station_1.name).to eq "Rosebank"
  end

  it "creates an empty array to store the stations" do
    expect(Station.all).to eq []
  end

  it "saves a new station into the stations array" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    expect(Station.all).to eq [station_1]
  end

  it "makes two objects that are the same equal to each other" do
    station_1 = Station.new({:name => "Rosebank"})
    station_1.save
    expect(Station.all[0]).to eq station_1
  end
end
